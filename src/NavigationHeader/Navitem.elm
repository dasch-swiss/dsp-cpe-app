module NavigationHeader.Navitem exposing (..)

import Css
import Css.Global
import Html.Styled as HtmlStyled exposing (Attribute, Html)
import Html.Styled.Attributes as Attr exposing (class)
import Tailwind.Utilities as Tw


nItem : List (Attribute msg) -> String -> String -> Cmd msg -> Bool -> Html msg
nItem attrs text href cmd isActive =
    navItem { attrs = attrs, text = text, href = href, cmd = cmd, isActive = isActive }


type alias NavItem msg =
    { attrs : List (Attribute msg) -- onClick, disable and all other events as well as custom attributes
    , text : String
    , href : String -- set to "#" if you like to run sth via onClick
    , cmd : Cmd msg
    , isActive : Bool
    }


toClass : String -> Attribute msg
toClass str =
    class str


getStyle : Bool -> List Css.Style
getStyle isActive =
    if isActive then
        navItemActive

    else
        navItemInactive


navItem : NavItem msg -> HtmlStyled.Html msg
navItem n =
    HtmlStyled.nav []
        [ HtmlStyled.a
            (n.attrs
                ++ [ Attr.href n.href
                   , Attr.css navItemStyle
                   , Attr.css (getStyle n.isActive)
                   ]
            )
            [ HtmlStyled.text n.text
            , Css.Global.global Tw.globalStyles
            ]
        ]



-- styles


navItemStyle : List Css.Style
navItemStyle =
    [ Tw.inline_flex
    , Tw.items_center
    , Tw.px_1
    , Tw.pt_1
    , Tw.border_b_2
    , Tw.text_sm
    , Tw.font_medium
    ]


navItemActive : List Css.Style
navItemActive =
    [ Tw.border_indigo_500
    , Tw.text_gray_900
    ]


navItemInactive : List Css.Style
navItemInactive =
    [ Tw.border_transparent
    , Tw.text_gray_500
    , Css.hover
        [ Tw.text_gray_700
        , Tw.border_gray_300
        ]
    ]
