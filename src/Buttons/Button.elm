module Buttons.Button exposing (..)

import Buttons.BasicButtons.BasicButton exposing (Variant(..), basicButton)
import Buttons.CircularButton as CircularButton
import Buttons.LeadingIconButton as LeadingIconButton
import Buttons.Shared exposing (ButtonSize(..))
import Buttons.TrailingIconButton as TrailingIconButton
import Icon
import Html exposing (Html)
import Html.Styled exposing (Attribute)
import VirtualDom exposing (Node)



-- convenience function: returns a basicButton with the Variant "Primary"


primaryButton : List (Attribute msg) -> String -> ButtonSize -> Node msg
primaryButton attrs txt size =
    basicButton attrs txt size Primary



circular : ( Size, Icon.Icon ) -> Html msg
-- convenience function: returns a basicButton with the Variant "Secondary"


secondaryButton : List (Attribute msg) -> String -> ButtonSize -> Node msg
secondaryButton attrs txt size =
    basicButton attrs txt size Secondary



-- convenience function: returns a basicButton with the Variant "White"


whiteButton : List (Attribute msg) -> String -> ButtonSize -> Node msg
whiteButton attrs txt size =
    basicButton attrs txt size White


leadingIcon : (LeadingIconButton.Size, String, Icon.Icon) -> Html msg
leadingIcon (size, text, icon) =
    LeadingIconButton.view ({size = size, text = text, icon = icon})

trailingIcon: (TrailingIconButton.Size, String, Icon.Icon) -> Html msg
trailingIcon (size, text, icon) =
    TrailingIconButton.view ({size = size, text = text, icon = icon})
