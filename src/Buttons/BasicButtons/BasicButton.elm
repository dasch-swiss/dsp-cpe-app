module Buttons.BasicButtons.BasicButton exposing (..)

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
    = BasicExtraSmall
    | BasicSmall
    | BasicNormal
    | BasicLarge
    | BasicExtraLarge


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
        BasicExtraSmall ->
            [ Tw.px_2_dot_5
            , Tw.py_1_dot_5
            , Tw.text_xs
            ]

        BasicSmall ->
            [ Tw.px_3
            , Tw.py_2
            , Tw.text_sm
            , Tw.leading_4
            ]

        BasicNormal ->
            [ Tw.px_4
            , Tw.py_2
            , Tw.text_sm
            ]

        BasicLarge ->
            [ Tw.px_4
            , Tw.py_2
            , Tw.text_base
            ]

        BasicExtraLarge ->
            [ Tw.px_6
            , Tw.py_3
            , Tw.text_base
            ]


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
