module Modules.Buttons.LeadingIconButton exposing (..)

import Html exposing (Attribute, Html, button, span, text)
import Html.Attributes exposing (class, type_)
import Shared.SharedTypes exposing (LeadingSize(..))
import Util.CustomCss.DaschTailwind as Dtw
import Util.Icon as Icon


type alias Model msg =
    { size : LeadingSize
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
        , Dtw.onFocus
            [ Dtw.outline_none
            , Dtw.ring_2
            , Dtw.ring_offset_2
            , Dtw.ring_indigo_500
            ]
        , Dtw.onHover [ Dtw.bg_indigo_700 ]
        ]


view : Model msg -> Html msg
view model =
    let
        btnClasses =
            case model.size of
                LeadingSmall ->
                    Dtw.classList
                        [ Dtw.px_3
                        , Dtw.py_2
                        , Dtw.text_sm
                        , Dtw.leading_4
                        ]

                LeadingNormal ->
                    Dtw.classList
                        [ Dtw.px_4
                        , Dtw.py_2
                        , Dtw.text_sm
                        ]

                LeadingLarge ->
                    Dtw.classList
                        [ Dtw.px_4
                        , Dtw.py_2
                        , Dtw.text_base
                        ]

                LeadingExtraLarge ->
                    Dtw.classList
                        [ Dtw.px_6
                        , Dtw.py_3
                        , Dtw.text_base
                        ]

        svgClasses =
            case model.size of
                LeadingSmall ->
                    Dtw.classList
                        [ Dtw.neg_ml_1
                        , Dtw.mr_2
                        , Dtw.h_4
                        , Dtw.w_4
                        ]

                LeadingNormal ->
                    Dtw.classList
                        [ Dtw.neg_ml_1
                        , Dtw.mr_2
                        , Dtw.h_5
                        , Dtw.w_5
                        ]

                LeadingLarge ->
                    Dtw.classList
                        [ Dtw.neg_ml_1
                        , Dtw.mr_3
                        , Dtw.h_5
                        , Dtw.w_5
                        ]

                LeadingExtraLarge ->
                    Dtw.classList
                        [ Dtw.neg_ml_1
                        , Dtw.mr_3
                        , Dtw.h_5
                        , Dtw.w_5
                        ]

        iconMethod =
            Icon.getHtml model.icon
    in
    button
        (model.attrs
            ++ [ type_ "button"
               , class btnClasses
               , class baseButtonClasses
               ]
        )
        [ span [ class svgClasses ] [ iconMethod ]
        , text model.text
        ]
