module NavigationHeader.NavbarModule exposing (..)

import CustomCss.DaschTailwind as Dtw exposing (dtwClass)
import Html exposing (Html, div)
import NavigationHeader.Navitem exposing (NavItem, navItem)


type alias NavBar msg =
    List (NavItem msg)


navBar : NavBar msg -> Html msg
navBar nb =
    div [ navBarInnerStyle ] (renderNavItems nb)


renderNavItems : NavBar msg -> List (Html msg)
renderNavItems nb =
    nb
        |> List.map (\n -> div [] [ navItem n ])



-- styles
-- done: "hidden md:ml-6 md:flex md:space-x-8"


navBarInnerStyle : Html.Attribute msg
navBarInnerStyle =
    [ Dtw.hidden
    , Dtw.md [ Dtw.ml_6, Dtw.flex, Dtw.space_x_8 ]
    ]
        |> dtwClass
