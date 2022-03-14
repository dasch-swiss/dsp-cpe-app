module Projects.ListProjects exposing (..)

import Browser.Navigation as Nav
import Buttons.Button exposing (primaryButton)
import Buttons.BasicButtons.BasicButton exposing (BasicButtonSize(..))
import Html exposing (Html, div, h2, text)
import Html.Attributes exposing (class)
import Html.Styled.Events exposing (onClick)


type alias Model =
    { navKey : Nav.Key }


type Msg
    = ClickedPlayground
    | ClickedBeol


init : Nav.Key -> ( Model, Cmd Msg )
init navKey =
    ( { navKey = navKey }, Cmd.none )


view : Model -> Html Msg
view _ =
    div [ class "projects" ]
        [ div [ class "header" ]
            [ h2 [] [ text "DSP CPE APP" ] ]
        , div [ class "buttons" ]
            [ primaryButton [ onClick ClickedPlayground ] "Playground" BasicNormal
            , primaryButton [ onClick ClickedBeol ] "Beol" BasicNormal
            ]
        ]


update : Msg -> Model -> ( Model, Cmd msg )
update msg model =
    case msg of
        ClickedPlayground ->
            ( model, Nav.pushUrl model.navKey "project/playground" )

        ClickedBeol ->
            ( model, Nav.pushUrl model.navKey "project/beol" )


subscriptions : Model -> Sub msg
subscriptions _ =
    Sub.none
