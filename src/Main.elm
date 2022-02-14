module Main exposing (..)

import Browser
import TailwindPlayground exposing (view)
import Html exposing (Html, div)
import Html.Attributes exposing (class)

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
    ( "", Cmd.none )


view : Model -> Html msg
view model =
    div [ class "tailwind-ui-modules" ]
        [ div []
            [ TailwindPlayground.view model ]
        ]


update : msg -> Model -> ( Model, Cmd msg )
update _ model =
    ( model, Cmd.none )


subscriptions : Model -> Sub msg
subscriptions _ =
    Sub.none
