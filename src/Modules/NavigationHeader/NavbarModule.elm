module Modules.NavigationHeader.NavbarModule exposing (..)

import Html exposing (Html, div)
import Html.Attributes exposing (class)
import Modules.NavigationHeader.Navitem exposing (navItem)
import Shared.SharedTypes exposing (NavItem)
import Util.CustomCss.DaschTailwind as Dtw exposing (classList)


type alias NavBar msg =
    List (NavItem msg)


navBar : NavBar msg -> Html msg
navBar nb =
    div [ class navBarInnerStyle ] (renderNavItems nb)


renderNavItems : NavBar msg -> List (Html msg)
renderNavItems nb =
    nb
        |> List.map (\n -> div [] [ navItem n ])


navBarInnerStyle : String
navBarInnerStyle =
    [ Dtw.hidden
    , Dtw.md [ Dtw.ml_6, Dtw.flex, Dtw.space_x_8 ]
    ]
        |> classList
