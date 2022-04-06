module Buttons.CircularButton exposing (..)

import CustomCss.DaschTailwind as Dtw
import Html exposing (Attribute, Html, button, span)
import Html.Attributes exposing (class, type_)
import Icon


type CircularButtonSize
    = CircularExtraSmall
    | CircularSmall
    | CircularNormal
    | CircularLarge
    | CircularExtraLarge


type alias Model msg =
    { size : CircularButtonSize
    , icon : Icon.Icon
    , attrs : List (Attribute msg)
    }


circularButtonClasses : String
circularButtonClasses =
    Dtw.classList
        [ Dtw.inline_flex
        , Dtw.items_center
        , Dtw.border
        , Dtw.border_transparent
        , Dtw.rounded_full
        , Dtw.shadow_sm
        , Dtw.text_white
        , Dtw.bg_indigo_600
        , Dtw.onFocus
            [ Dtw.outline_none
            , Dtw.ring_2
            , Dtw.ring_offset_2
            , Dtw.ring_indigo_500
            , Dtw.bg_indigo_700
            ]
        ]


view : Model msg -> Html msg
view model =
    let
        btnSize =
            case model.size of
                CircularExtraSmall ->
                    Dtw.p_1

                CircularSmall ->
                    Dtw.p_1_dot_5

                CircularExtraLarge ->
                    Dtw.p_3

                -- Normal and Large
                _ ->
                    Dtw.p_2

        icnSize =
            if model.size == CircularExtraSmall || model.size == CircularSmall || model.size == CircularNormal then
                Dtw.classList
                    [ Dtw.h_5
                    , Dtw.w_5
                    ]

            else
                Dtw.classList
                    [ Dtw.h_6
                    , Dtw.w_6
                    ]
    in
    button
        [ type_ "button"
        , class "circular-button"
        , class btnSize
        , class circularButtonClasses
        ]
        [ span [ class icnSize ] [ Icon.getHtml model.icon ] ]
