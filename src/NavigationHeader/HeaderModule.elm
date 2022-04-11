module NavigationHeader.HeaderModule exposing (..)

import CustomCss.DaschTailwind as Dtw exposing (classList)
import Html exposing (div, img, nav)
import Html.Attributes exposing (class, id, src)
import NavigationHeader.NavbarModule exposing (NavBar, navBar)
import NavigationHeader.SearchBar exposing (searchBar)
import NavigationHeader.UserMenuModule exposing (User, userMenu)



--cpeHeader : String -> Bool -> NavBar msg -> Bool -> Html.Html msg


cpeHeader : String -> Maybe User -> NavBar msg -> Bool -> Html.Html msg
cpeHeader logo user bar showSb =
    nav [ id "nav-header-bg-cntr", class navHeaderBgCntrStyle ]
        [ div [ id "standard-view-cntr", class navHeaderCntrStyle ]
            [ -- Nav header container for elements & menu entries
              div [ id "header-elements-cntr", class headerElementsCntrStyle ]
                [ -- "flex justify-between h-16"; Container for all the header elements
                  div [ id "flex-left-elements-cntr", class Dtw.flex ]
                    [ -- Flex all left side elements
                      div [ id "navBar-logo-cntr", class navBarLogoCntrStyle ]
                        [ img
                            [ src logo
                            , class logoStyle
                            ]
                            []
                        ]
                    , div [ id "mobile-menu-button-cntr", class mobileMenuButtonCntrStyle ] []
                    , div [ id "navbar-nav-cntr", class navBarCntrStyle ] [ navBar bar ] -- navBar container; unhides on medium screen size  "hidden md:ml-6 md:flex md:space-x-8"
                    ]
                , div [ id "flex-right-elements-cntr", class flexRightElementsCntrStyle ]
                    -- right side elements: search bar, buttons.
                    [ div [ id "search-view-cntr", class (searchBarStyle showSb) ] [ searchBar ]
                    , div [ id "user-menue-cntr" ] [ userMenu user ]

                    -- the search bar
                    ]
                ]
            , div [ id "mobile-view-cntr", class mobileMenuButtonCntrStyle ] [] -- Container for mobile menu. Hidden if screen reaches medium size
            ]
        ]



-- styles


navHeaderBgCntrStyle : String
navHeaderBgCntrStyle =
    [ Dtw.bg_white
    , Dtw.shadow
    ]
        |> classList


navHeaderCntrStyle : String
navHeaderCntrStyle =
    [ Dtw.max_w_7xl
    , Dtw.mx_auto
    , Dtw.px_4
    ]
        |> classList


headerElementsCntrStyle : String
headerElementsCntrStyle =
    [ Dtw.flex
    , Dtw.justify_between
    , Dtw.h_16
    ]
        |> classList


navBarLogoCntrStyle : String
navBarLogoCntrStyle =
    [ Dtw.flex_shrink_0, Dtw.items_center, Dtw.h_3_dot_5 ]
        |> classList


logoStyle : String
logoStyle =
    [ Dtw.inline_block, Dtw.max_h_12 ]
        |> classList


mobileMenuButtonCntrStyle : String
mobileMenuButtonCntrStyle =
    [ Dtw.neg_ml_2
    , Dtw.mr_2
    , Dtw.flex
    , Dtw.items_center
    , Dtw.md [ Dtw.hidden ] -- hidden if break point reaches screen size medium
    ]
        |> classList


navBarCntrStyle : String
navBarCntrStyle =
    [ Dtw.hidden
    , Dtw.md [ Dtw.ml_6, Dtw.flex, Dtw.space_x_8 ]
    , Dtw.self_center
    ]
        |> classList


flexRightElementsCntrStyle : String
flexRightElementsCntrStyle =
    [ Dtw.flex, Dtw.items_center, Dtw.space_x_4, Dtw.md [ Dtw.ml_6, Dtw.justify_end ] ]
        |> classList


searchBarStyle : Bool -> String
searchBarStyle showSb =
    if showSb then
        [ Dtw.flex_1
        , Dtw.flex
        , Dtw.justify_center
        , Dtw.px_2
        , Dtw.justify_between
        ]
            |> classList

    else
        Dtw.hidden


mobileMenuCntrStyle : String
mobileMenuCntrStyle =
    [ Dtw.md
        [ -- if breakpoint reaches medium size
          Dtw.hidden
        ]
    ]
        |> classList


fakeUser : Maybe User
fakeUser =
    Just
        { uId = "sthId"
        , uImg = "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
        }
