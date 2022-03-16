module Projects.TailwindPlayground exposing (..)

import Avatars.Avatar exposing (circular)
import Avatars.CircularAvatar as CircularAvatar
import Buttons.Button as Button exposing (primaryButton, secondaryButton, whiteButton)
import Buttons.LeadingIconButton as LeadingIconButton
import Buttons.Shared exposing (ButtonSize(..))
import Buttons.TrailingIconButton as TrailingIconButton
import Html exposing (Html, div, h3, text)
import Html.Attributes exposing (class)
import Icon as Icon
import NavigationHeader.HeaderModule exposing (cpeHeader)
import NavigationHeader.Navitem exposing (NavItem)


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
                , Button.circular ( ExtraSmall, Icon.ArrowRight )
                , Button.circular ( Small, Icon.Annotation )
                , Button.circular ( Normal, Icon.Plus )
                , Button.circular ( Large, Icon.Check )
                , Button.circular ( ExtraLarge, Icon.EmojiHappy )
                ]
            , div [ class "preview leading-button" ]
                [ h3 [ class "header" ] [ text "Leading Icon Buttons" ]
                , Button.leadingIcon ( LeadingIconButton.Small, "Small", Icon.Annotation )
                , Button.leadingIcon ( LeadingIconButton.Normal, "Normal", Icon.EmojiHappy )
                , Button.leadingIcon ( LeadingIconButton.Large, "Large", Icon.Plus )
                , Button.leadingIcon ( LeadingIconButton.ExtraLarge, "Extra Large", Icon.Check )
                ]
            , div [ class "preview leading-button" ]
                [ h3 [ class "header" ] [ text "Trailing Icon Buttons" ]
                , Button.trailingIcon ( TrailingIconButton.Small, "Small", Icon.Annotation )
                , Button.trailingIcon ( TrailingIconButton.Normal, "Normal", Icon.EmojiHappy )
                , Button.trailingIcon ( TrailingIconButton.Large, "Large", Icon.Plus )
                , Button.trailingIcon ( TrailingIconButton.ExtraLarge, "Extra Large", Icon.Check )
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
        , div [ class "header" ]
            [ h3 [] [ text "Header module" ]
            , div [] []
            , div [] [ cpeHeader "https://beol.dasch.swiss/assets/images/beol-logo.png" False [ someNavitem, otherNavitem ] True ]
            ]
        ]


update : Msg -> Model -> ( Model, Cmd msg )
update msg model =
    ( model, Cmd.none )


subscriptions : Model -> Sub msg
subscriptions _ =
    Sub.none



-- Navigation header data ...


someNavitem : NavItem msg
someNavitem =
    { attrs = [], text = "Dasch", hRef = "https://www.dasch.swiss", cmd = Cmd.none, isActive = True }


otherNavitem : NavItem msg
otherNavitem =
    { attrs = [], text = "Beol", hRef = "beol", cmd = Cmd.none, isActive = False }
