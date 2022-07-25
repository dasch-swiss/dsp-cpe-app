module Projects.ViewProject exposing (..)

import BlueBoxes.NewExecutor as Executor
import BlueBoxes.NewGuiElement as GuiElement
import BlueBoxes.NewPageStructreService as PageStructureService
import BlueBoxes.WidgetContainer as WidgetContainer
import Browser.Navigation as Nav
import Html exposing (Html, div, h3, text)
import Html.Attributes exposing (class, id)
import Http
import Projects.Project exposing (Project, ProjectId, idToString, projectDecoder)
import RemoteData exposing (WebData)
import Shared.SharedTypes exposing (WidgetInstanceId(..))
import Util.Error exposing (buildErrorMessage)


type alias Model =
    { project : WebData Project
    , guiElements : List GuiElement.Model
    , navKey : Nav.Key
    , pageCanvas : PageCanvas
    }


type alias PageCanvas =
    { rowSpanMax : Int, colSpanMax : Int }


type Msg
    = FetchProject ProjectId
    | ProjectReceived (WebData Project)
    | GuiElementMsg GuiElement.Msg
    | WidgetContainerMsg WidgetContainer.Msg


initialModel : List GuiElement.Model -> Nav.Key -> Model
initialModel guiElements navKey =
    { project = RemoteData.Loading
    , guiElements = guiElements
    , navKey = navKey
    , pageCanvas = { rowSpanMax = 8, colSpanMax = 8 }
    }


init : ProjectId -> Nav.Key -> ( Model, Cmd Msg )
init projectId navKey =
    let
        ( newModel, newCmd ) =
            Executor.execute (PageStructureService.getProjectByID 3)
    in
    ( initialModel newModel navKey, Cmd.batch [ fetchProject projectId, Cmd.map GuiElementMsg newCmd ] )


fetchProject : ProjectId -> Cmd Msg
fetchProject projectId =
    Http.get
        { url = "http://localhost:2022/projects/" ++ idToString projectId
        , expect =
            projectDecoder
                |> Http.expectJson (RemoteData.fromResult >> ProjectReceived)
        }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ProjectReceived project ->
            ( { model | project = project }, Cmd.none )

        FetchProject projectId ->
            ( { model | project = RemoteData.Loading }, fetchProject projectId )

        GuiElementMsg guiElemMsg ->
            let
                ( newModel, newCmd ) =
                    deconstructGuiElementList (List.map (GuiElement.update guiElemMsg) model.guiElements)
            in
            ( { model | guiElements = newModel }, Cmd.map GuiElementMsg newCmd )

        WidgetContainerMsg containerMsg ->
            let
                newModel =
                    updateWidgetContainers model.guiElements containerMsg
            in
            ( { model | guiElements = newModel }, Cmd.map GuiElementMsg Cmd.none )


deconstructGuiElementList : List ( GuiElement.Model, Cmd GuiElement.Msg ) -> ( List GuiElement.Model, Cmd GuiElement.Msg )
deconstructGuiElementList list =
    ( List.map (\tuple -> Tuple.first tuple) list, Cmd.batch (List.map (\tuple -> Tuple.second tuple) list) )


updateWidgetContainers : List GuiElement.Model -> WidgetContainer.Msg -> List GuiElement.Model
updateWidgetContainers guiElements containerMsg =
    -- simple list map -> update
    guiElements
        |> List.map
            (\e -> { variant = e.variant, widgetContainer = WidgetContainer.update containerMsg e.widgetContainer })


view : Model -> Html Msg
view model =
    div [] [ viewProject model ]


viewProject : Model -> Html Msg
viewProject model =
    case model.project of
        RemoteData.NotAsked ->
            text ""

        RemoteData.Loading ->
            h3 [] [ text "Loading Project..." ]

        RemoteData.Success currentProject ->
            if idToString currentProject.id == "3" then
                div [ class ("grid grid-cols-" ++ String.fromInt model.pageCanvas.colSpanMax ++ " gap-4") ]
                    (renderWidgets model.guiElements)

            else
                div [ class "project" ]
                    [ div [ class "header" ] [ text currentProject.title ]
                    , div [ class "info" ]
                        [ div [ class "label" ]
                            [ text "Description:" ]
                        , div [ class "content" ]
                            [ text currentProject.description ]
                        ]
                    ]

        RemoteData.Failure httpError ->
            viewFetchError (buildErrorMessage httpError)


renderWidgets : List GuiElement.Model -> List (Html Msg)
renderWidgets widgets =
    widgets
        |> List.map
            (\n ->
                GuiElement.view n
                    |> Html.map GuiElementMsg
            )


viewFetchError : String -> Html Msg
viewFetchError errorMessage =
    let
        errorHeading =
            "Couldn't fetch projects at this time."
    in
    div []
        [ h3 [] [ text errorHeading ]
        , text ("Error: " ++ errorMessage)
        ]
