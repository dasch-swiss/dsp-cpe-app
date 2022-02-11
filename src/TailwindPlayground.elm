module TailwindPlayground exposing (..)

import Browser
import Buttons.Button as Button
import Buttons.Shared exposing (Size(..))
import Heroicons.Solid
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
            , Button.primary ( ExtraSmall, "Extra small" )
            , Button.primary ( Small, "Extra small" )
            , Button.primary ( Normal, "Extra small" )
            , Button.primary ( Large, "Extra small" )
            , Button.primary ( ExtraLarge, "Extra small" )
            ]
        , div [ class "preview secondary-button" ]
            [ h3 [ class "header" ] [ text "Secondary Buttons" ]
            , Button.secondary ( ExtraSmall, "Extra small" )
            , Button.secondary ( Small, "Small" )
            , Button.secondary ( Normal, "Normal" )
            , Button.secondary ( Large, "Large" )
            , Button.secondary ( ExtraLarge, "Extra large" )
            ]
        , div [ class "preview white-button" ]
            [ h3 [ class "header" ] [ text "White Buttons" ]
            , Button.white ( ExtraSmall, "Extra small" )
            , Button.white ( Small, "Small" )
            , Button.white ( Normal, "Normal" )
            , Button.white ( Large, "Large" )
            , Button.white ( ExtraLarge, "Extra large" )
            ]
        , div [ class "preview circular-button" ]
            [ h3 [ class "header" ] [ text "Circular Buttons" ]
            , Button.circular ( ExtraSmall, Heroicons.Solid.arrowRight [] )
            , Button.circular ( Small, Heroicons.Solid.annotation [] )
            , Button.circular ( Normal, Heroicons.Solid.plus [] )
            , Button.circular ( Large, Heroicons.Solid.check [] )
            , Button.circular ( ExtraLarge, Heroicons.Solid.emojiHappy [] )
            ]

        -- insert other buttons here
        ]


type Msg
    = DisplayWhichButtonClicked


update : a -> b -> ( b, Cmd msg )
update _ model =
    ( model, Cmd.none )


subscriptions : Model -> Sub msg
subscriptions _ =
    Sub.none
