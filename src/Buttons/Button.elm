module Buttons.Button exposing (..)

import Buttons.BasicButtons.BasicButton exposing (BasicButtonSize, Variant(..), basicButton)
import Buttons.CircularButton as CircularButton exposing (CircularButtonSize)
import Buttons.DividerButton as DividerButton
import Buttons.LeadingIconButton as LeadingIconButton exposing (LeadingSize(..))
import Buttons.TrailingIconButton as TrailingIconButton exposing (TrailingSize(..))
import Html exposing (Attribute, Html)
import Icon



-- convenience function: returns a basicButton with the Variant "Primary"


primaryButton : List (Attribute msg) -> String -> BasicButtonSize -> Html msg
primaryButton attrs txt size =
    basicButton attrs txt size Primary



-- convenience function: returns a basicButton with the Variant "Secondary"


secondaryButton : List (Attribute msg) -> String -> BasicButtonSize -> Html msg
secondaryButton attrs txt size =
    basicButton attrs txt size Secondary



-- convenience function: returns a basicButton with the Variant "White"


whiteButton : List (Attribute msg) -> String -> BasicButtonSize -> Html msg
whiteButton attrs txt size =
    basicButton attrs txt size White



-- convenience function: returns a "Circular" button


circularButton : CircularButtonSize -> Icon.Icon -> List (Attribute msg) -> Html msg
circularButton size icon attrs =
    CircularButton.view { size = size, icon = icon, attrs = attrs }



-- convenience function: returns a "LeadingIcon" button


leadingIcon : LeadingSize -> String -> Icon.Icon -> List (Attribute msg) -> Html msg
leadingIcon size text icon attrs =
    LeadingIconButton.view { size = size, text = text, icon = icon, attrs = attrs }



-- convenience function: returns a "TrailingIcon" button


trailingIcon : TrailingSize -> String -> Icon.Icon -> List (Attribute msg) -> Html msg
trailingIcon size text icon attrs =
    TrailingIconButton.view { size = size, text = text, icon = icon, attrs = attrs }



-- convenience function: returns a "Divider" button


divider : List (Attribute msg) -> String -> Icon.Icon -> Html msg
divider attr text icon =
    DividerButton.view { attr = attr, text = text, icon = icon }
