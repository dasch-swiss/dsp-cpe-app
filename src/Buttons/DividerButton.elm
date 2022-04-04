module Buttons.DividerButton exposing (..)

import CustomCss.DaschTailwind as Dtw
import Html exposing (Html, Attribute, button, span, text)
import Html.Attributes exposing (class, type_)
import Icon
import String


type alias Model msg =
    { attr : List (Attribute msg)
    , text : String
    , icon : Icon.Icon
    }

baseButtonClasses : String
baseButtonClasses =
    String.join " "
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
        , Dtw.focus Dtw.outline_none
        , Dtw.focus Dtw.ring_2
        , Dtw.focus Dtw.ring_offset_2
        , Dtw.focus Dtw.ring_indigo_500
        , Dtw.hover Dtw.bg_gray_50
        ]

view : Model msg -> Html msg
view model =
    let
        svgClasses =
            String.join " "
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
        ( model.attr ++
            [ type_ "button" 
            , class baseButtonClasses
            ]
        )
        [ span [ class svgClasses ] [ iconMethod ]
        , text model.text
        ]