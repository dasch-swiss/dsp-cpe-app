module Buttons.BasicButtons.BasicButton exposing (..)

import Browser
import Buttons.BasicButtons.PrimaryButton exposing (primaryButtonStyle)
import Buttons.BasicButtons.SecondaryButton exposing (secondaryButtonStyle)
import Buttons.BasicButtons.WhiteButton exposing (whiteButtonStyle)
import Css
import Css.Global
import Html.Styled as HtmlStyled exposing (Attribute)
import Html.Styled.Attributes as Attr
import Tailwind.Utilities as Tw
import VirtualDom exposing (Node)

type BasicButtonSize
    = ExtraSmall
    | Small
    | Normal
    | Large
    | ExtraLarge

type ButtonType
    = Button
    | Submit
    | Reset


baseButton : List Css.Style
baseButton =
    [ Tw.inline_flex
    , Tw.items_center
    , Tw.border
    , Tw.font_medium
    , Tw.rounded
    , Tw.shadow_sm
    , Css.focus
        [ Tw.outline_none
        , Tw.ring_2
        , Tw.ring_offset_2
        , Tw.ring_indigo_500
        ]
    ]


renderBtnSize : BasicButtonSize -> List Css.Style
renderBtnSize size =
    case size of
        ExtraSmall ->
            [ Tw.px_2_dot_5
            , Tw.py_1_dot_5
            , Tw.text_xs
            ]

        Small ->
            [ Tw.px_3
            , Tw.py_2
            , Tw.text_sm
            , Tw.leading_4
            ]

        Normal ->
            [ Tw.px_4
            , Tw.py_2
            , Tw.text_sm
            ]

        Large ->
            [ Tw.px_4
            , Tw.py_2
            , Tw.text_base
            ]

        ExtraLarge ->
            [ Tw.px_6
            , Tw.py_3
            , Tw.text_base
            ]

main : Program () (BasicButtonModel msg) msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


type alias BasicButtonModel msg =
    { attrs : List (Attribute msg) -- onClick disable and all other events as well as custom attributes
    , text : String
    , size : BasicButtonSize
    , variant : Variant
    }


-- convenience function: Constructs the Buttonmodel and passes it into view; returns the view
basicButton : List (Attribute msg) -> String -> BasicButtonSize -> Variant -> Node msg
basicButton attributes text size variant =
    view { attrs = attributes, text = text, size = size, variant = variant }


type Variant
    = Primary
    | Secondary
    | White


initialModel : BasicButtonModel msg
initialModel =
    { attrs = [], text = "", size = Normal, variant = Primary }


init : () -> ( BasicButtonModel msg, Cmd msg )
init _ =
    ( initialModel, Cmd.none )


getVariant : Variant -> List Css.Style
getVariant variant =
    case variant of
        Primary ->
            primaryButtonStyle

        Secondary ->
            secondaryButtonStyle

        White ->
            whiteButtonStyle


view : BasicButtonModel msg -> Node msg
view b =
    HtmlStyled.toUnstyled <|
        HtmlStyled.button
            (b.attrs
                ++ [ Attr.type_ "button"
                   , Attr.css (renderBtnSize b.size ++ getVariant b.variant ++ baseButton)
                   ]
            )
            [ HtmlStyled.text b.text
            , Css.Global.global Tw.globalStyles
            ]


update : a -> b -> ( b, Cmd msg )
update _ buttonModel =
    ( buttonModel, Cmd.none )


subscriptions : BasicButtonModel msg -> Sub msg
subscriptions _ =
    Sub.none
