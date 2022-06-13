module Modules.Projects.ListProjects exposing (Model, Msg, init, update, view)

import Browser.Navigation as Nav
import DspCpeApi exposing (primaryButton)
import Html exposing (Html, div, h2, h3, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Http
import Modules.Projects.Project as Project exposing (Project)
import RemoteData exposing (WebData)
import Shared.SharedTypes exposing (BasicButtonSize(..))
import Util.Config as Config
import Util.Error exposing (buildErrorMessage)


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
        { url = Config.projectsFileUrl
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
            [ primaryButton { attrs = [ onClick (ClickedProject "/playground") ], text = "playground", size = BasicNormal }
            , primaryButton { attrs = [ onClick (ClickedProject "/beol") ], text = "Beol", size = BasicNormal }
            , primaryButton { attrs = [ onClick (ClickedProject "/executor") ], text = "EXECUTE IMMEDIATLY", size = BasicNormal }
            ]
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
    primaryButton { attrs = [ onClick (ClickedProject projectPath) ], text = project.title, size = BasicNormal }


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
