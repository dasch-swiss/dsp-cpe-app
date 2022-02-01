module Main exposing (..)

import Browser
import Html exposing (Html, text)
import Buttons.PrimaryButton as PrimaryButton

type alias Model = String

main : Program () Model msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }

init: () -> (Model, Cmd msg)
init _ =
    ("", Cmd.none)

view: Model -> Html msg
view model =
    PrimaryButton.view model

update: msg -> Model -> (Model, Cmd msg)
update _ model =
    (model, Cmd.none)

subscriptions : Model -> Sub msg
subscriptions _ =
    Sub.none