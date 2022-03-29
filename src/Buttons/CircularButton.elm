module Buttons.CircularButton exposing (..)

import Css
import Css.Global
import Html.Styled as HtmlStyled exposing (Attribute)
import Html.Styled.Attributes as Attr
import Icon
import Svg.Attributes exposing (..)
import Tailwind.Utilities as Tw
import VirtualDom


type CircularButtonSize
    = CircularExtraSmall
    | CircularSmall
    | CircularNormal
    | CircularLarge
    | CircularExtraLarge


type alias CircularButtonModel msg =
    { size : CircularButtonSize
    , icon : Icon.Icon
    , attrs : List (Attribute msg)
    }


circularButtonStyle : List Css.Style
circularButtonStyle =
    [ Tw.inline_flex
    , Tw.items_center
    , Tw.border
    , Tw.border_transparent
    , Tw.rounded_full
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
        [ Tw.bg_indigo_700
        ]
    ]


view : CircularButtonModel msg -> HtmlStyled.Html msg
view buttonModel =
    let
        btnSize =
            case buttonModel.size of
                CircularExtraSmall ->
                    [ Tw.p_1 ]

                CircularSmall ->
                    [ Tw.p_1_dot_5 ]

                CircularExtraLarge ->
                    [ Tw.p_3 ]

                -- Normal and Large
                _ ->
                    [ Tw.p_2 ]

        icnSize =
            if buttonModel.size == CircularExtraSmall || buttonModel.size == CircularSmall || buttonModel.size == CircularNormal then
                [ Tw.h_5
                , Tw.w_5
                ]

            else
                [ Tw.h_6
                , Tw.w_6
                ]
    in
    HtmlStyled.button
        (buttonModel.attrs
            ++ [ Attr.type_ "button"
               , Attr.class "circular-button"
               , Attr.css (btnSize ++ circularButtonStyle)
               ]
        )
        [ HtmlStyled.span [ Attr.css icnSize ] [ HtmlStyled.fromUnstyled <| Icon.getHtml buttonModel.icon ]
        , Css.Global.global Tw.globalStyles
        ]
