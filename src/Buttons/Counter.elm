module Buttons.Counter exposing (..)
import Browser
import Html exposing (Html, div, text)
import Html.Events exposing (onClick)
import Buttons.TrailingIconButton as TrailingIconButton
import Buttons.Button as Button
import Html.Attributes

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
  div []
    [ div[onClick Decrement, Html.Attributes.style "display" "inline-block"][Button.trailingIcon(TrailingIconButton.Normal, "Downvote", TrailingIconButton.Plus)]
    , div [] [ text (String.fromInt model) ]
    , div[onClick Increment, Html.Attributes.style "display" "inline-block"][Button.trailingIcon(TrailingIconButton.Normal, "Upvote", TrailingIconButton.Plus)]
    ]