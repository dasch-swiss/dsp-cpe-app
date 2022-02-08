module TailwindPlayground exposing (..)

import Browser
import Buttons.PrimaryButton as PrimaryButton
import Buttons.CircularButton as CircularButton
import Buttons.Shared
import Html exposing (Html, div, h3, text)
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
            [ h3 [ class "header" ] [ text "Primary Buttons" ]
            , PrimaryButton.view { size = Buttons.Shared.ExtraSmall, text = "Extra Small" }
            , PrimaryButton.view { size = Buttons.Shared.Small, text = "Small" }
            , PrimaryButton.view { size = Buttons.Shared.Normal, text = "Normal" }
            , PrimaryButton.view { size = Buttons.Shared.Large, text = "Large" }
            , PrimaryButton.view { size = Buttons.Shared.ExtraLarge, text = "Extra Large" }
            ]
        , div [ class "preview circular-button" ]
            [ h3 [ class "header" ] [ text "Circular Buttons" ]
            , CircularButton.view { size = Buttons.Shared.ExtraSmall, icon = "annotation" }
            , CircularButton.view { size = Buttons.Shared.Small, icon = "arrow-right" }
            , CircularButton.view { size = Buttons.Shared.Normal, icon = "plus" }
            , CircularButton.view { size = Buttons.Shared.Large, icon = "check" }
            , CircularButton.view { size = Buttons.Shared.ExtraLarge, icon = "emojy-happy" }
            ]
        -- insert other buttons here
        ]


update : msg -> Model -> ( Model, Cmd msg )
update _ model =
    ( model, Cmd.none )


subscriptions : Model -> Sub msg
subscriptions _ =
    Sub.none
