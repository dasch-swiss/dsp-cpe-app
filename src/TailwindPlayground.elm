module TailwindPlayground exposing (..)

import Browser
import Buttons.PrimaryButton as PrimaryButton
import Buttons.Shared
import Html exposing (Html, div, p, text)
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
        [ div [ class "preview primary-button" ]
            [ p [ class "header" ] [ text "Primary Buttons" ]
            , PrimaryButton.view { size = Buttons.Shared.ExtraSmall, text = "Extra Small" }
            , PrimaryButton.view { size = Buttons.Shared.Small, text = "Small" }
            , PrimaryButton.view { size = Buttons.Shared.Normal, text = "Normal" }
            , PrimaryButton.view { size = Buttons.Shared.Large, text = "Large" }
            , PrimaryButton.view { size = Buttons.Shared.ExtraLarge, text = "Extra Large" }
            ]

        -- insert other buttons here
        ]


update : msg -> Model -> ( Model, Cmd msg )
update _ model =
    ( model, Cmd.none )


subscriptions : Model -> Sub msg
subscriptions _ =
    Sub.none
