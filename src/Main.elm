module Main exposing (..)

import Browser
import Buttons.PrimaryButton as PrimaryButton
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
view _ =
    div [ class "buttons" ]
        [ div []
            [ PrimaryButton.view { size = PrimaryButton.ExtraSmall, text = "Extra Small" }
            , PrimaryButton.view { size = PrimaryButton.Small, text = "Small" }
            , PrimaryButton.view { size = PrimaryButton.Normal, text = "Normal" }
            , PrimaryButton.view { size = PrimaryButton.Large, text = "Large" }
            , PrimaryButton.view { size = PrimaryButton.ExtraLarge, text = "Extra Large" }
            ]
        ]


update : msg -> Model -> ( Model, Cmd msg )
update _ model =
    ( model, Cmd.none )


subscriptions : Model -> Sub msg
subscriptions _ =
    Sub.none
