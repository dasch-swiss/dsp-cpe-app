module TailwindPlayground exposing (..)

import Browser
import Buttons.Button as Button
import Buttons.Shared exposing (Size(..))
import Heroicons.Solid
import Html exposing (Html, div, h3, text)
import Html.Attributes exposing (class)
import Avatars.Avatar exposing (circular)
import Avatars.CircularAvatar as CircularAvatar
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

    div [class "playground"][
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
             , div [ class "preview leading-button" ]
                [ h3 [ class "header" ] [ text "Circular Buttons" ]
                ,  LeadingIconButton.view {size = LeadingIconButton.Small, text = "Small", icon = LeadingIconButton.Annotation}
                , LeadingIconButton.view {size = LeadingIconButton.Normal, text = "Normal", icon = LeadingIconButton.EmojiHappy}
                , LeadingIconButton.view {size = LeadingIconButton.Large, text = "Large", icon = LeadingIconButton.Plus}
                , LeadingIconButton.view {size = LeadingIconButton.ExtraLarge, text = "Extra Large", icon = LeadingIconButton.Check}
                ]

                -- insert other buttons here
            ]
            , div [class "avatars"]
                [ div [ class "preview circular-avatar"]
                    [ h3 [ class "header"][ text "Circular Avatar"]
                        , Avatars.Avatar.circular (CircularAvatar.ExtraSmall
                        , "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
                            , "Extra small")
                        , Avatars.Avatar.circular (CircularAvatar.Small
                        , "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
                            , "Small")
                        , Avatars.Avatar.circular (CircularAvatar.Normal
                        , "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
                            , "Normal")
                        , Avatars.Avatar.circular (CircularAvatar.Large
                        , "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
                            , "Large")
                        , Avatars.Avatar.circular (CircularAvatar.ExtraLarge
                        , "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
                            , "Extra large")
                    ]
            ]

type Msg
    = DisplayWhichButtonClicked


update : a -> b -> ( b, Cmd msg )
update _ model =
    ( model, Cmd.none )


subscriptions : Model -> Sub msg
subscriptions _ =
    Sub.none
