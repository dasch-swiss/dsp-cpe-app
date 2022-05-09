module Modules.Buttons.TrailingIconButton exposing (..)

import Html exposing (Attribute, Html, button, span, text)
import Html.Attributes exposing (class, type_)
import Shared.SharedTypes exposing (TrailingSize(..))
import Util.CustomCss.DaschTailwind as Dtw
import Util.Icon as Icon


type alias Model msg =
    { size : TrailingSize
    , text : String
    , icon : Icon.Icon
    , attrs : List (Attribute msg)
    }


baseButtonClasses : String
baseButtonClasses =
    Dtw.classList
        [ Dtw.inline_flex
        , Dtw.items_center
        , Dtw.border
        , Dtw.border_transparent
        , Dtw.font_medium
        , Dtw.rounded
        , Dtw.shadow_sm
        , Dtw.text_white
        , Dtw.bg_indigo_600
        , Dtw.onHover [ Dtw.bg_indigo_700 ]
        , Dtw.onFocus
            [ Dtw.outline_none
            , Dtw.ring_2
            , Dtw.ring_offset_2
            , Dtw.ring_indigo_500
            ]
        ]


view : Model msg -> Html msg
view model =
    let
        btnClasses =
            case model.size of
                TrailingSmall ->
                    Dtw.classList
                        [ Dtw.px_3
                        , Dtw.py_2
                        , Dtw.text_sm
                        , Dtw.leading_4
                        ]

                TrailingNormal ->
                    Dtw.classList
                        [ Dtw.px_4
                        , Dtw.py_2
                        , Dtw.text_sm
                        ]

                TrailingLarge ->
                    Dtw.classList
                        [ Dtw.px_4
                        , Dtw.py_2
                        , Dtw.text_base
                        ]

                TrailingExtraLarge ->
                    Dtw.classList
                        [ Dtw.px_6
                        , Dtw.py_3
                        , Dtw.text_base
                        ]

        svgClasses =
            case model.size of
                TrailingSmall ->
                    Dtw.classList
                        [ Dtw.ml_2
                        , Dtw.neg_mr_0_dot_5
                        , Dtw.h_4
                        , Dtw.w_4
                        ]

                TrailingNormal ->
                    Dtw.classList
                        [ Dtw.ml_2
                        , Dtw.neg_mr_1
                        , Dtw.h_5
                        , Dtw.w_5
                        ]

                TrailingLarge ->
                    Dtw.classList
                        [ Dtw.ml_3
                        , Dtw.neg_mr_1
                        , Dtw.h_5
                        , Dtw.w_5
                        ]

                TrailingExtraLarge ->
                    Dtw.classList
                        [ Dtw.ml_3
                        , Dtw.neg_mr_1
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
        [ text model.text
        , span [ class svgClasses ] [ iconMethod ]
        ]
