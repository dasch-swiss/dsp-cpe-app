module Buttons.PrimaryButton exposing (..)

import Browser
import Html exposing (Html, text, div, button)
import Html.Attributes exposing (type_, class)

-- Todo: Make the model use a record with a custom type for different sizes so that it is type safe
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
    ("Normal", Cmd.none)

view: Model -> Html msg
view model =
    let
        size =
            case model of
                "ExtraSmall" ->
                    "px-2.5 py-1.5 text-xs"
                "Small" ->
                    "px-3 py-2 text-sm"
                "Normal" ->
                    "px-4 py-2 text-sm"
                "Large" ->
                    "px-4 py-2 text-base"
                "ExtraLarge" ->
                    "px-6 py-3 text-base"
                _ ->
                    "px-4 py-2 text-sm"
                
    in
    div [] [
        button
        [ type_ "button"
        , class size
        , class "inline-flex items-center border border-transparent font-medium rounded shadow-sm text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
        ]
        [ text "Button text" ]
    ]

update: msg -> Model -> (Model, Cmd msg)
update _ model =
    (model, Cmd.none)

subscriptions : Model -> Sub msg
subscriptions _ =
    Sub.none