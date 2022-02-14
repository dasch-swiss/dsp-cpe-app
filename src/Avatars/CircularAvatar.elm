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
    { size: Size
    , img: String
    , alt: String
    }

initialModel : Model
initialModel = {size=Normal, img="", alt=""}


init : () -> ( Model, Cmd msg )
init _ =
    ( initialModel, Cmd.none )


type Size
    = ExtraSmall
    | Small
    | Normal
    | Large
    | ExtraLarge


renderSize : Size -> List Css.Style
renderSize size =
            case size of
                ExtraSmall ->
                    [ Tw.h_6
                    , Tw.w_6
                    ]

                Small ->
                    [ Tw.h_8
                    , Tw.w_8
                    ]

                Normal ->
                    [ Tw.h_10
                    , Tw.w_10
                    ]

                Large ->
                    [ Tw.h_12
                    , Tw.w_12
                    ]

                ExtraLarge ->
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
