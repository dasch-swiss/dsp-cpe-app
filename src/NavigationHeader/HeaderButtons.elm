module NavigationHeader.HeaderButtons exposing (signInButton, signUpButton)

import CustomCss.DaschTailwind as Dtw
import Html exposing (Attribute, Html)
import Html.Attributes as Attr


signUpButton : List (Attribute msg) -> String -> Html msg
signUpButton attrs txt =
    view attrs txt signUpStyle


signInButton : List (Attribute msg) -> String -> Html msg
signInButton attrs txt =
    view attrs txt signInStyle


view : List (Attribute msg) -> String -> Attribute msg -> Html msg
view attrs txt style =
    Html.button
        (attrs
            ++ [ Attr.type_ "button"
               , style
               ]
        )
        [ Html.text txt
        ]


signUpStyle : Attribute msg
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
        |> Dtw.dtwClass



--     , Css.color primary


signInStyle : Attribute msg
signInStyle =
    [ Dtw.inline_flex
    , Dtw.items_center
    , Dtw.justify_center
    , Dtw.px_4
    , Dtw.py_2
    , Dtw.border
    , Dtw.rounded
    , Dtw.shadow_sm
    , Dtw.bg_medium_blue_700
    , Dtw.text_white
    , Dtw.onFocus
        [ Dtw.outline_none
        , Dtw.ring_2
        , Dtw.ring_inset
        ]
    ]
        |> Dtw.dtwClass



-- Css.backgroundColor primary
--    , borderColor primary
