module Buttons.TrailingIconButton exposing (..)

import Browser
import Css
import Css.Global
import Html.Styled as Styled
import Html.Styled.Attributes as Attr
import Icon
import Tailwind.Utilities as Tw
import VirtualDom


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

        iconMethod =
            Icon.getHtml model.icon
    in
    Styled.toUnstyled <|
        Styled.button
            [ Attr.type_ "button"
            , Attr.css (btnStyle ++ baseButton)
            ]
            [ Styled.text model.text
            , Styled.span [ Attr.css svgStyle ] [ Styled.fromUnstyled <| iconMethod ]
            , Css.Global.global Tw.globalStyles
            ]
