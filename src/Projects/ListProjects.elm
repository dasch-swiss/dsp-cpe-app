module Projects.ListProjects exposing (Model, Msg, init, update, view)

import Browser.Navigation as Nav
import Buttons.Button exposing (primaryButton)
import Buttons.BasicButtons.BasicButton exposing (BasicButtonSize(..))
import Error exposing (buildErrorMessage)
import Html exposing (Html, div, h2, h3, text)
import Html.Attributes exposing (class)
import Html.Styled.Events
import Http
import Projects.Project as Project exposing (Project)
import RemoteData exposing (WebData)


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
            [ primaryButton [ Html.Styled.Events.onClick (ClickedProject "/playground") ] "playground" BasicNormal ]
        , div [ class "header" ]
            [ h2 [] [ text "Projects" ]
            ]
        , div [ class "buttons" ]
            [ viewProjects model.projects ]
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
                [ div []
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

subscriptions : Model -> Sub msg
subscriptions _ =
    Sub.none
