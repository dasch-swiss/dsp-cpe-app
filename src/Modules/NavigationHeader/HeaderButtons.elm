module Modules.NavigationHeader.HeaderButtons exposing (signInButton, signUpButton)

import Html exposing (Attribute, Html)
import Html.Attributes as Attr exposing (class)
import Util.CustomCss.DaschTailwind as Dtw


signUpButton : List (Attribute msg) -> String -> Html msg
signUpButton attrs txt =
    view attrs txt signUpStyle


signInButton : List (Attribute msg) -> String -> Html msg
signInButton attrs txt =
    view attrs txt signInStyle


view : List (Attribute msg) -> String -> String -> Html msg
view attrs txt style =
    Html.button
        (attrs
            ++ [ Attr.type_ "button"
               , class style
               ]
        )
        [ Html.text txt
        ]


signUpStyle : String
signUpStyle =
    [ Dtw.px_4
    , Dtw.py_2
    , Dtw.inline_flex
    , Dtw.items_center
    , Dtw.justify_center
    , Dtw.bg_white
    , Dtw.border
    , Dtw.rounded
    , Dtw.shadow_sm
    , Dtw.onFocus
        [ Dtw.outline_none
        , Dtw.ring_2
        , Dtw.ring_inset
        ]
    ]
        |> Dtw.classList


signInStyle : String
signInStyle =
    [ Dtw.inline_flex
    , Dtw.items_center
    , Dtw.justify_center
    , Dtw.px_4
    , Dtw.py_2
    , Dtw.border
    , Dtw.rounded
    , Dtw.shadow_sm
    , Dtw.bg_blue_700
    , Dtw.text_white
    , Dtw.onFocus
        [ Dtw.outline_none
        , Dtw.ring_2
        , Dtw.ring_inset
        ]
    ]
        |> Dtw.classList
