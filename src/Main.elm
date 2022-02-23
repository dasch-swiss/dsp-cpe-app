module Main exposing (..)

import Browser
import TailwindPlayground exposing (view)
import Html exposing (Html, div)
import Html.Attributes exposing (class)
import Buttons.Button as Button
import Buttons.Shared exposing (Size(..))
import Browser.Navigation as Navigation
import Html.Events exposing (onClick)

type alias Model =
    String


main : Program () Model Msg
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


view : Model -> Html Msg
view model =
    div [ class "projects" ]
        [ div
            [ onClick ClickedPlayground
            , class "project-button"
            ]
            [ Button.primary ( Normal, "Playground" ) ]
        , div
            [ onClick ClickedBeol
            , class "project-button"
            ]
            [ Button.primary ( Normal, "Beol" ) ]
        ]


type Msg
    = ClickedPlayground
    | ClickedBeol

update : Msg -> Model -> ( Model, Cmd msg )
update msg model =
    case msg of
        ClickedPlayground ->
            ( model, Navigation.load "/dist/playground.html" )
        ClickedBeol ->
            ( model, Navigation.load "/dist/beol.html" )


subscriptions : Model -> Sub msg
subscriptions _ =
    Sub.none
