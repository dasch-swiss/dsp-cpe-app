module Dividers.Divider exposing (..)

import Dividers.IconButtonDivider as IconButtonDivider
import Html exposing (Html, Attribute)
import Icon


iconButtonDivider : List (Attribute msg) -> Icon.Icon -> String -> Html msg
iconButtonDivider attr icon text =
    IconButtonDivider.view { buttonAttrs = attr, icon = icon, text = text }
