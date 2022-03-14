module Avatars.CircularAvatar exposing (..)

import Browser
import Css
import Css.Global
import Html.Styled as HtmlStyled
import Html.Styled.Attributes as Attr
import Tailwind.Utilities as Tw
import VirtualDom

main : Program () Model msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


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


renderSize : CircularAvatarSize -> List Css.Style
renderSize size =
            case size of
                CircularAvatarExtraSmall ->
                    [ Tw.h_6
                    , Tw.w_6
                    ]

                CircularAvatarSmall ->
                    [ Tw.h_8
                    , Tw.w_8
                    ]

                CircularAvatarNormal ->
                    [ Tw.h_10
                    , Tw.w_10
                    ]

                CircularAvatarLarge ->
                    [ Tw.h_12
                    , Tw.w_12
                    ]

                CircularAvatarExtraLarge ->
                    [ Tw.h_14
                    , Tw.w_14
                    ]

view : Model -> VirtualDom.Node msg
view model =
    HtmlStyled.toUnstyled <|
        HtmlStyled.img
            [  Attr.css (renderSize model.size ++ [Tw.rounded_full])
            ,  Attr.alt (model.alt)
            , Attr.src (model.img)
            ]
            [ Css.Global.global Tw.globalStyles
            ]


update : msg -> Model -> ( Model, Cmd msg )
update _ model =
    ( model, Cmd.none )


subscriptions : Model -> Sub msg
subscriptions _ =
    Sub.none
