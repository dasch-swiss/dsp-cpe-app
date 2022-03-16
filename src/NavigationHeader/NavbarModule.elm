module NavigationHeader.NavbarModule exposing (..)

import Css
import Html.Styled as HtmlStyled
import Html.Styled.Attributes as Attr
import NavigationHeader.Navitem exposing (NavItem, navItem)
import Tailwind.Utilities as Tw


type alias NavBar msg =
    List (NavItem msg)


navBar : NavBar msg -> HtmlStyled.Html msg
navBar nb =
    HtmlStyled.div [ Attr.css navBarInner ] (renderNavItems nb)



{- , HtmlStyled.div [ Attr.css navBarInner ] (renderNavButtons nb) -}


renderNavItems : NavBar msg -> List (HtmlStyled.Html msg)
renderNavItems nb =
    nb
        |> List.map (\n -> HtmlStyled.div [] [ navItem n ])



{-
   renderNavButtons : NavBar msg-> List (HtmlStyled.Html msg)
   renderNavButtons nb =
       nb
       |> List.map (\n -> HtmlStyled.div [] [ navButton n.attrs n.text])

-}
-- styles


navBarInner : List Css.Style
navBarInner =
    [ Tw.hidden
    , Tw.ml_6
    , Tw.flex
    , Tw.space_x_8
    ]
