module Buttons.PrimaryButton exposing (..)

import Browser
import Html exposing (Html, button, div, text)
import Html.Attributes exposing (class, type_)


type Size
    = ExtraSmall
    | Small
    | Normal
    | Large
    | ExtraLarge


type alias Model =
    { size : Size }


main : Program () Model msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


initialModel : Model
initialModel =
    { size = Normal }


init : () -> ( Model, Cmd msg )
init _ =
    ( initialModel, Cmd.none )


view : Model -> Html msg
view model =
    let
        size =
            case model.size of
                ExtraSmall ->
                    "px-2.5 py-1.5 text-xs"

                Small ->
                    "px-3 py-2 text-sm"

                Normal ->
                    "px-4 py-2 text-sm"

                Large ->
                    "px-4 py-2 text-base"

                ExtraLarge ->
                    "px-6 py-3 text-base"
    in
    div []
        [ button
            [ type_ "button"
            , class size
            , class "inline-flex items-center border border-transparent font-medium rounded shadow-sm text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
            ]
            [ text "Button text" ]
        ]


update : msg -> Model -> ( Model, Cmd msg )
update _ model =
    ( model, Cmd.none )


subscriptions : Model -> Sub msg
subscriptions _ =
    Sub.none
