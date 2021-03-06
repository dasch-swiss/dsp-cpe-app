module Modules.Dividers.DividerButton exposing (..)

import Html exposing (Attribute, Html, button, span, text)
import Html.Attributes exposing (class, type_)
import Util.CustomCss.DaschTailwind as Dtw
import Util.Icon as Icon


type alias Model msg =
    { attr : List (Attribute msg)
    , text : String
    , icon : Icon.Icon
    }


baseButtonClasses : String
baseButtonClasses =
    Dtw.classList
        [ Dtw.inline_flex
        , Dtw.items_center
        , Dtw.border
        , Dtw.border_gray_300
        , Dtw.font_medium
        , Dtw.rounded_full
        , Dtw.shadow_sm
        , Dtw.text_gray_700
        , Dtw.bg_white
        , Dtw.px_4
        , Dtw.py_1_dot_5
        , Dtw.text_sm
        , Dtw.leading_5
        , Dtw.onFocus
            [ Dtw.outline_none
            , Dtw.ring_2
            , Dtw.ring_offset_2
            , Dtw.ring_indigo_500
            , Dtw.bg_gray_50
            ]
        ]


view : Model msg -> Html msg
view model =
    let
        svgClasses =
            Dtw.classList
                [ Dtw.neg_ml_1_dot_5
                , Dtw.mr_1
                , Dtw.h_5
                , Dtw.w_5
                , Dtw.text_gray_400
                ]

        iconMethod =
            Icon.getHtml model.icon
    in
    button
        (model.attr
            ++ [ type_ "button"
               , class baseButtonClasses
               ]
        )
        [ span [ class svgClasses ] [ iconMethod ]
        , text model.text
        ]
