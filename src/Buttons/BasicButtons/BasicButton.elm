module Buttons.BasicButtons.BasicButton exposing (..)

import Browser
import Buttons.BasicButtons.PrimaryButton exposing (primaryButtonStyle)
import Buttons.BasicButtons.SecondaryButton exposing (secondaryButtonStyle)
import Buttons.BasicButtons.WhiteButton exposing (whiteButtonStyle)
import Buttons.Shared exposing (ButtonSize(..), baseButton, renderBtnSize)
import Css
import Css.Global
import Html.Styled as HtmlStyled exposing (Attribute)
import Html.Styled.Attributes as Attr
import Tailwind.Utilities as Tw
import VirtualDom exposing (Node)


main : Program () (BasicButtonModel msg) msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


type alias BasicButtonModel msg =
    { attrs : List (Attribute msg) -- onClick disable and all other events as well as custom attributes
    , text : String
    , size : ButtonSize
    , variant : Variant
    }



-- convenience function: Constructs the Buttonmodel and passes it into view; returns the view


basicButton : List (Attribute msg) -> String -> ButtonSize -> Variant -> Node msg
basicButton attributes text size variant =
    view { attrs = attributes, text = text, size = size, variant = variant }


type Variant
    = Primary
    | Secondary
    | White


initialModel : BasicButtonModel msg
initialModel =
    { attrs = [], text = "", size = Normal, variant = Primary }


init : () -> ( BasicButtonModel msg, Cmd msg )
init _ =
    ( initialModel, Cmd.none )


getVariant : Variant -> List Css.Style
getVariant variant =
    case variant of
        Primary ->
            primaryButtonStyle

        Secondary ->
            secondaryButtonStyle

        White ->
            whiteButtonStyle


view : BasicButtonModel msg -> Node msg
view b =
    HtmlStyled.toUnstyled <|
        HtmlStyled.button
            (b.attrs
                ++ [ Attr.type_ "button"
                   , Attr.css (renderBtnSize b.size ++ getVariant b.variant ++ baseButton)
                   ]
            )
            [ HtmlStyled.text b.text
            , Css.Global.global Tw.globalStyles
            ]


update : a -> b -> ( b, Cmd msg )
update _ buttonModel =
    ( buttonModel, Cmd.none )


subscriptions : BasicButtonModel msg -> Sub msg
subscriptions _ =
    Sub.none
