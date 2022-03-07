module Projects.Beol exposing (..)

import Html exposing (Html, a, text)
import Html.Attributes exposing (href)


type alias Model =
    { text : String }


type Msg
    = NoOp


init : ( Model, Cmd Msg )
init =
    ( { text = "BEOL" }, Cmd.none )


view : Model -> Html Msg
view model =
    text model.text


update : Msg -> Model -> ( Model, Cmd msg )
update _ model =
    ( model, Cmd.none )


subscriptions : Model -> Sub msg
subscriptions _ =
    Sub.none