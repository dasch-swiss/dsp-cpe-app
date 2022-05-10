module NavigationHeader.NavigationHeader exposing (HeaderModel, NavHeaderMsg, NavItem, update, view)

import Avatars.Avatar exposing (circular)
import Avatars.CircularAvatar exposing (CircularAvatarSize(..))
import Buttons.Button exposing (circularButton)
import Buttons.CircularButton exposing (CircularButtonSize(..))
import CustomCss.CssColors exposing (CustomColor(..))
import CustomCss.DaschTailwind as Dtw exposing (classList)
import Html exposing (Attribute, Html, div, img, input, nav, text)
import Html.Attributes exposing (class, href, id, placeholder, src, type_)
import Html.Events exposing (onClick)
import Icon


type NavHeaderMsg
    = ToggleSearchBarMsg
    | LogOutMsg
    | SignInRequestMsg
    | SignUpRequestMsg


type alias HeaderModel =
    { logo : String
    , navBar : List NavItem
    , user : Maybe User
    , showSearchBar : Bool
    }


type alias NavItem =
    { attrs : List (Attribute NavHeaderMsg) -- onClick, disable and all other events as well as custom attributes
    , text : String
    , href : String
    , cmd : Cmd NavHeaderMsg
    , isActive : Bool
    }


view : HeaderModel -> Html.Html NavHeaderMsg
view header =
    nav [ id "nav-header-bg-cntr", class navHeaderBgCntrStyle ]
        [ div [ id "standard-view-cntr", class navHeaderCntrStyle ]
            [ -- Nav header container for elements & menu entries
              div [ id "header-elements-cntr", class headerElementsCntrStyle ]
                [ -- "flex justify-between h-16"; Container for all the header elements
                  div [ id "flex-left-elements-cntr", class Dtw.flex ]
                    [ -- Flex all left side elements
                      div [ id "navBar-logo-cntr", class navBarLogoCntrStyle ]
                        [ img
                            [ src header.logo
                            , class logoStyle
                            ]
                            []
                        ]
                    , div [ id "mobile-menu-button-cntr", class mobileMenuButtonCntrStyle ] []
                    , div [ id "navbar-nav-cntr", class navBarCntrStyle ] [ navBar header.navBar ] -- navBar container; unhides on medium screen size  "hidden md:ml-6 md:flex md:space-x-8"
                    ]
                , div [ id "flex-right-elements-cntr", class flexRightElementsCntrStyle ]
                    [ div [ class (showButton header.showSearchBar) ]
                        [ circularButton CircularNormal Icon.ChevronRight [ onClick ToggleSearchBarMsg ]
                        ]
                    , div [ id "search-view-cntr", class (searchViewCntrStyle header.showSearchBar) ] [ searchBar ]
                    , div [ class (showButton (not header.showSearchBar)) ]
                        [ circularButton CircularNormal Icon.Search [ onClick ToggleSearchBarMsg ]
                        ]
                    ]

                -- right side elements: search bar, buttons.
                , div [ id "user-menu-cntr" ] [ userMenu header.user ]
                ]
            , div [ id "mobile-view-cntr", class mobileMenuButtonCntrStyle ] [] -- Container for mobile menu. Hidden if screen reaches medium size
            ]
        ]


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


searchViewCntrStyle : Bool -> String
searchViewCntrStyle showSb =
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


showButton : Bool -> String
showButton show =
    if show then
        Dtw.block

    else
        Dtw.hidden


update : NavHeaderMsg -> HeaderModel -> HeaderModel
update msg model =
    case msg of
        ToggleSearchBarMsg ->
            { model | showSearchBar = not model.showSearchBar }

        SignInRequestMsg ->
            { model | user = newUser }

        LogOutMsg ->
            { model | user = Nothing }

        SignUpRequestMsg ->
            { model | user = Nothing }



-- user


type alias User =
    { id : String
    , img : String
    }


userMenu : Maybe User -> Html NavHeaderMsg
userMenu user =
    case user of
        Nothing ->
            signedOutButtons

        Just u ->
            userBar u


userBar : User -> Html NavHeaderMsg
userBar user =
    div [ id "user-cntr", class Dtw.flex ]
        [ div [] [ userAvatar user ]
        , div [] [ signedInButton ]
        ]


userAvatar : User -> Html NavHeaderMsg
userAvatar user =
    div []
        [ circular CircularAvatarNormal user.img "UserAvatar" []
        ]


signedInButton : Html NavHeaderMsg
signedInButton =
    signInButton [ onClick LogOutMsg ] "sign out"


signedOutButtons : Html NavHeaderMsg
signedOutButtons =
    div []
        [ signUpButton [ onClick SignUpRequestMsg ] "sign up"
        , signInButton [ onClick SignInRequestMsg ] "sign in"
        ]


userDropDownStyle : String
userDropDownStyle =
    [ Dtw.hidden ]
        |> classList


newUser : Maybe User
newUser =
    Just
        { id = "someId"
        , img = "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
        }



-- navbar / navItems


navBar : List NavItem -> Html NavHeaderMsg
navBar nb =
    div [ class navBarInnerStyle ] (renderNavItems nb)


renderNavItems : List NavItem -> List (Html NavHeaderMsg)
renderNavItems navItems =
    navItems
        |> List.map (\n -> div [] [ navItem n ])


navItem : NavItem -> Html NavHeaderMsg
navItem n =
    nav
        (class navItemStyle :: href n.href :: getStyleForState n.isActive :: n.attrs)
        [ text n.text
        ]


getStyleForState : Bool -> Attribute msg
getStyleForState isActive =
    if isActive then
        class navItemActive

    else
        class navItemInactive


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



-- buttons


signUpButton : List (Attribute msg) -> String -> Html msg
signUpButton attrs txt =
    buttonView attrs txt signUpStyle


signInButton : List (Attribute msg) -> String -> Html msg
signInButton attrs txt =
    buttonView attrs txt signInStyle


buttonView : List (Attribute msg) -> String -> String -> Html msg
buttonView attrs txt style =
    Html.button
        (attrs
            ++ [ type_ "button"
               , class style
               ]
        )
        [ Html.text txt
        ]


signUpStyle : String
signUpStyle =
    [ Dtw.px_4
    , Dtw.py_2
    , Dtw.inline_flex
    , Dtw.items_center
    , Dtw.justify_center
    , Dtw.bg_white
    , Dtw.border
    , Dtw.rounded
    , Dtw.shadow_sm
    , Dtw.onFocus
        [ Dtw.outline_none
        , Dtw.ring_2
        , Dtw.ring_inset
        ]
    ]
        |> Dtw.classList


signInStyle : String
signInStyle =
    [ Dtw.inline_flex
    , Dtw.items_center
    , Dtw.justify_center
    , Dtw.px_4
    , Dtw.py_2
    , Dtw.border
    , Dtw.rounded
    , Dtw.shadow_sm
    , Dtw.bg_blue_700
    , Dtw.text_white
    , Dtw.onFocus
        [ Dtw.outline_none
        , Dtw.ring_2
        , Dtw.ring_inset
        ]
    ]
        |> Dtw.classList



-- searchBar


searchBar : Html msg
searchBar =
    div [ id "outer-search-ct", class outerSearchCtStyle ]
        [ input [ type_ "Text", placeholder "Search", class searchBarStyle ] [] ]


outerSearchCtStyle : String
outerSearchCtStyle =
    [ Dtw.flex
    , Dtw.justify_between
    , Dtw.items_center
    ]
        |> classList


searchBarStyle : String
searchBarStyle =
    [ Dtw.block
    , Dtw.w_full
    , Dtw.max_w_lg
    , Dtw.pl_10
    , Dtw.pr_3
    , Dtw.py_2
    , Dtw.border
    , Dtw.leading_5
    , Dtw.text_gray_300
    , Dtw.placeholder_gray_400
    , Dtw.outline_none
    , Dtw.md [ Dtw.rounded ]
    , Dtw.lg [ Dtw.max_w_xs ]
    , Dtw.onFocus [ Dtw.outline_none, Dtw.ring_white, Dtw.text_gray_900 ]
    , Dtw.sm [ Dtw.text_sm ]
    , Dtw.custom_bg White
    ]
        |> classList
