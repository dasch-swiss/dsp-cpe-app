module NavigationHeader.HeaderButtons exposing (signInButton, signUpButton)

import Css exposing (backgroundColor, border, borderColor, borderStyle, px, solid)
import Css.CpeColorTheme exposing (primary, white)
import Css.Global
import Html.Styled as HtmlStyled exposing (Attribute, Html)
import Html.Styled.Attributes as Attr
import Tailwind.Utilities as Tw


signUpButton : List (Attribute msg) -> String -> Html msg
signUpButton attrs txt =
    view attrs txt singUpStyle


signInButton : List (Attribute msg) -> String -> Html msg
signInButton attrs txt =
    view attrs txt signInStyle


view : List (Attribute msg) -> String -> List Css.Style -> Html msg
view attrs txt style =
    HtmlStyled.button
        (attrs
            ++ [ Attr.type_ "button"
               , Attr.css style
               ]
        )
        [ HtmlStyled.text txt
        , Css.Global.global Tw.globalStyles
        ]


singUpStyle : List Css.Style
singUpStyle =
    [ Tw.px_4
    , Tw.py_2
    , Tw.inline_flex
    , Tw.items_center
    , Tw.justify_center
    , backgroundColor white
    , border (px 1)
    , borderColor primary
    , borderStyle solid
    , Tw.rounded
    , Tw.shadow_sm
    , Css.focus
        [ Tw.outline_none
        , Tw.ring_2
        , Tw.ring_inset
        ]
    , Css.color primary
    ]


signInStyle : List Css.Style
signInStyle =
    [ Tw.inline_flex
    , Tw.items_center
    , Tw.justify_center
    , Tw.px_4
    , Tw.py_2
    , Css.backgroundColor primary
    , border (px 1)
    , borderColor primary
    , borderStyle solid
    , Tw.rounded
    , Tw.shadow_sm
    , Tw.text_white
    , Css.focus
        [ Tw.outline_none
        , Tw.ring_2
        , Tw.ring_inset
        ]
    ]
