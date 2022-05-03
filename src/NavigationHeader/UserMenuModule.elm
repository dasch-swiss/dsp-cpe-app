module NavigationHeader.UserMenuModule exposing (..)

import Avatars.Avatar exposing (circular)
import Avatars.CircularAvatar exposing (CircularAvatarSize(..))
import CustomCss.DaschTailwind as Dtw exposing (classList)
import Html exposing (Html, div)
import Html.Attributes exposing (class, id)
import Html.Events exposing (onClick)
import NavigationHeader.HeaderButtons exposing (signInButton, signUpButton)
import NavigationHeader.Model exposing (Msg(..))


type alias User =
    { uId : String
    , uImg : String
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
        [ circular CircularAvatarNormal user.uImg "UserAvatar" []
        ]



--signedInButtons : NavigationHeader.Model.User -> List (Html (LogInOutMsg user))


signedInButton : Html Msg
signedInButton =
    signInButton [ onClick LogOutMsg ] "sign out"



--signedOutButtons : Maybe User -> Html msg


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
