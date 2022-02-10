module TailwindPlayground exposing (..)

import Browser
import Buttons.Button exposing (..)
import Buttons.CircularButton as CircularButton
import Buttons.PrimaryButton as PrimaryButton
import Html exposing (Html, div, h3, text)
import Html.Attributes exposing (class)
import Heroicons.Solid


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
        -- div [ class "preview primary-button" ]
        --     [ h3 [ class "header" ] [ text "Primary Buttons" ]
        --     , PrimaryButton.view { size = ExtraSmall, text = "Extra Small" }
        --     , PrimaryButton.view { size = Small, text = "Small" }
        --     , PrimaryButton.view { size = Normal, text = "Normal" }
        --     , PrimaryButton.view { size = Large, text = "Large" }
        --     , PrimaryButton.view { size = ExtraLarge, text = "Extra Large" }
        --     ]
        [ div [ class "preview circular-button" ]
            [ h3 [ class "header" ] [ text "Circular Buttons" ]
            , CircularButton.view (ExtraSmall, Heroicons.Solid.arrowRight [])
            , CircularButton.view (Small, Heroicons.Solid.annotation [])
            , CircularButton.view (Normal, Heroicons.Solid.plus [])
            , CircularButton.view (Large, Heroicons.Solid.check [])
            , CircularButton.view (ExtraLarge, Heroicons.Solid.emojiHappy [])
            -- , CircularButton.view { size = Small, icon = "arrow-right" }
            -- , CircularButton.view { size = Normal, icon = "plus" }
            -- , CircularButton.view { size = Large, icon = "check" }
            -- , CircularButton.view { size = ExtraLarge, icon = "emojy-happy" }
            ]
        , div [ class "preview circular-button" ]
            [ h3 [ class "header" ] [ text "Primary Buttons" ]
            , cpeButton (Primary, ExtraSmall, "Extra small")
            , cpeButton (Primary, Small, "Small")
            , cpeButton (Primary, Normal, "Normal")
            , cpeButton (Primary, Large, "Large")
            , cpeButton (Primary, ExtraLarge, "Extra large")
            ]

        , div [ class "preview secondary-button" ]
            [ h3 [ class "header" ] [ text "Secondary Buttons" ]
            , cpeButton (Secondary, ExtraSmall, "Extra small")
            , cpeButton (Secondary, Small, "Small")
            , cpeButton (Secondary, Normal, "Normal")
            , cpeButton (Secondary, Large, "Large")
            , cpeButton (Secondary, ExtraLarge, "Extra large")
            ]
        , div [ class "preview white-button" ]
            [ h3 [ class "header" ] [ text "White Buttons" ]
                , cpeButton (White, ExtraSmall, "Extra small")
                , cpeButton (White, Small, "Small")
                , cpeButton (White, Normal, "Normal")
                , cpeButton (White, Large, "Large")
                , cpeButton (White, ExtraLarge, "Extra large")
            ] 

        -- insert other buttons here
    ]

type Msg = DisplayWhichButtonClicked 

--update : msg -> Model -> ( Model, Cmd msg )
update : a -> b -> (b, Cmd msg)
update _ model =
    ( model, Cmd.none )


subscriptions : Model -> Sub msg
subscriptions _ =
    Sub.none
