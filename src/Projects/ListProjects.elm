module Projects.ListProjects exposing (..)

import Browser.Navigation as Nav
import Buttons.Button exposing (primaryButton)
import Buttons.Shared exposing (ButtonSize(..))
import Html exposing (Html, a, button, div, h2, h3, table, td, text, th, tr)
import Html.Attributes exposing (class, href)
import Html.Events exposing (onClick)
import Html.Styled.Events exposing (onClick)
import Http
import Json.Decode as Decode
import Projects.Project as Project exposing (Project, ProjectId, projectDecoder)
import RemoteData exposing (RemoteData, WebData)


type alias Model =
    { projects : WebData (List Project)
    , navKey : Nav.Key
    }


type Msg
    = FetchProjects
    | ProjectsReceived (WebData (List Project))
    | ClickedProject String


init : Nav.Key -> ( Model, Cmd Msg )
init navKey =
    ( { projects = RemoteData.Loading, navKey = navKey }, fetchProjects )


fetchProjects : Cmd Msg
fetchProjects =
    Http.get
        { url = "http://localhost:2022/projects/"
        , expect =
            Project.projectsDecoder
                |> Http.expectJson (RemoteData.fromResult >> ProjectsReceived)
        }

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        FetchProjects ->
            ( { model | projects = RemoteData.Loading }, fetchProjects )

        ProjectsReceived response ->
            ( { model | projects = response }, Cmd.none )

        ClickedProject url ->
            ( model, Nav.pushUrl model.navKey url )


view : Model -> Html Msg
view model =
    div [ class "projects" ]
        [ div [ class "header" ]
            [ h2 [] [ text "DSP CPE APP" ]
            ]
        , div [ class "buttons" ]
            [ viewProjects model.projects]
        ]


viewProjects : WebData (List Project) -> Html Msg
viewProjects posts =
    case posts of
        RemoteData.NotAsked ->
            text ""

        RemoteData.Loading ->
            h3 [] [ text "Loading..." ]

        RemoteData.Success actualProjects ->
            div []
                [ h3 [] [ text "Projects" ]
                , div []
                    (List.map viewProject actualProjects)
                ]

        RemoteData.Failure httpError ->
            viewFetchError (buildErrorMessage httpError)


viewProject : Project -> Html Msg
viewProject project =
    let
        projectPath =
            "/project/" ++ Project.idToString project.id
    in
    primaryButton [ Html.Styled.Events.onClick (ClickedProject projectPath) ] project.title Normal

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


buildErrorMessage : Http.Error -> String
buildErrorMessage httpError =
    case httpError of
        Http.BadUrl message ->
            message

        Http.Timeout ->
            "Server is taking too long to respond. Please try again later."

        Http.NetworkError ->
            "Unable to reach server."

        Http.BadStatus statusCode ->
            "Request failed with status code: " ++ String.fromInt statusCode

        Http.BadBody message ->
            message


subscriptions : Model -> Sub msg
subscriptions _ =
    Sub.none
