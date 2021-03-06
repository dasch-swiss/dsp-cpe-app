module Modules.Buttons.CircularButton exposing (..)

import Html exposing (Attribute, Html, button, span)
import Html.Attributes exposing (class, type_)
import Shared.SharedTypes exposing (CircularButtonSize(..))
import Util.CustomCss.CssColors exposing (CustomColor(..))
import Util.CustomCss.DaschTailwind as Dtw
import Util.Icon as Icon


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
        , Dtw.custom_bg Primary
        , Dtw.onFocus
            [ Dtw.outline_none
            , Dtw.ring_2
            , Dtw.ring_offset_2
            , Dtw.custom_bg Secondary
            , Dtw.custom_ring Primary
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
        (model.attrs
            ++ [ type_ "button"
               , class "circular-button"
               , class btnSize
               , class circularButtonClasses
               ]
        )
        [ span [ class icnSize ] [ Icon.getHtml model.icon ] ]
