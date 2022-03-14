module Projects.ViewProject exposing (..)

import Browser.Navigation as Nav
import Error exposing (buildErrorMessage)
import Html exposing (Html, div, text, h3)
import Html.Attributes exposing (class)
import Http
import Projects.Project exposing (Project, ProjectId, projectDecoder, idToString)
import RemoteData exposing (WebData)

type alias Model =
    { project : WebData Project
    , navKey : Nav.Key
    }

type Msg
    = FetchProject ProjectId
    | ProjectReceived (WebData Project)

initialModel : Nav.Key -> Model
initialModel navKey =
    { navKey = navKey
    , project = RemoteData.Loading
    }

init : ProjectId -> Nav.Key -> ( Model, Cmd Msg )
init projectId navKey =
    ( initialModel navKey, fetchProject projectId )

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

view : Model -> Html Msg
view model =
    div [] [ viewProject model.project ]

viewProject : WebData Project -> Html Msg
viewProject project =
    case project of
        RemoteData.NotAsked ->
            text ""

        RemoteData.Loading ->
            h3 [] [ text "Loading Project..." ]

        RemoteData.Success currentProject ->
            div [ class "project" ]
                [ div [ class "header"] [ text currentProject.title]
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