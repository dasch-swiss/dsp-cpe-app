module Buttons.WhiteButton exposing (..)

import Browser
import Buttons.Shared exposing (Size(..), baseButton, renderBtnSize)
import Css
import Css.Global
import Html.Styled as HtmlStyled
import Html.Styled.Attributes as Attr
import Tailwind.Utilities as Tw
import VirtualDom


whiteButtonStyle : List Css.Style
whiteButtonStyle =
    [ Tw.text_gray_700
    , Tw.bg_white
    , Tw.border_gray_300
    , Css.hover
        [ Tw.bg_gray_50 ]
    ]
        ++ baseButton


main : Program () ( Size, String ) msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


initialModel : ( Size, String )
initialModel =
    ( Normal, "White Button" )


init : () -> ( ( Size, String ), Cmd msg )
init _ =
    ( initialModel, Cmd.none )


view : ( Size, String ) -> VirtualDom.Node msg
view ( size, text ) =
    HtmlStyled.toUnstyled <|
        HtmlStyled.button
            [ Attr.type_ "button"
            , Attr.css (renderBtnSize size ++ whiteButtonStyle)
            ]
            [ HtmlStyled.text text
            , Css.Global.global Tw.globalStyles
            ]


update : msg -> ( Size, String ) -> ( ( Size, String ), Cmd msg )
update _ ( size, text ) =
    ( ( size, text ), Cmd.none )


subscriptions : ( Size, String ) -> Sub msg
subscriptions _ =
    Sub.none