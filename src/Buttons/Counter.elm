module Buttons.Counter exposing (..)

import Browser
import Buttons.Button exposing (primaryButton, secondaryButton)
import Buttons.BasicButtons.BasicButton exposing (BasicButtonSize(..))
import Html exposing (Html, div, h3, text)
import Html.Attributes exposing (class)
import Html.Styled.Attributes exposing (disabled, id)
import Html.Styled.Events exposing (onClick)


main : Program () Model Msg
main =
    Browser.sandbox { init = init, update = update, view = view }


type alias Model =
    Int


init : Model
init =
    0


type Msg
    = Increment
    | Decrement


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            model + 1

        Decrement ->
            model - 1


view : Model -> Html Msg
view model =
    div []
        [ div []
            [ h3 [ class "header" ] [ text "onClick implementation" ]
            , secondaryButton [ onClick Increment ] "Click me to increase" BasicExtraLarge
            , div [] [ text (String.fromInt model) ]
            , secondaryButton [ onClick Decrement ] "Click me to decrease" BasicExtraLarge
            ]
        , div []
            [ h3 [ class "header" ] [ text "passing events, attributes" ]
            , div [] [ primaryButton [ disabled True, onClick Increment ] "I am disabled and can not increase" BasicExtraLarge ]
            , div [] [ primaryButton [ disabled False, onClick Increment ] "I am enabled and can increase" BasicExtraLarge ]
            , div [] [ primaryButton [ id "decrement_button", onClick Decrement ] "I decrease, like my id says" BasicExtraLarge ]
            ]
        ]
