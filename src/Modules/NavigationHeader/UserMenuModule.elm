module Modules.NavigationHeader.UserMenuModule exposing (..)

import Html exposing (Html, div)
import Html.Attributes exposing (class, id)
import Modules.Avatars.CircularAvatar as CircularAvatar
import Modules.NavigationHeader.HeaderButtons exposing (signInButton, signUpButton)
import Shared.SharedTypes exposing (CircularAvatarSize(..))
import Util.CustomCss.DaschTailwind as Dtw exposing (classList)


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
        -- Don't use Api to prevent circularity
        [ CircularAvatar.view { size = CircularAvatarNormal, img = user.uImg, alt = "UserAvatar", attrs = [] } ]


signedInButtons : User -> List (Html msg)
signedInButtons user =
    [ signInButton [] "sign out" ]


signedOutButtons : Html msg
signedOutButtons =
    div []
        [ signUpButton [] "sign up"
        , signInButton [] "sign in"
        ]


userDropDownStyle : String
userDropDownStyle =
    [ Dtw.hidden ]
        |> classList
