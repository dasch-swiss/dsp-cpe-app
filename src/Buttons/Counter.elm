module Buttons.Counter exposing (..)
import Browser
import Html exposing (Html, div, text, h3)
import Html.Attributes exposing (class)
import Html.Styled.Events exposing (onClick)
import Html.Styled.Attributes exposing (disabled, id)
import Buttons.Button exposing (primaryButton, secondaryButton)
import Buttons.Shared exposing (ButtonSize(..))

main : Program () Model Msg
main =
  Browser.sandbox { init = init, update = update, view = view }


type alias Model = Int


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
    div [] [
      div [] [ h3 [ class "header" ] [ text "onClick implementation" ]
      , secondaryButton [onClick Increment] "Click me to increase" ExtraLarge 
      , div [] [ text (String.fromInt model) ]
      , secondaryButton [onClick Decrement] "Click me to decrease" ExtraLarge
      ]
    , div []
      [ h3 [ class "header" ] [ text "passing events, attributes" ]
      , div [] [ primaryButton [disabled True, onClick Increment] "I am disabled and can not increase" ExtraLarge ]
      , div [] [ primaryButton [disabled False, onClick Increment] "I am enabled and can increase" ExtraLarge ]
      , div [] [ primaryButton [id "decrement_button", onClick Decrement] "I decrease, like my id says" ExtraLarge ]
      ]
    ]
   