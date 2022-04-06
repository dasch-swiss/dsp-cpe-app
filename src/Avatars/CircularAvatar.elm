module Avatars.CircularAvatar exposing (..)

import CustomCss.DaschTailwind as Dtw
import Html exposing (Attribute, Html, img)
import Html.Attributes exposing (alt, class, src)


type alias Model msg =
    { size : CircularAvatarSize
    , img : String
    , alt : String
    , attrs : List (Attribute msg)
    }


type CircularAvatarSize
    = CircularAvatarExtraSmall
    | CircularAvatarSmall
    | CircularAvatarNormal
    | CircularAvatarLarge
    | CircularAvatarExtraLarge


getAvatarSize : CircularAvatarSize -> String
getAvatarSize size =
    case size of
        CircularAvatarExtraSmall ->
            Dtw.classList
                [ Dtw.h_6
                , Dtw.w_6
                ]

        CircularAvatarSmall ->
            Dtw.classList
                [ Dtw.h_8
                , Dtw.w_8
                ]

        CircularAvatarNormal ->
            Dtw.classList
                [ Dtw.h_10
                , Dtw.w_10
                ]

        CircularAvatarLarge ->
            Dtw.classList
                [ Dtw.h_12
                , Dtw.w_12
                ]

        CircularAvatarExtraLarge ->
            Dtw.classList
                [ Dtw.h_14
                , Dtw.w_14
                ]


view : Model msg -> Html msg
view model =
    img
        [ class (getAvatarSize model.size)
        , class Dtw.rounded_full
        , alt model.alt
        , src model.img
        ]
        []
