module Buttons.BasicButtons.BasicButton exposing (..)

import Buttons.BasicButtons.PrimaryButton exposing (primaryButtonStyle, primaryButtonClasses)
import Buttons.BasicButtons.SecondaryButton exposing (secondaryButtonStyle, secondaryButtonClasses)
import Buttons.BasicButtons.WhiteButton exposing (whiteButtonStyle, whiteButtonClasses)
import Css
import Css.Global
import CustomCss.DaschTailwind as Dtw
import Html exposing (Html, button, text)
import Html.Attributes as Attr exposing (class)
import Html.Styled as HtmlStyled exposing (Attribute)
import Html.Styled.Attributes as StyledAttr
import Tailwind.Utilities as Tw
import String
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

baseButtonClasses : String
baseButtonClasses =
    String.join " "
        [ Dtw.inline_flex
        , Dtw.items_center
        , Dtw.border
        , Dtw.font_medium
        , Dtw.rounded
        , Dtw.shadow_sm
        , "focus:" ++ Dtw.outline_none
        , "focus:" ++ Dtw.ring_2
        , "focus:" ++ Dtw.ring_offset_2
        , "focus:" ++ Dtw.ring_indigo_500
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

getBtnSizeClasses : BasicButtonSize -> String
getBtnSizeClasses size =
    case size of
        BasicExtraSmall ->
            String.join " "
                [ Dtw.px_2_dot_5
                , Dtw.py_1_dot_5
                , Dtw.text_xs
                ]

        BasicSmall ->
            String.join " "
                [ Dtw.px_3
                , Dtw.py_2
                , Dtw.text_sm
                , Dtw.leading_4
                ]

        BasicNormal ->
            String.join " "
                [ Dtw.px_4
                , Dtw.py_2
                , Dtw.text_sm
                ]

        BasicLarge ->
            String.join " "
                [ Dtw.px_4
                , Dtw.py_2
                , Dtw.text_base
                ]

        BasicExtraLarge ->
            String.join " "
                [ Dtw.px_6
                , Dtw.py_3
                , Dtw.text_base
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

getVariantClasses : Variant -> String
getVariantClasses variant =
    case variant of
        Primary ->
            primaryButtonClasses

        Secondary ->
            secondaryButtonClasses

        White ->
            whiteButtonClasses


view : BasicButtonModel msg -> Node msg
view b =
    -- HtmlStyled.toUnstyled <|
    --     HtmlStyled.button
    --         (b.attrs
    --             ++ [ Attr.type_ "button"
    --                , Attr.css (renderBtnSize b.size ++ getVariant b.variant ++ baseButton)
    --                ]
    --         )
    --         [ HtmlStyled.text b.text
    --         , Css.Global.global Tw.globalStyles
    --         ]

    Html.button
        [ class (getBtnSizeClasses b.size)
        , class (getVariantClasses b.variant)
        , class baseButtonClasses
        ] [ text b.text ]
