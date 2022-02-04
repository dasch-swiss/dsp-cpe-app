module Main exposing (..)

import Browser
import Buttons.PrimaryButton as PrimaryButton
import Buttons.CircularButton as CircularButton
import Html exposing (Html, div, h3,  text)
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
view _ =
    div [ class "buttons" ]
        [ h3 [] [ text "Primary Buttons" ]
        , div []
            [ PrimaryButton.view { size = PrimaryButton.ExtraSmall, text = "Extra Small" }
            , PrimaryButton.view { size = PrimaryButton.Small, text = "Small" }
            , PrimaryButton.view { size = PrimaryButton.Normal, text = "Normal" }
            , PrimaryButton.view { size = PrimaryButton.Large, text = "Large" }
            , PrimaryButton.view { size = PrimaryButton.ExtraLarge, text = "Extra Large" }
            ]
        , h3 [] [ text "Circular Buttons" ]
         , div []
            [ CircularButton.view { size = CircularButton.ExtraSmall, icon = "annotation" }
            , CircularButton.view { size = CircularButton.Small, icon = "arrow-right" }
            , CircularButton.view { size = CircularButton.Normal, icon = "plus" }
            , CircularButton.view { size = CircularButton.Large, icon = "check" }
            , CircularButton.view { size = CircularButton.ExtraLarge, icon = "emoji-happy" }
            ]
        ]


update : msg -> Model -> ( Model, Cmd msg )
update _ model =
    ( model, Cmd.none )


subscriptions : Model -> Sub msg
subscriptions _ =
    Sub.none
