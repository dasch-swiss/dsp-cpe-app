module Buttons.PrimaryButton exposing (..)

import Browser
import Html exposing (Html, text, div, button)
import Html.Attributes exposing (type_, class)

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
    div [] [
        button
        [ type_ "button"
        , class "inline-flex items-center px-2.5 py-1.5 border border-transparent text-xs font-medium rounded shadow-sm text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
        ]
        [ text "Button text" ]
    ]

update: msg -> Model -> (Model, Cmd msg)
update _ model =
    (model, Cmd.none)

subscriptions : Model -> Sub msg
subscriptions _ =
    Sub.none