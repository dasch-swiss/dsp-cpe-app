module Buttons.TrailingIconButton exposing (..)

import Browser
import Css
import Css.Global
import CustomCss.DaschTailwind as Dtw
import Html exposing (Html, button, text, span)
import Html.Attributes as Attr exposing (type_, class)
import Html.Styled as Styled
import Html.Styled.Attributes as StyledAttr
import Icon
import String
import Tailwind.Utilities as Tw
import VirtualDom
import Html


type TrailingSize
    = TrailingSmall
    | TrailingNormal
    | TrailingLarge
    | TrailingExtraLarge


type alias Model =
    { size : TrailingSize
    , text : String
    , icon : Icon.Icon
    }


baseButton : List Css.Style
baseButton =
    [ Tw.inline_flex
    , Tw.items_center
    , Tw.border
    , Tw.border_transparent
    , Tw.font_medium
    , Tw.rounded
    , Tw.shadow_sm
    , Tw.text_white
    , Tw.bg_indigo_600
    , Css.focus
        [ Tw.outline_none
        , Tw.ring_2
        , Tw.ring_offset_2
        , Tw.ring_indigo_500
        ]
    , Css.hover
        [ Tw.bg_indigo_700 ]
    ]

baseButtonClasses : String
baseButtonClasses =
    String.join " "
        [ Dtw.inline_flex
        , Dtw.items_center
        , Dtw.border
        , Dtw.border_transparent
        , Dtw.font_medium
        , Dtw.rounded
        , Dtw.shadow_sm
        , Dtw.text_white
        , Dtw.bg_indigo_600
        , Dtw.hover Dtw.bg_indigo_700
        , Dtw.focus Dtw.outline_none
        , Dtw.focus Dtw.ring_2
        , Dtw.focus Dtw.ring_offset_2
        , Dtw.focus Dtw.ring_indigo_500
        ]


view : Model -> VirtualDom.Node msg
view model =
    let
        btnStyle =
            case model.size of
                TrailingSmall ->
                    [ Tw.px_3
                    , Tw.py_2
                    , Tw.text_sm
                    , Tw.leading_4
                    ]

                TrailingNormal ->
                    [ Tw.px_4
                    , Tw.py_2
                    , Tw.text_sm
                    ]

                TrailingLarge ->
                    [ Tw.px_4
                    , Tw.py_2
                    , Tw.text_base
                    ]

                TrailingExtraLarge ->
                    [ Tw.px_6
                    , Tw.py_3
                    , Tw.text_base
                    ]

        btnStyleClasses =
            case model.size of
                TrailingSmall ->
                    String.join " "
                        [ Dtw.px_3
                        , Dtw.py_2
                        , Dtw.text_sm
                        , Dtw.leading_4
                        ]

                TrailingNormal ->
                    String.join " "
                        [ Dtw.px_4
                        , Dtw.py_2
                        , Dtw.text_sm
                        ]

                TrailingLarge ->
                    String.join " "
                        [ Dtw.px_4
                        , Dtw.py_2
                        , Dtw.text_base
                        ]

                TrailingExtraLarge ->
                    String.join " "
                        [ Dtw.px_6
                        , Dtw.py_3
                        , Dtw.text_base
                        ]

        svgStyle =
            case model.size of
                TrailingSmall ->
                    [ Tw.ml_2
                    , Tw.neg_mr_0_dot_5
                    , Tw.h_4
                    , Tw.w_4
                    ]

                TrailingNormal ->
                    [ Tw.ml_2
                    , Tw.neg_mr_1
                    , Tw.h_5
                    , Tw.w_5
                    ]

                TrailingLarge ->
                    [ Tw.ml_3
                    , Tw.neg_mr_1
                    , Tw.h_5
                    , Tw.w_5
                    ]

                TrailingExtraLarge ->
                    [ Tw.ml_3
                    , Tw.neg_mr_1
                    , Tw.h_5
                    , Tw.w_5
                    ]

        svgStyleClasses =
            case model.size of
                TrailingSmall ->
                    String.join " "
                        [ Dtw.ml_2
                        , Dtw.neg_mr_0_dot_5
                        , Dtw.h_4
                        , Dtw.w_4
                        ]

                TrailingNormal ->
                    String.join " "
                        [ Dtw.ml_2
                        , Dtw.neg_mr_1
                        , Dtw.h_5
                        , Dtw.w_5
                        ]

                TrailingLarge ->
                    String.join " "
                        [ Dtw.ml_3
                        , Dtw.neg_mr_1
                        , Dtw.h_5
                        , Dtw.w_5
                        ]

                TrailingExtraLarge ->
                    String.join " "
                        [ Dtw.ml_3
                        , Dtw.neg_mr_1
                        , Dtw.h_5
                        , Dtw.w_5
                        ]

        iconMethod =
            Icon.getHtml model.icon
    in
    -- Styled.toUnstyled <|
    --     Styled.button
    --         [ Attr.type_ "button"
    --         , Attr.css (btnStyle ++ baseButton)
    --         ]
    --         [ Styled.text model.text
    --         , Styled.span [ Attr.css svgStyle ] [ Styled.fromUnstyled <| iconMethod ]
    --         , Css.Global.global Tw.globalStyles
    --         ]
    Html.button
        [ type_ "button"
        , class btnStyleClasses
        , class baseButtonClasses
        ]
        [ text model.text
        , span [ class svgStyleClasses ] [ iconMethod ]
        ]
