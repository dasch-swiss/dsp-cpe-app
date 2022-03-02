module Projects.ListProjects exposing (..)

import Html exposing (Html, div)
import Buttons.Button exposing (primaryButton)
import Buttons.Shared exposing (ButtonSize(..))
import Browser.Navigation as Nav
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
    div []
    [ primaryButton [ onClick ClickedPlayground ] "Playground" Normal
    , primaryButton [ onClick ClickedBeol ] "Beol" Normal
    ]
    


update : Msg -> Model -> ( Model, Cmd msg )
update msg model =
    case msg of
        ClickedPlayground ->
            ( model, Nav.pushUrl model.navKey "project/playground")
        ClickedBeol ->
            ( model, Nav.pushUrl model.navKey "project/beol" )


subscriptions : Model -> Sub msg
subscriptions _ =
    Sub.none
