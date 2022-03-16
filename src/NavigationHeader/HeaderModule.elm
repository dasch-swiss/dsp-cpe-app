module NavigationHeader.HeaderModule exposing (..)

import Css exposing (hex)
import Html.Styled as HtmlStyled exposing (Attribute)
import Html.Styled.Attributes exposing (attribute, css, id, src)
import NavigationHeader.HeaderButtons exposing (signInButton, signUpButton)
import NavigationHeader.NavbarModule exposing (NavBar, navBar)
import NavigationHeader.SearchBar exposing (searchBar)
import Tailwind.Breakpoints as Bp
import Tailwind.Utilities as Tw
import VirtualDom exposing (Node)


cpeHeader : String -> Bool -> NavBar msg -> Bool -> Node msg
cpeHeader logo signedIn bar showSb =
    HtmlStyled.nav navHeaderBgCt
        [ -- "bg-white shadow"
          HtmlStyled.div navHeaderCt
            [ -- "max-w-7xl mx-auto px-4 sm:px-6 lg:px-8"; Nav header container for elements & menu entries
              HtmlStyled.div headerElementsCt
                [ -- "flex justify-between h-16"; Container for all the header elements
                  HtmlStyled.div flexLeftElementsCt
                    [ -- "flex"; Flex all left side elements
                      HtmlStyled.div navBarLogoCt
                        [ -- "flex-shrink-0 flex items-center"; shrinking icon / logo
                          HtmlStyled.img [ src logo, css [ Tw.inline_block, Tw.max_h_12 ] ] []
                        ]
                    , HtmlStyled.div mobileMenuButtonCt
                        [-- "-ml-2 mr-2 flex items-center md:hidden", mobile menue button container
                         -- Todo: 1) button; 2) button hides on medium screen size && if searchBar === open -> if/else ...
                        ]
                    , HtmlStyled.div navBarCt [ navBar bar ] -- NavBar container; unhides on medium screen size  "hidden md:ml-6 md:flex md:space-x-8"

                    -- Todo: unhides also on collapse search bar
                    ]
                , HtmlStyled.div (searchBarCt showSb)
                    [ searchBar
                    ]

                -- the search bar
                , HtmlStyled.div flexRightElementsCt
                    -- right side elements: search bar, Buttons.
                    (buttonGroup signedIn)
                ]
            ]
        , HtmlStyled.div mobileMenuCt [] -- Container for mobile menu. Hidden if screen reaches medium size
        ]
        |> HtmlStyled.toUnstyled


type SignedIn
    = True
    | False


buttonGroup : Bool -> List (HtmlStyled.Html msg)
buttonGroup signedIn =
    if signedIn then
        [ signInButton [] "sign out"
        ]

    else
        [ signUpButton [] "sign up"
        , signInButton [] "sign in"
        ]



-- attributes & classes ...
-- the navBar background container


navHeaderBgCt : List (Attribute msg)
navHeaderBgCt =
    [ id "nav-header-bg-ct", attribute "data-tw-class" "bg-white shadow", navHeaderBgCtStyle ]


navHeaderBgCtStyle : Attribute msg
navHeaderBgCtStyle =
    [ Tw.bg_white
    , Tw.shadow
    ]
        |> css



-- Container for the navHeader


navHeaderCt : List (Attribute msg)
navHeaderCt =
    [ id "standard-view-ct", attribute "data-tw-class" "max-w-7xl mx-auto px-4", navHeaderCtStyle ]


navHeaderCtStyle : Attribute msg
navHeaderCtStyle =
    [ Tw.max_w_7xl
    , Tw.mx_auto
    , Tw.px_4
    ]
        |> css


searchBarCt : Bool -> List (Attribute msg)
searchBarCt showSb =
    if showSb then
        [ id "standard-view-ct", attribute "data-tw-class" "flex-1 flex justify-center px-2 lg:ml-6 lg:justify-end", searchBarStyle ]

    else
        [ css [ Tw.hidden ] ]



-- hides the search bar


searchBarStyle : Attribute msg
searchBarStyle =
    [ Tw.flex_1
    , Tw.flex
    , Tw.justify_center
    , Tw.px_2
    , Bp.lg [ Tw.ml_6, Tw.justify_end ]
    ]
        |> css


headerElementsCt : List (Attribute msg)
headerElementsCt =
    [ id "header-elements-ct", attribute "data-tw-class" "flex justify-between h-16", headerElementsCtStyle ]



-- Container for all header elements


headerElementsCtStyle : Attribute msg
headerElementsCtStyle =
    [ Tw.flex
    , Tw.justify_between
    , Tw.h_16
    ]
        |> css



-- Container for al left elements


flexLeftElementsCt : List (Attribute msg)
flexLeftElementsCt =
    [ id "flex-left-elements-ct", attribute "data-tw-class" "flex", css [ Tw.flex ] ]


mobileMenuButtonCt : List (Attribute msg)
mobileMenuButtonCt =
    [ id "mobile-menu-button-ct", attribute "data-tw-class" "-ml-2 mr-2 flex items-center md:hidden", mobileMenuButtonCtStyle ]


mobileMenuButtonCtStyle : Attribute msg
mobileMenuButtonCtStyle =
    [ Tw.neg_ml_2
    , Tw.mr_2
    , Tw.flex
    , Tw.items_center
    , Bp.md [ Tw.hidden ] -- hidden if break point reaches screen size medium
    ]
        |> css


navBarLogoCt : List (Attribute msg)
navBarLogoCt =
    [ id "navBar-logo-ct"
    , attribute "data-tw-class" "flex-shrink-0 flex items-center"
    , css [ Tw.flex_shrink_0, Tw.items_center, Tw.h_3_dot_5 ]
    ]


navBarCt : List (Attribute msg)
navBarCt =
    [ id "navbar-nav-ct"
    , attribute "data-tw-class" "hidden md:ml-6 md:flex md:space-x-8"
    , navBarCtStyle
    ]


navBarCtStyle : Attribute msg
navBarCtStyle =
    [ Tw.hidden
    , Bp.md [ Tw.ml_6, Tw.flex, Tw.space_x_8 ]
    , Tw.self_center
    ]
        |> css



-- Container for al left elements


flexRightElementsCt : List (Attribute msg)
flexRightElementsCt =
    [ id "flex-right-elements-ct", attribute "data-tw-class" "flex items-center space-x-4", css [ Tw.flex, Tw.items_center, Tw.space_x_4 ] ]



-- the mobile menue container. Hidden if the screen size reaches medium size


mobileMenuCt : List (Attribute msg)
mobileMenuCt =
    [ id "mobile-view-ct"
    , attribute "data-tw-class" "md:hidden"
    , css
        [ Bp.md
            [ -- if breakpoint reaches medium size
              Tw.hidden
            ]
        ]
    ]



-- colors


primary : Css.Color
primary =
    medium_blue_700


medium_blue_700 : Css.Color
medium_blue_700 =
    hex "#1D4ED8"


medium_blue_500 : Css.Color
medium_blue_500 =
    hex "#1D4ED8"


white : Css.Color
white =
    hex "#FFFFFF"


passiveGray : Css.Color
passiveGray =
    hex "D1D5DB"


activeGray : Css.Color
activeGray =
    hex "6B7280"
