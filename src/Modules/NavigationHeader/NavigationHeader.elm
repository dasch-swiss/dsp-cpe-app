module Modules.NavigationHeader.NavigationHeader exposing (HeaderModel, Logo, Msg(..), NavItem, User, update, view)

import Html exposing (Attribute, Html, a, button, div, img, input, nav, span, text)
import Html.Attributes exposing (alt, class, href, id, placeholder, src, type_)
import Html.Attributes.Aria exposing (ariaControls, ariaExpanded, ariaHidden)
import Html.Events exposing (onClick)
import Modules.Avatars.CircularAvatar as CircularAvatar
import Modules.Buttons.CircularButton as CircularButton
import Shared.SharedTypes exposing (CircularAvatarSize(..), CircularButtonSize(..))
import Util.CustomCss.CssColors exposing (CustomColor(..))
import Util.CustomCss.DaschTailwind as Dtw exposing (classList)
import Util.Icon as Icon exposing (Icon(..))


type Msg
    = ToggleSearchBarMsg
    | ToggleMobileMenuMsg
    | LogOutMsg
    | SignInRequestMsg
    | SignUpRequestMsg


type alias HeaderModel =
    { logo : Logo
    , navBar : List NavItem
    , user : Maybe User
    , showSearchBar : Bool
    , showMobileMenu : Bool
    }


type alias NavItem =
    { attrs : List (Attribute Msg) -- onClick, disable and all other events as well as custom attributes
    , text : String
    , href : String
    , cmd : Cmd Msg
    , isActive : Bool
    }


view : HeaderModel -> Html.Html Msg
view header =
    nav [ id "nav-header-bg-cntr", class navHeaderBgCntrStyle ]
        [ div [ id "standard-view-cntr", class navHeaderCntrStyle ]
            [ div [ id "header-elements-cntr", class headerElementsCntrStyle ]
                [ div [ id "flex-left-elements-cntr", class Dtw.flex ]
                    [ div [ id "navBar-logo-cntr", class navBarLogoCntrStyle ]
                        [ logo header.logo
                        ]
                    , div [ id "mobile-menu-cntr", class (mobileMenuButtonCntrStyle header.showSearchBar) ]
                        [ mobileMenuButton
                        ]
                    , div [ id "navbar-nav-cntr", class (navBarCntrStyle header.showSearchBar) ] [ navBar header.navBar ]
                    ]

                -- right side elements: search bar, buttons.
                , div [ id "flex-right-elements-cntr", class flexRightElementsCntrStyle ]
                    [ div [ class (display header.showSearchBar) ]
                        [ CircularButton.view { size = CircularNormal, icon = ChevronRight, attrs = [ onClick ToggleSearchBarMsg ] }
                        ]
                    , div [ id "search-view-cntr", class (searchViewCntrStyle header.showSearchBar) ] [ searchBar ]
                    , div [ class (display (not header.showSearchBar)) ]
                        [ CircularButton.view { size = CircularNormal, icon = Search, attrs = [ onClick ToggleSearchBarMsg ] }
                        ]
                    ]
                , div [ id "user-menu-cntr" ] [ userMenu header.user ]
                ]
            ]
        , mobileMenu header.navBar header.showMobileMenu
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
    , Dtw.px_2
    , Dtw.sm
        [ Dtw.px_6
        ]
    , Dtw.lg
        [ Dtw.px_8
        ]
    ]
        |> classList


headerElementsCntrStyle : String
headerElementsCntrStyle =
    [ Dtw.relative
    , Dtw.flex
    , Dtw.justify_between
    , Dtw.h_16
    ]
        |> classList


navBarLogoCntrStyle : String
navBarLogoCntrStyle =
    [ Dtw.flex_shrink_0, Dtw.items_center, Dtw.h_3_dot_5 ]
        |> classList


navBarCntrStyle : Bool -> String
navBarCntrStyle showSearchBar =
    if showSearchBar then
        [ Dtw.hidden ]
            |> classList

    else
        [ Dtw.hidden -- also hidden if smaller than md
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



-- the mobile menu button and the mobile menu items


mobileMenuButton : Html Msg
mobileMenuButton =
    div []
        [ button [ id "mobile-menu-button", type_ "button", class mobileMenuButtonStyle, onClick ToggleMobileMenuMsg ]
            [ span
                [ id "mobile-menu-icon"
                , class iconstyle
                ]
                [ Icon.getHtml Menu ]
            ]
        ]


iconstyle : String
iconstyle =
    [ Dtw.h_5
    , Dtw.w_5
    ]
        |> Dtw.classList


mobileMenuButtonStyle : String
mobileMenuButtonStyle =
    [ Dtw.inline_flex
    , Dtw.items_center
    , Dtw.justify_center
    , Dtw.p_2
    , Dtw.rounded_md
    , Dtw.text_gray_400
    , Dtw.onHover
        [ Dtw.text_gray_500
        , Dtw.bg_gray_100
        ]
    , Dtw.onFocus
        [ Dtw.outline_none
        , Dtw.ring_inset
        , Dtw.ring_indigo_500
        ]
    ]
        |> classList


mobileMenu : List NavItem -> Bool -> Html Msg
mobileMenu navItems showMenu =
    if showMenu then
        div [ id "mobile-menu", class mobileMenuStyle ] (mobileMenuEntries navItems)

    else
        div [ id "mobile-menu", class Dtw.hidden ] []


mobileMenuStyle : String
mobileMenuStyle =
    [ Dtw.pt_2
    , Dtw.pb_3
    , Dtw.space_y_1
    ]
        |> classList


mobileMenuEntries : List NavItem -> List (Html Msg)
mobileMenuEntries navItems =
    navItems
        |> List.map (\n -> div [ href n.href ] [ a [] [ text n.text ] ])


display : Bool -> String
display show =
    if show then
        Dtw.block

    else
        Dtw.hidden


mobileMenuButtonCntrStyle : Bool -> String
mobileMenuButtonCntrStyle displayMenu =
    if displayMenu then
        -- displayed
        [ Dtw.neg_ml_2
        , Dtw.mr_2
        , Dtw.flex
        , Dtw.items_center
        ]
            |> classList

    else
        -- still displayed except screen size bigger than md
        [ Dtw.neg_ml_2
        , Dtw.mr_2
        , Dtw.flex
        , Dtw.items_center
        , Dtw.md
            [ Dtw.hidden
            ]
        ]
            |> classList


update : Msg -> HeaderModel -> HeaderModel
update msg model =
    case msg of
        ToggleSearchBarMsg ->
            { model
                | showSearchBar = not model.showSearchBar
                , showMobileMenu = False
            }

        ToggleMobileMenuMsg ->
            { model | showMobileMenu = not model.showMobileMenu }

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


userMenu : Maybe User -> Html Msg
userMenu user =
    case user of
        Nothing ->
            signedOutButtons

        Just u ->
            userBar u


userBar : User -> Html Msg
userBar user =
    div [ id "user-cntr", class Dtw.flex ]
        [ div [] [ userAvatar user ]
        , div [] [ signedInButton ]
        ]


userAvatar : User -> Html Msg
userAvatar user =
    div []
        [ CircularAvatar.view { size = CircularAvatarNormal, img = user.img, alt = "UserAvatar", attrs = [] }
        ]


signedInButton : Html Msg
signedInButton =
    signInButton [ onClick LogOutMsg ] "sign out"


signedOutButtons : Html Msg
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


navBar : List NavItem -> Html Msg
navBar nb =
    div [ class navBarInnerStyle ] (renderNavItems nb)


renderNavItems : List NavItem -> List (Html Msg)
renderNavItems navItems =
    navItems
        |> List.map (\n -> div [] [ navItem n ])


navItem : NavItem -> Html Msg
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



-- logo


type alias Logo =
    { src : String
    , lbl : String
    , attrs : List (Attribute Msg)
    }


logo : Logo -> Html.Html Msg
logo l =
    img
        (l.attrs
            ++ [ src l.src
               , alt l.lbl
               , class logoStyle
               ]
        )
        []


logoStyle : String
logoStyle =
    [ Dtw.inline_block, Dtw.custom_height_px 64 ]
        |> classList
