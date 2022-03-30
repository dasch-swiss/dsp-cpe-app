module Buttons.LeadingIconButton exposing (..)

import CustomCss.DaschTailwind as Dtw
import Html exposing (Html, button, span, text)
import Html.Attributes exposing (class, type_)
import Icon
import String
import VirtualDom


type LeadingSize
    = LeadingSmall
    | LeadingNormal
    | LeadingLarge
    | LeadingExtraLarge


type alias Model =
    { size : LeadingSize
    , text : String
    , icon : Icon.Icon
    }


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
        , Dtw.focus Dtw.outline_none
        , Dtw.focus Dtw.ring_2
        , Dtw.focus Dtw.ring_offset_2
        , Dtw.focus Dtw.ring_indigo_500
        , Dtw.hover Dtw.bg_indigo_700
        ]


view : Model -> VirtualDom.Node msg
view model =
    let
        btnClasses =
            case model.size of
                LeadingSmall ->
                    String.join " "
                        [ Dtw.px_3
                        , Dtw.py_2
                        , Dtw.text_sm
                        , Dtw.leading_4
                        ]

                LeadingNormal ->
                    String.join " "
                        [ Dtw.px_4
                        , Dtw.py_2
                        , Dtw.text_sm
                        ]

                LeadingLarge ->
                    String.join " "
                        [ Dtw.px_4
                        , Dtw.py_2
                        , Dtw.text_base
                        ]

                LeadingExtraLarge ->
                    String.join " "
                        [ Dtw.px_6
                        , Dtw.py_3
                        , Dtw.text_base
                        ]

        svgClasses =
            case model.size of
                LeadingSmall ->
                    String.join " "
                        [ Dtw.neg_ml_1
                        , Dtw.mr_2
                        , Dtw.h_4
                        , Dtw.w_4
                        ]

                LeadingNormal ->
                    String.join " "
                        [ Dtw.neg_ml_1
                        , Dtw.mr_2
                        , Dtw.h_5
                        , Dtw.w_5
                        ]

                LeadingLarge ->
                    String.join " "
                        [ Dtw.neg_ml_1
                        , Dtw.mr_3
                        , Dtw.h_5
                        , Dtw.w_5
                        ]

                LeadingExtraLarge ->
                    String.join " "
                        [ Dtw.neg_ml_1
                        , Dtw.mr_3
                        , Dtw.h_5
                        , Dtw.w_5
                        ]

        iconMethod =
            Icon.getHtml model.icon
    in
    button
        [ type_ "button"
        , class btnClasses
        , class baseButtonClasses
        ]
        [ span [ class svgClasses ] [ iconMethod ]
        , text model.text
        ]
