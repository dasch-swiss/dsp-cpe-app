module TailwindPlayground exposing (..)
import Browser
import Buttons.Button exposing (..)
import Html exposing (Html, div, h3, p, text)
import Html.Attributes exposing (class)
import Buttons.LeadingIconButton as LeadingIconButton
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
            , cpeButton (Primary, ExtraSmall, "Extra small")
            , cpeButton (Primary, Small, "Small")
            , cpeButton (Primary, Normal, "Normal")
            , cpeButton (Primary, Large, "Large")
            , cpeButton (Primary, ExtraLarge, "Extra large")
            ]

        , div [ class "preview secondary-button" ]
            [ p [ class "header" ] [ text "Secondary Buttons" ]
            , cpeButton (Secondary, ExtraSmall, "Extra small")
            , cpeButton (Secondary, Small, "Small")
            , cpeButton (Secondary, Normal, "Normal")
            , cpeButton (Secondary, Large, "Large")
            , cpeButton (Secondary, ExtraLarge, "Extra large")
            ]
        , div [ class "preview white-button" ]
        [ p [ class "header" ] [ text "White Buttons" ]
            , cpeButton (White, ExtraSmall, "Extra small")
            , cpeButton (White, Small, "Small")
            , cpeButton (White, Normal, "Normal")
            , cpeButton (White, Large, "Large")
            , cpeButton (White, ExtraLarge, "Extra large")
        ]
        ,  div [ class "preview leading-button" ]
            [ h3 [ class "header" ] [ text "Circular Buttons" ]
            ,  LeadingIconButton.view {size = LeadingIconButton.Small, text = "Small", icon = LeadingIconButton.Annotation}
            , LeadingIconButton.view {size = LeadingIconButton.Normal, text = "Normal", icon = LeadingIconButton.EmojiHappy}
            , LeadingIconButton.view {size = LeadingIconButton.Large, text = "Large", icon = LeadingIconButton.Plus}
            , LeadingIconButton.view {size = LeadingIconButton.ExtraLarge, text = "Extra Large", icon = LeadingIconButton.Check}
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
