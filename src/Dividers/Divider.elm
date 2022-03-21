module Dividers.Divider exposing (..)
import Icon
import Dividers.IconButtonDivider as IconButtonDivider
import Html exposing (Html)
import Html.Styled exposing (Attribute)
iconButtonDivider: List (Attribute msg) -> Icon.Icon -> String -> Html msg
iconButtonDivider attr icon text =
    IconButtonDivider.view({buttonAttrs = attr, icon = icon, text = text})