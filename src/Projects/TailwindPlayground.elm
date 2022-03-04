module Projects.TailwindPlayground exposing (..)

import Buttons.Button as Button exposing (primaryButton, secondaryButton, whiteButton)
import Buttons.Shared exposing (ButtonSize(..))
import Heroicons.Solid
import Html exposing (Html, div, h3, text)
import Html.Attributes exposing (class)
import Avatars.Avatar exposing (circular)
import Avatars.CircularAvatar as CircularAvatar
import Buttons.LeadingIconButton as LeadingIconButton
import Buttons.TrailingIconButton as TrailingIconButton

type alias Model =
    { text : String }

type Msg
    = NoOp

init : ( Model, Cmd Msg )
init =
    ( { text = "playground" }, Cmd.none )


view : Model -> Html Msg
view _ =

    div [ class "playground" ]
        [ div [ class "buttons" ]
            [ div [ class "preview primary-button" ]
                [ h3 [ class "header" ] [ text "Primary Buttons" ]
                , primaryButton [] "Extra small" ExtraSmall
                , primaryButton [] "Small" Small
                , primaryButton [] "Normal" Normal
                , primaryButton [] "Large" Large
                , primaryButton [] "Extra large" ExtraLarge
                ]
            , div [ class "preview secondary-button" ]
                [ h3 [ class "header" ] [ text "Secondary Buttons" ]
                , secondaryButton [] "Extra small" ExtraSmall
                , secondaryButton [] "Small" Small
                , secondaryButton [] "Normal" Normal
                , secondaryButton [] "Large" Large
                , secondaryButton [] "Extra large" ExtraLarge
                ]
            , div [ class "preview white-button" ]
                [ h3 [ class "header" ] [ text "White Buttons" ]
                , whiteButton [] "Extra small" ExtraSmall
                , whiteButton [] "Small" Small
                , whiteButton [] "Normal" Normal
                , whiteButton [] "Large" Large
                , whiteButton [] "Extra large" ExtraLarge
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
                [ h3 [ class "header" ] [ text "Leading Icon Buttons" ]
                , Button.leadingIcon ( LeadingIconButton.Small, "Small", LeadingIconButton.Annotation )
                , Button.leadingIcon ( LeadingIconButton.Normal, "Normal", LeadingIconButton.EmojiHappy )
                , Button.leadingIcon ( LeadingIconButton.Large, "Large", LeadingIconButton.Plus )
                , Button.leadingIcon ( LeadingIconButton.ExtraLarge, "Extra Large", LeadingIconButton.Check )
                ]
            , div [ class "preview leading-button" ]
                [ h3 [ class "header" ] [ text "Trailing Icon Buttons" ]
                , Button.trailingIcon ( TrailingIconButton.Small, "Small", TrailingIconButton.Annotation )
                , Button.trailingIcon ( TrailingIconButton.Normal, "Normal", TrailingIconButton.EmojiHappy )
                , Button.trailingIcon ( TrailingIconButton.Large, "Large", TrailingIconButton.Plus )
                , Button.trailingIcon ( TrailingIconButton.ExtraLarge, "Extra Large", TrailingIconButton.Check )
                ]

            -- insert other buttons here
            ]
        , div [ class "avatars" ]
            [ div [ class "preview circular-avatar" ]
                [ h3 [ class "header" ] [ text "Circular Avatar" ]
                , circular
                    ( CircularAvatar.ExtraSmall
                    , "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
                    , "Extra small"
                    )
                , circular
                    ( CircularAvatar.Small
                    , "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
                    , "Small"
                    )
                , circular
                    ( CircularAvatar.Normal
                    , "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
                    , "Normal"
                    )
                , circular
                    ( CircularAvatar.Large
                    , "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
                    , "Large"
                    )
                , circular
                    ( CircularAvatar.ExtraLarge
                    , "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
                    , "Extra large"
                    )
                ]
            ]
        ]

update : Msg -> Model -> ( Model, Cmd Msg )
update _ model =
    ( model, Cmd.none )


subscriptions : Model -> Sub msg
subscriptions _ =
    Sub.none
