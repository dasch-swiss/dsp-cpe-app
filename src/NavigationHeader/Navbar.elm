module NavigationHeader.Navbar exposing (..)

import CustomCss.DaschTailwind as Dtw exposing (classList)
import Html exposing (Attribute, Html, a, div, nav, text)
import Html.Attributes exposing (class, href)
import NavigationHeader.Model exposing (Msg, NavItem)


navBar : List NavItem -> Html NavigationHeader.Model.Msg
navBar nb =
    div [ class navBarInnerStyle ] (renderNavItems nb)


renderNavItems : List NavItem -> List (Html NavigationHeader.Model.Msg)
renderNavItems nb =
    nb
        |> List.map (\n -> div [] [ navItem n ])


navItem : NavItem -> Html Msg
navItem n =
    nav []
        [ a
            (n.attrs
                ++ [ href n.href
                   , class navItemStyle
                   , getStyleForState n.isActive
                   ]
            )
            [ text n.text
            ]
        ]


getStyleForState : Bool -> Attribute msg
getStyleForState isActive =
    if isActive then
        class navItemActive

    else
        class navItemInactive



-- styles


navBarInnerStyle : String
navBarInnerStyle =
    [ Dtw.hidden
    , Dtw.md [ Dtw.ml_6, Dtw.flex, Dtw.space_x_8 ]
    ]
        |> classList


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
