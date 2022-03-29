module Dividers.IconButtonDivider exposing (..)

import Buttons.Button exposing (dividerButton)
import Buttons.LeadingIconButton exposing (LeadingSize(..))
import Html exposing (Html)
import Html.Styled as HtmlStyled exposing (Attribute)
import Html.Styled.Attributes as Attr
import Icon
import Tailwind.Utilities as Tw


type alias Model msg =
    { buttonAttrs : List (Attribute msg)
    , icon : Icon.Icon
    , text : String
    }


view : Model msg -> Html msg
view model =
    HtmlStyled.toUnstyled <|
        HtmlStyled.div
            [ Attr.css [ Tw.relative ]
            ]
            [ HtmlStyled.div
                [ Attr.css [ Tw.absolute, Tw.inset_0, Tw.flex, Tw.items_center ] ]
                [ HtmlStyled.div [ Attr.css [ Tw.w_full, Tw.border_t, Tw.border_gray_300 ] ] [] ]
            , HtmlStyled.div [ Attr.css [ Tw.relative, Tw.flex, Tw.justify_center ] ]
                [ dividerButton model.buttonAttrs model.text model.icon ]
            ]
