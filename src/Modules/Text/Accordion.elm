module Modules.Text.Accordion exposing (..)

import Html exposing (Html, div, p, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Shared.SharedTypes exposing (AccordionSize(..))
import Util.CustomCss.CssColors exposing (CustomColor(..))
import Util.CustomCss.DaschTailwind as Dtw
import Util.Icon as Icon


type alias Model =
    { isOpen : Bool
    , text : String
    , size : AccordionSize
    }


type Msg
    = AccordionClicked


view : Model -> Html Msg
view model =
    let
        accordionSize =
            case model.size of
                HalfWidth ->
                    Dtw.w_6_slash_12

                FullWidth ->
                    Dtw.w_full

        accordionHeaderClasses =
            if model.isOpen then
                Dtw.classList
                    [ Dtw.rounded_lg
                    , Dtw.border_2
                    , Dtw.cursor_pointer
                    , Dtw.custom_bg Secondary
                    , Dtw.custom_border Secondary
                    ]

            else
                Dtw.classList
                    [ Dtw.rounded_lg
                    , Dtw.border_2
                    , Dtw.cursor_pointer
                    , Dtw.custom_border Primary
                    ]

        accordionHeaderTextClasses =
            if model.isOpen then
                Dtw.classList [ Dtw.p_2, Dtw.pl_3, Dtw.custom_text White ]

            else
                Dtw.classList [ Dtw.p_2, Dtw.pl_3, Dtw.custom_text Primary ]

        accordionContentClasses =
            if model.isOpen then
                Dtw.classList [ Dtw.block, Dtw.w_11_slash_12, Dtw.mx_auto ]

            else
                Dtw.hidden

        icon =
            if model.isOpen then
                Icon.getHtml Icon.MinusCircle

            else
                Icon.getHtml Icon.PlusCircle

        iconColor =
            if model.isOpen then
                Dtw.custom_text White

            else
                Dtw.custom_text Primary

        iconClasses =
            Dtw.classList
                [ Dtw.ml_2
                , Dtw.h_4
                , Dtw.w_4
                , Dtw.mt_3
                , iconColor
                ]
    in
    div [ class accordionSize ]
        [ div
            [ class accordionHeaderClasses, onClick AccordionClicked ]
            [ div [ class (Dtw.classList [ Dtw.inline_flex ]) ]
                [ div [ class iconClasses ] [ icon ]
                , div [ class accordionHeaderTextClasses ] [ text "Annotations" ]
                ]
            ]
        , div [ class accordionContentClasses ] [ p [] [ text model.text ] ]
        ]


update : Msg -> Model -> Model
update msg model =
    case msg of
        AccordionClicked ->
            if model.isOpen then
                { isOpen = False, text = model.text, size = model.size }

            else
                { isOpen = True, text = model.text, size = model.size }
