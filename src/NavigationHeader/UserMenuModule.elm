module NavigationHeader.UserMenuModule exposing (..)

import Avatars.Avatar exposing (circular)
import Avatars.CircularAvatar exposing (CircularAvatarSize(..))
import CustomCss.DaschTailwind as Dtw exposing (classList)
import Html exposing (Html, div)
import Html.Attributes exposing (class, id)
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
        ]


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
