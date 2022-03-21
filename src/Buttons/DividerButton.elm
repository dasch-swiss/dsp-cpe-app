module Buttons.DividerButton exposing (..)

import Browser
import Css
import Css.Global
import Html.Styled as Styled exposing (Attribute)
import Html.Styled.Attributes as Attr
import Icon
import Tailwind.Utilities as Tw
import VirtualDom


type alias Model msg =
    { attr : List (Attribute msg)
    , text : String
    , icon : Icon.Icon
    }


main : Program () (Model msg) msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


initialModel : Model msg
initialModel =
    { attr = []
    , text = "Read More"
    , icon = Icon.PlusSm
    }


init : () -> ( Model msg, Cmd msg )
init _ =
    ( initialModel, Cmd.none )


baseButton : List Css.Style
baseButton =
    [ Tw.inline_flex
    , Tw.items_center
    , Tw.border
    , Tw.border_gray_300
    , Tw.font_medium
    , Tw.rounded_full
    , Tw.shadow_sm
    , Tw.text_gray_700
    , Tw.bg_white
    , Tw.px_4
    , Tw.py_1_dot_5
    , Tw.text_sm
    , Tw.leading_5
    , Css.focus
        [ Tw.outline_none
        , Tw.ring_2
        , Tw.ring_offset_2
        , Tw.ring_indigo_500
        ]
    , Css.hover
        [ Tw.bg_gray_50 ]
    ]


view : Model msg -> VirtualDom.Node msg
view model =
    let
        svgStyle =
            [ Tw.neg_ml_1_dot_5
            , Tw.mr_1
            , Tw.h_5
            , Tw.w_5
            , Tw.text_gray_400
            ]

        iconMethod =
            Icon.getHtml model.icon
    in
    Styled.toUnstyled <|
        Styled.button
            (model.attr
                ++ [ Attr.type_ "button"
                   , Attr.css baseButton
                   ]
            )
            [ Styled.span [ Attr.css svgStyle ] [ Styled.fromUnstyled <| iconMethod ]
            , Styled.text model.text
            , Css.Global.global Tw.globalStyles
            ]


update : msg -> Model msg -> ( Model msg, Cmd msg )
update _ model =
    ( model, Cmd.none )


subscriptions : Model msg -> Sub msg
subscriptions _ =
    Sub.none
