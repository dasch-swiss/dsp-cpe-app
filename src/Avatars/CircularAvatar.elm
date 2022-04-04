module Avatars.CircularAvatar exposing (..)

import CustomCss.DaschTailwind as Dtw
import Html exposing (Html, img)
import Html.Attributes exposing (alt, class, src)
import String

type alias Model =
    { size: CircularAvatarSize
    , img: String
    , alt: String
    }

initialModel : Model
initialModel = {size=CircularAvatarNormal, img="", alt=""}


init : () -> ( Model, Cmd msg )
init _ =
    ( initialModel, Cmd.none )


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
                    String.join " "
                        [ Dtw.h_6
                        , Dtw.w_6
                        ]

                CircularAvatarSmall ->
                    String.join " "
                        [ Dtw.h_8
                        , Dtw.w_8
                        ]

                CircularAvatarNormal ->
                    String.join " "
                        [ Dtw.h_10
                        , Dtw.w_10
                        ]

                CircularAvatarLarge ->
                    String.join " "
                        [ Dtw.h_12
                        , Dtw.w_12
                        ]

                CircularAvatarExtraLarge ->
                    String.join " "
                        [ Dtw.h_14
                        , Dtw.w_14
                        ]

view : Model -> Html msg
view model =
    img
        [ class (getAvatarSize model.size)
        , class Dtw.rounded_full
        , alt (model.alt)
        , src (model.img)
        ]
        []


update : msg -> Model -> ( Model, Cmd msg )
update _ model =
    ( model, Cmd.none )
