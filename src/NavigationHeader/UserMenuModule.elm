module NavigationHeader.UserMenuModule exposing (..)

import Avatars.Avatar exposing (circular)
import Avatars.CircularAvatar exposing (CircularAvatarSize(..))
import CustomCss.DaschTailwind as Dtw exposing (dtwClass)
import Html exposing (Html, a, div, text)
import Html.Attributes exposing (href, id)
import NavigationHeader.HeaderButtons exposing (signInButton, signUpButton)


type alias User =
    { uId : String
    , uImg : String
    }


userMenu : User -> Html msg
userMenu user =
    div [ id "user-cntr", dtwClass [ Dtw.flex ] ]
        [ userAvatar user
        , div [] (userButtons True)
        ]


userAvatar : User -> Html msg
userAvatar user =
    div []
        [ circular CircularAvatarNormal user.uImg "UserAvatar" []
        , div [ userDropDownStyle ] (userDropDown user.uId)
        ]


userDropDown : String -> List (Html msg)
userDropDown userId =
    [ a [ href "" ] [ text "Your Profile" ]
    , a [ href "" ] [ text "log out" ]
    ]



-- "origin-top-right absolute right-0 mt-2 w-48 rounded-md shadow-lg py-1 bg-white ring-1 ring-black ring-opacity-5 focus:outline-none" role="menu" aria-orientation="vertical" aria-labelledby="user-menu-button" tabindex="-1">


userButtons : Bool -> List (Html msg)
userButtons signedIn =
    if signedIn then
        [ signInButton [] "sign out"
        ]

    else
        [ signUpButton [] "sign up"
        , signInButton [] "sign in"
        ]



-- Styles
--            <div class="origin-top-right absolute right-0 mt-2 w-48 rounded-md shadow-lg py-1 bg-white ring-1 ring-black ring-opacity-5 focus:outline-none" role="menu" aria-orientation="vertical" aria-labelledby="user-menu-button" tabindex="-1">


userDropDownStyle : Html.Attribute msg
userDropDownStyle =
    [ Dtw.hidden ]
        |> dtwClass
