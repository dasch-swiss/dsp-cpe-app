module Modules.NavigationHeader.NavigationHeader exposing (HeaderModel, Logo, Msg(..), NavItem, User, update, view)

import Html exposing (Attribute, Html, a, button, div, img, input, nav, span, text)
import Html.Attributes exposing (alt, class, href, id, placeholder, src, type_)
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
    div [ id "nav-header-bg-cntr", class navHeaderBgCntrStyle ]
        [ div [ id "standard-view-cntr", class navHeaderCntrStyle ]
            [ div [ id "header-elements-cntr", class headerElementsCntrStyle ]
                [ div [ id "header-left-elements-cntr", class leftSideElementsStyle ]
                    [ div [ id "navbar-logo-cntr", class navBarLogoCntrStyle ]
                        [ logo header.logo
                        ]
                    , div [ id "mobile-menu-cntr", class (mobileMenuButtonCntrStyle header.showSearchBar) ]
                        [ mobileMenuButton
                        ]
                    , div [ id "navbar-nav-cntr", class (navBarCntrStyle header.showSearchBar) ] [ navBar header.navBar ]
                    ]
                ]
            , div [ id "header-right-elements-cntr", class rightSideElementsStyle ]
                [ div [ id "searchbar-cntr", class searchBarCntrStyle ]
                    [ div [ id "search-view-cntr", class (searchViewCntrStyle header.showSearchBar) ] [ searchBar ]
                    , div [ class (display (not header.showSearchBar)) ]
                        [ CircularButton.view { size = CircularNormal, icon = Search, attrs = [ onClick ToggleSearchBarMsg ] }
                        ]
                    ]
                , userMenu header.user
                ]
            , mobileMenu header.navBar header.showMobileMenu
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
    [ Dtw.justify_between
    , Dtw.flex
    ]
        |> classList


headerElementsCntrStyle : String
headerElementsCntrStyle =
    [ Dtw.flex
    , Dtw.justify_between
    , Dtw.h_16
    , Dtw.items_center
    , Dtw.gap_x_6
    ]
        |> classList


leftSideElementsStyle : String
leftSideElementsStyle =
    [ Dtw.flex
    , Dtw.items_center
    , Dtw.justify_start
    ]
        |> classList


navBarLogoCntrStyle : String
navBarLogoCntrStyle =
    [ Dtw.items_center
    , Dtw.flex_shrink_0
    ]
        |> classList


navBarCntrStyle : Bool -> String
navBarCntrStyle showSearchBar =
    if showSearchBar then
        [ Dtw.hidden ]
            |> classList

    else
        [ Dtw.hidden -- hidden if smaller than md
        , Dtw.md [ Dtw.ml_6, Dtw.flex ]
        , Dtw.self_center
        , Dtw.flex_shrink_0
        ]
            |> classList


searchBarCntrStyle : String
searchBarCntrStyle =
    [ Dtw.flex, Dtw.justify_end, Dtw.grow, Dtw.items_center, Dtw.gap_x_4 ]
        |> classList


searchViewCntrStyle : Bool -> String
searchViewCntrStyle showSb =
    if showSb then
        [ Dtw.flex_1
        , Dtw.flex
        , Dtw.grow
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
        nav [ id "mobile-menu", class mobileMenuStyle ] (mobileMenuEntries navItems)

    else
        nav [ id "mobile-menu", class Dtw.hidden ] []


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
        |> List.map (\n -> div [] [ a [ href n.href ] [ text n.text ] ])


display : Bool -> String
display show =
    if show then
        Dtw.block

    else
        Dtw.hidden


mobileMenuButtonCntrStyle : Bool -> String
mobileMenuButtonCntrStyle displayMenu =
    if displayMenu then
        [ Dtw.neg_ml_2
        , Dtw.mr_2
        , Dtw.flex
        , Dtw.items_center
        ]
            |> classList

    else
        [ Dtw.neg_ml_2
        , Dtw.mr_2
        , Dtw.flex
        , Dtw.items_center
        , Dtw.md
            -- displayed except screen size reaches md
            [ Dtw.hidden
            ]
        ]
            |> classList


rightSideElementsStyle : String
rightSideElementsStyle =
    [ Dtw.flex
    , Dtw.flex_shrink_0
    , Dtw.grow
    , Dtw.gap_x_4
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
    div [ id "user-cntr", class userBarStyle ]
        [ div [] [ CircularAvatar.view { size = CircularAvatarNormal, img = user.img, alt = "UserAvatar", attrs = [] } ]
        , div [] [ signedInButton ]
        ]


userBarStyle : String
userBarStyle =
    [ Dtw.flex
    , Dtw.flex_shrink_0
    , Dtw.items_center
    , Dtw.gap_x_4
    ]
        |> classList


signedInButton : Html Msg
signedInButton =
    signInButton [ onClick LogOutMsg ] "sign out"


signedOutButtons : Html Msg
signedOutButtons =
    div [ id "signed-out-cntr", class signedOutStyle ]
        [ signUpButton [ onClick SignUpRequestMsg ] "sign up"
        , signInButton [ onClick SignInRequestMsg ] "sign in"
        ]


signedOutStyle : String
signedOutStyle =
    [ Dtw.flex
    , Dtw.gap_x_4
    , Dtw.items_center
    ]
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
    nav [ class navBarInnerStyle ] (renderNavItems nb)


renderNavItems : List NavItem -> List (Html Msg)
renderNavItems navItems =
    navItems
        |> List.map (\n -> div [] [ navItem n ])


navItem : NavItem -> Html Msg
navItem n =
    a
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
    [ Dtw.hidden -- hidden if smaller than md
    , Dtw.md [ Dtw.ml_6, Dtw.flex, Dtw.space_x_4 ]
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


searchBar : Html Msg
searchBar =
    div [ id "outer-search-ct", class outerSearchCtStyle ]
        [ CircularButton.view { size = CircularNormal, icon = ChevronRight, attrs = [ onClick ToggleSearchBarMsg ] }
        , div [ class Dtw.w_full ]
            [ div [ class Dtw.relative ]
                [ div
                    [ class Dtw.absolute, class Dtw.inset_y_0, class Dtw.left_0, class Dtw.flex, class Dtw.items_center ]
                    [ div
                        [ id "search-icon", class searchIconStyle ]
                        [ Icon.getHtml Search ]
                    ]
                , input [ type_ "Text", placeholder "Search", class searchBarStyle ] []
                ]
            ]
        ]


outerSearchCtStyle : String
outerSearchCtStyle =
    [ Dtw.flex
    , Dtw.grow
    , Dtw.justify_end
    , Dtw.gap_x_4
    , Dtw.items_center
    ]
        |> classList


searchBarStyle : String
searchBarStyle =
    [ Dtw.block
    , Dtw.grow
    , Dtw.w_full
    , Dtw.max_w_lg
    , Dtw.pl_10
    , Dtw.pr_3
    , Dtw.py_2
    , Dtw.border
    , Dtw.leading_5
    , Dtw.text_blue_700
    , Dtw.placeholder_blue_700
    , Dtw.outline_none
    , Dtw.onFocus [ Dtw.outline_none, Dtw.ring_white, Dtw.text_blue_700 ]
    , Dtw.custom_bg White
    ]
        |> classList


searchIconStyle : String
searchIconStyle =
    [ Dtw.flex, Dtw.items_center, Dtw.pointer_events_none, Dtw.h_5, Dtw.w_5, Dtw.text_blue_700, Dtw.m_4 ]
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
    [ Dtw.inline_block, Dtw.max_h_14, Dtw.m_2 ]
        |> classList
