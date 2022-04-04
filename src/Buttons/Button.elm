module Buttons.Button exposing (..)

import Buttons.BasicButtons.BasicButton exposing (Variant(..), basicButton)
import Buttons.CircularButton as CircularButton exposing (CircularButtonSize)
import Buttons.BasicButtons.BasicButton exposing (BasicButtonSize)
import Buttons.DividerButton as DividerButton
import Buttons.LeadingIconButton as LeadingIconButton exposing (LeadingSize(..))
import Buttons.TrailingIconButton as TrailingIconButton exposing (TrailingSize(..))
import Icon
import Html exposing (Html, Attribute)

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
circular : ( CircularButtonSize, Icon.Icon ) -> Html msg
circular (size, icon) =
    CircularButton.view({size = size, icon = icon})

-- convenience function: returns a "LeadingIcon" button
leadingIcon : (LeadingSize, String, Icon.Icon) -> Html msg
leadingIcon (size, text, icon) =
    LeadingIconButton.view ({size = size, text = text, icon = icon})

-- convenience function: returns a "TrailingIcon" button
trailingIcon: (TrailingSize, String, Icon.Icon) -> Html msg
trailingIcon (size, text, icon) =
    TrailingIconButton.view ({size = size, text = text, icon = icon})

-- convenience function: returns a "Divider" button
divider: List (Attribute msg) -> String -> Icon.Icon -> Html msg
divider attr text icon =
    DividerButton.view ({attr = attr, text = text, icon = icon})