module Projects.ViewProject exposing (..)

import BlueBoxes.Executor as Executor
import BlueBoxes.GuiElement as GuiElement
import BlueBoxes.PageStructureModel as Struct
import BlueBoxes.PageStructureService as PageStructureService
import Browser.Navigation as Nav
import DspCpeApi as Api
import Html exposing (Html, div, h3, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Http
import Projects.Project exposing (Project, ProjectId, idToString, projectDecoder)
import RemoteData exposing (WebData)
import Shared.SharedTypes exposing (WidgetInstanceId(..))
import Util.Error exposing (buildErrorMessage)
import Util.Icon as Icon


type alias Model =
    { project : WebData Project
    , guiElements : List GuiElement.Model
    , navKey : Nav.Key
    , pageCanvas : Struct.PageCanvas
    , editMode : Bool
    }


type Msg
    = FetchProject ProjectId
    | ProjectReceived (WebData Project)
    | GuiElementMsg GuiElement.Msg
    | ToggleEditModeMsg Bool


initialModel : List GuiElement.Model -> Nav.Key -> Model
initialModel guiElements navKey =
    { project = RemoteData.Loading
    , guiElements = guiElements
    , navKey = navKey
    , pageCanvas = { rowSpanMax = 8, colSpanMax = 8 }
    , editMode = False
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
            case guiElemMsg of
                GuiElement.WidgetContainerMsg wMsg ->
                    let
                        ( newGuiElements, newCmd ) =
                            GuiElement.updateWidgetContainers wMsg model.guiElements
                    in
                    ( { model | guiElements = newGuiElements }, Cmd.map GuiElementMsg newCmd )

                _ ->
                    let
                        ( newModel, newCmd ) =
                            deconstructGuiElementList (List.map (GuiElement.update guiElemMsg) model.guiElements)
                    in
                    ( { model | guiElements = newModel }, Cmd.map GuiElementMsg newCmd )

        ToggleEditModeMsg editMode ->
            ( { model | editMode = not editMode }, Cmd.none )


deconstructGuiElementList : List ( GuiElement.Model, Cmd GuiElement.Msg ) -> ( List GuiElement.Model, Cmd GuiElement.Msg )
deconstructGuiElementList list =
    ( List.map (\tuple -> Tuple.first tuple) list, Cmd.batch (List.map (\tuple -> Tuple.second tuple) list) )


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
                div []
                    [ Api.circularButton
                        { attrs =
                            [ onClick (ToggleEditModeMsg model.editMode) ]
                        , size = Shared.SharedTypes.CircularExtraSmall
                        , icon =
                            if model.editMode then
                                Icon.Check

                            else
                                Icon.ViewGridAdd
                        }
                    , div [ class ("grid grid-cols-" ++ String.fromInt model.pageCanvas.colSpanMax ++ " gap-4") ]
                        (GuiElement.renderGuiElements model.guiElements model.editMode)
                        |> Html.map GuiElementMsg
                    ]

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
