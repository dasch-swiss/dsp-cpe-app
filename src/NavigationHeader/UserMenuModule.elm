module NavigationHeader.UserMenuModule exposing (..)

import Avatars.Avatar exposing (circular)
import Avatars.CircularAvatar exposing (CircularAvatarSize(..))
import CustomCss.DaschTailwind as Dtw exposing (classList)
import Html exposing (Html, a, div, text)
import Html.Attributes exposing (class, href, id)
import NavigationHeader.HeaderButtons exposing (signInButton, signUpButton)


type alias User =
    { uId : String
    , uImg : String
    }


userMenu : Maybe User -> Html msg
userMenu user =
    case user of
        Nothing ->
            signedOutButtons

        Just u ->
            userBar u


userBar : User -> Html msg
userBar user =
    div [ id "user-cntr", class Dtw.flex ]
        [ userAvatar user
        , div [] (signedInButtons user)
        ]


userAvatar : User -> Html msg
userAvatar user =
    div []
        [ circular CircularAvatarNormal user.uImg "UserAvatar" []
        , div [ class userDropDownStyle ] (userDropDown user)
        ]


userDropDown : User -> List (Html msg)
userDropDown user =
    [ a [ href "" ] [ text "Your Profile" ]
    , a [ href "" ] [ text "log out" ]
    ]



-- "origin-top-right absolute right-0 mt-2 w-48 rounded-md shadow-lg py-1 bg-white ring-1 ring-black ring-opacity-5 focus:outline-none" role="menu" aria-orientation="vertical" aria-labelledby="user-menu-button" tabindex="-1">


signedInButtons : User -> List (Html msg)
signedInButtons user =
    [ signInButton [] "sign out" ]


signedOutButtons : Html msg
signedOutButtons =
    div []
        [ signUpButton [] "sign up"
        , signInButton [] "sign in"
        ]



-- Styles
--            <div class="origin-top-right absolute right-0 mt-2 w-48 rounded-md shadow-lg py-1 bg-white ring-1 ring-black ring-opacity-5 focus:outline-none" role="menu" aria-orientation="vertical" aria-labelledby="user-menu-button" tabindex="-1">


userDropDownStyle : String
userDropDownStyle =
    [ Dtw.hidden ]
        |> classList
