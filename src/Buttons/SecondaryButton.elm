module Buttons.SecondaryButton exposing (..)

import Browser
import Buttons.Shared exposing (Size(..), baseButton, renderBtnSize)
import Css
import Css.Global
import Html.Styled as HtmlStyled
import Html.Styled.Attributes as Attr
import Tailwind.Utilities as Tw
import VirtualDom


secondaryButtonStyle : List Css.Style
secondaryButtonStyle =
    [ Tw.text_indigo_700
    , Tw.bg_indigo_100
    , Tw.border_transparent
    , Css.hover
        [ Tw.bg_indigo_200 ]
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
    ( Normal, "Secondary Button" )


init : () -> ( ( Size, String ), Cmd msg )
init _ =
    ( initialModel, Cmd.none )


view : ( Size, String ) -> VirtualDom.Node msg
view ( size, text ) =
    HtmlStyled.toUnstyled <|
        HtmlStyled.button
            [ Attr.type_ "button"
            , Attr.css (renderBtnSize size ++ secondaryButtonStyle)
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
