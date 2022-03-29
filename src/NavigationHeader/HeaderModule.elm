module NavigationHeader.HeaderModule exposing (..)

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
    HtmlStyled.nav navHeaderBgCntr
        [ HtmlStyled.div navHeaderCntr
            [ -- Nav header container for elements & menu entries
              HtmlStyled.div headerElementsCntr
                [ -- "flex justify-between h-16"; Container for all the header elements
                  HtmlStyled.div flexLeftElementsCntr
                    [ -- Flex all left side elements
                      HtmlStyled.div navBarLogoCntr
                        [ HtmlStyled.img [ src logo, css [ Tw.inline_block, Tw.max_h_12 ] ] []
                        ]
                    , HtmlStyled.div mobileMenuButtonCntr
                        []
                    , HtmlStyled.div navBarCntr [ navBar bar ] -- NavBar container; unhides on medium screen size  "hidden md:ml-6 md:flex md:space-x-8"
                    ]
                , HtmlStyled.div (searchBarCntr showSb)
                    [ searchBar
                    ]

                -- the search bar
                , HtmlStyled.div flexRightElementsCntr
                    -- right side elements: search bar, Buttons.
                    (buttonGroup signedIn)
                ]
            ]
        , HtmlStyled.div mobileMenuCntr [] -- Container for mobile menu. Hidden if screen reaches medium size
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


navHeaderBgCntr : List (Attribute msg)
navHeaderBgCntr =
    [ id "nav-header-bg-cntr", attribute "data-tw-class" "bg-white shadow", navHeaderBgCntrStyle ]


navHeaderBgCntrStyle : Attribute msg
navHeaderBgCntrStyle =
    [ Tw.bg_white
    , Tw.shadow
    ]
        |> css



-- Container for the navHeader


navHeaderCntr : List (Attribute msg)
navHeaderCntr =
    [ id "standard-view-cntr", attribute "data-tw-class" "max-w-7xl mx-auto px-4", navHeaderCntrStyle ]


navHeaderCntrStyle : Attribute msg
navHeaderCntrStyle =
    [ Tw.max_w_7xl
    , Tw.mx_auto
    , Tw.px_4
    ]
        |> css


searchBarCntr : Bool -> List (Attribute msg)
searchBarCntr showSb =
    if showSb then
        [ id "standard-view-cntr", attribute "data-tw-class" "flex-1 flex justify-center px-2 lg:ml-6 lg:justify-end", searchBarStyle ]

    else
        [ css [ Tw.hidden ] ]


searchBarStyle : Attribute msg
searchBarStyle =
    [ Tw.flex_1
    , Tw.flex
    , Tw.justify_center
    , Tw.px_2
    , Bp.lg [ Tw.ml_6, Tw.justify_end ]
    ]
        |> css


headerElementsCntr : List (Attribute msg)
headerElementsCntr =
    [ id "header-elements-cntr", attribute "data-tw-class" "flex justify-between h-16", headerElementsCntrStyle ]



-- Container for all header elements


headerElementsCntrStyle : Attribute msg
headerElementsCntrStyle =
    [ Tw.flex
    , Tw.justify_between
    , Tw.h_16
    ]
        |> css



-- Container for al left elements


flexLeftElementsCntr : List (Attribute msg)
flexLeftElementsCntr =
    [ id "flex-left-elements-cntr", attribute "data-tw-class" "flex", css [ Tw.flex ] ]


mobileMenuButtonCntr : List (Attribute msg)
mobileMenuButtonCntr =
    [ id "mobile-menu-button-cntr", attribute "data-tw-class" "-ml-2 mr-2 flex items-center md:hidden", mobileMenuButtonCntrStyle ]


mobileMenuButtonCntrStyle : Attribute msg
mobileMenuButtonCntrStyle =
    [ Tw.neg_ml_2
    , Tw.mr_2
    , Tw.flex
    , Tw.items_center
    , Bp.md [ Tw.hidden ] -- hidden if break point reaches screen size medium
    ]
        |> css


navBarLogoCntr : List (Attribute msg)
navBarLogoCntr =
    [ id "navBar-logo-cntr"
    , attribute "data-tw-class" "flex-shrink-0 flex items-center"
    , css [ Tw.flex_shrink_0, Tw.items_center, Tw.h_3_dot_5 ]
    ]


navBarCntr : List (Attribute msg)
navBarCntr =
    [ id "navbar-nav-cntr"
    , attribute "data-tw-class" "hidden md:ml-6 md:flex md:space-x-8"
    , navBarCntrStyle
    ]


navBarCntrStyle : Attribute msg
navBarCntrStyle =
    [ Tw.hidden
    , Bp.md [ Tw.ml_6, Tw.flex, Tw.space_x_8 ]
    , Tw.self_center
    ]
        |> css



-- Container for all right elements


flexRightElementsCntr : List (Attribute msg)
flexRightElementsCntr =
    [ id "flex-right-elements-cntr", attribute "data-tw-class" "flex items-center space-x-4", css [ Tw.flex, Tw.items_center, Tw.space_x_4 ] ]



-- the mobile menu container. Hidden if the screen size reaches medium size


mobileMenuCntr : List (Attribute msg)
mobileMenuCntr =
    [ id "mobile-view-cntr"
    , attribute "data-tw-class" "md:hidden"
    , css
        [ Bp.md
            [ -- if breakpoint reaches medium size
              Tw.hidden
            ]
        ]
    ]
