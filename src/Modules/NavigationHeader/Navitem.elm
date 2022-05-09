module Modules.NavigationHeader.Navitem exposing (..)

import Html exposing (Attribute, Html, a, nav, text)
import Html.Attributes as Attr exposing (class)
import Shared.SharedTypes exposing (NavItem)
import Util.CustomCss.DaschTailwind as Dtw exposing (classList)


nItem : List (Attribute msg) -> String -> String -> Cmd msg -> Bool -> Html msg
nItem attrs text href cmd isActive =
    navItem { attrs = attrs, text = text, href = href, cmd = cmd, isActive = isActive }


toClass : String -> Attribute msg
toClass str =
    class str


getStyle : Bool -> Attribute msg
getStyle isActive =
    if isActive then
        class navItemActive

    else
        class navItemInactive


navItem : NavItem msg -> Html msg
navItem n =
    nav []
        [ a
            (n.attrs
                ++ [ Attr.href n.href
                   , class navItemStyle
                   , getStyle n.isActive
                   ]
            )
            [ text n.text
            ]
        ]



-- styles


navItemStyle : String
navItemStyle =
    [ Dtw.inline_flex
    , Dtw.items_center
    , Dtw.px_1
    , Dtw.pt_1
    , Dtw.border_b_2
    , Dtw.text_sm
    , Dtw.font_medium
    ]
        |> classList


navItemActive : String
navItemActive =
    [ Dtw.border_indigo_500
    , Dtw.text_gray_900
    ]
        |> classList


navItemInactive : String
navItemInactive =
    [ Dtw.border_transparent
    , Dtw.text_gray_500
    , Dtw.onHover
        [ Dtw.text_gray_700
        , Dtw.border_gray_300
        ]
    ]
        |> classList
