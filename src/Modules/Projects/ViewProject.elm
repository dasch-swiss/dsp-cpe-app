module Modules.Projects.ViewProject exposing (..)

import BlueBoxes.NewExecutor as NewExecutor
import Browser.Navigation as Nav
import Html exposing (Html, div, h3, text)
import Html.Attributes exposing (class)
import Http
import Modules.Projects.Project exposing (Project, ProjectId, idToString, projectDecoder)
import Modules.Projects.TestPage as TestPage
import Modules.Text.ProjectDescription as ProjectDescription
import RemoteData exposing (WebData)
import Shared.SharedTypes exposing (WidgetInstanceId(..))
import Util.Error exposing (buildErrorMessage)


type alias Model =
    { project : WebData Project
    , projectDescription : ProjectDescription.Model
    , navKey : Nav.Key
    }


type Msg
    = FetchProject ProjectId
    | ProjectReceived (WebData Project)
    | ProjectDescriptionMsg ProjectDescription.Msg


initialModel : ProjectDescription.Model -> Nav.Key -> Model
initialModel projDescModel navKey =
    { navKey = navKey
    , project = RemoteData.Loading
    , projectDescription = projDescModel
    }


init : ProjectId -> Nav.Key -> ( Model, Cmd Msg )
init projectId navKey =
    let
        ( projModel, projCmd ) =
            NewExecutor.executeNewProjectDescription (WidgetInstanceId 9001)
    in
    ( initialModel projModel navKey, Cmd.batch [ fetchProject projectId, Cmd.map ProjectDescriptionMsg projCmd ] )


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

        ProjectDescriptionMsg projDescMsg ->
            let
                (newModel, newCmd) = ProjectDescription.update projDescMsg model.projectDescription
            in
                ( {model | projectDescription = newModel}, Cmd.map ProjectDescriptionMsg newCmd )

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
                ProjectDescription.view model.projectDescription |> Html.map ProjectDescriptionMsg

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
