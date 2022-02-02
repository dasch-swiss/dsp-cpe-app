module Main exposing (..)

import Browser
import Html exposing (Html, div)
import Html.Attributes exposing (class)
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
view _ =
    div [class "buttons"]
        [ div [] [ PrimaryButton.view ( { size = PrimaryButton.ExtraSmall } ) ]
        , div [] [ PrimaryButton.view ( { size = PrimaryButton.Small } ) ]
        , div [] [ PrimaryButton.view ( { size = PrimaryButton.Normal } ) ]
        , div [] [ PrimaryButton.view ( { size = PrimaryButton.Large } ) ]
        , div [] [ PrimaryButton.view ( { size = PrimaryButton.ExtraLarge } ) ]
        ]

update: msg -> Model -> (Model, Cmd msg)
update _ model =
    (model, Cmd.none)

subscriptions : Model -> Sub msg
subscriptions _ =
    Sub.none