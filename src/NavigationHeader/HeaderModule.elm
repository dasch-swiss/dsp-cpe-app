module NavigationHeader.HeaderModule exposing (..)

import CustomCss.DaschTailwind as Dtw exposing (dtwClass)
import Html exposing (Attribute, Html, div, img, nav)
import Html.Attributes exposing (class, id, src)
import NavigationHeader.HeaderButtons exposing (signInButton, signUpButton)
import NavigationHeader.NavbarModule exposing (NavBar, navBar)
import NavigationHeader.SearchBar exposing (searchBar)
import NavigationHeader.UserMenuModule exposing (User, userMenu)


cpeHeader : String -> Bool -> NavBar msg -> Bool -> Html.Html msg
cpeHeader logo signedIn bar showSb =
    nav [ id "nav-header-bg-cntr", navHeaderBgCntrStyle ]
        [ div [ id "standard-view-cntr", navHeaderCntrStyle ]
            [ -- Nav header container for elements & menu entries
              div [ id "header-elements-cntr", headerElementsCntrStyle ]
                [ -- "flex justify-between h-16"; Container for all the header elements
                  div [ id "flex-left-elements-cntr", class Dtw.flex ]
                    [ -- Flex all left side elements
                      div [ id "navBar-logo-cntr", dtwClass [ Dtw.flex_shrink_0, Dtw.items_center, Dtw.h_3_dot_5 ] ]
                        [ img
                            [ src logo
                            , dtwClass [ Dtw.inline_block, Dtw.max_h_12 ]
                            ]
                            []
                        ]
                    , div [ id "mobile-menu-button-cntr", mobileMenuButtonCntrStyle ] []
                    , div [ id "navbar-nav-cntr", navBarCntrStyle ] [ navBar bar ] -- navBar container; unhides on medium screen size  "hidden md:ml-6 md:flex md:space-x-8"
                    ]
                , div [ id "flex-right-elements-cntr", flexRightElementsCntrStyle ]
                    -- right side elements: search bar, buttons.
                    [ div [ id "search-view-cntr", searchBarStyle showSb ] [ searchBar ]
                    , div [ id "user-menue-cntr" ] [ userMenu fakeUser ]

                    -- the search bar
                    ]
                ]
            , div [ id "mobile-view-cntr", mobileMenuButtonCntrStyle ] [] -- Container for mobile menu. Hidden if screen reaches medium size
            ]
        ]


type SignedIn
    = True
    | False


buttonGroup : Bool -> List (Html msg)
buttonGroup signedIn =
    if signedIn then
        [ signInButton [] "sign out"
        ]

    else
        [ signUpButton [] "sign up"
        , signInButton [] "sign in"
        ]



-- styles


navHeaderBgCntrStyle : Attribute msg
navHeaderBgCntrStyle =
    [ Dtw.bg_white
    , Dtw.shadow
    ]
        |> dtwClass


navHeaderCntrStyle : Attribute msg
navHeaderCntrStyle =
    [ Dtw.max_w_7xl
    , Dtw.mx_auto
    , Dtw.px_4
    ]
        |> dtwClass


headerElementsCntrStyle : Attribute msg
headerElementsCntrStyle =
    [ Dtw.flex
    , Dtw.justify_between
    , Dtw.h_16
    ]
        |> dtwClass


mobileMenuButtonCntrStyle : Attribute msg
mobileMenuButtonCntrStyle =
    [ Dtw.neg_ml_2
    , Dtw.mr_2
    , Dtw.flex
    , Dtw.items_center
    , Dtw.md [ Dtw.hidden ] -- hidden if break point reaches screen size medium
    ]
        |> dtwClass


navBarCntrStyle : Attribute msg
navBarCntrStyle =
    [ Dtw.hidden
    , Dtw.md [ Dtw.ml_6, Dtw.flex, Dtw.space_x_8 ]
    , Dtw.self_center
    ]
        |> dtwClass


flexRightElementsCntrStyle : Attribute msg
flexRightElementsCntrStyle =
    [ Dtw.flex, Dtw.items_center, Dtw.space_x_4, Dtw.md [ Dtw.ml_6, Dtw.justify_end ] ]
        |> dtwClass


searchBarStyle : Bool -> Attribute msg
searchBarStyle showSb =
    if showSb then
        [ Dtw.flex_1
        , Dtw.flex
        , Dtw.justify_center
        , Dtw.px_2
        , Dtw.justify_between
        ]
            |> dtwClass

    else
        class Dtw.hidden


mobileMenuCntrStyle : Attribute msg
mobileMenuCntrStyle =
    [ Dtw.md
        [ -- if breakpoint reaches medium size
          Dtw.hidden
        ]
    ]
        |> dtwClass


fakeUser : User
fakeUser =
    { uId = "sthId"
    , uImg = "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
    }
