module Beol exposing (..)

import Browser
import Html exposing (Html, text)


type alias Model =
    String


main : Program () Model msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


init : () -> ( Model, Cmd msg )
init _ =
    ( "BEOL App", Cmd.none )


view : Model -> Html msg
view model =
    text model


update : msg -> Model -> ( Model, Cmd msg )
update _ model =
    ( model, Cmd.none )


subscriptions : Model -> Sub msg
subscriptions _ =
    Sub.none
