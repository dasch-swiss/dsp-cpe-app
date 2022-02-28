module Buttons.Button exposing (..)

import Buttons.CircularButton as CircularButton
import Buttons.LeadingIconButton as LeadingIconButton
import Buttons.TrailingIconButton as TrailingIconButton
import Buttons.Shared exposing (ButtonSize(..))
import Html exposing (Html)
import VirtualDom exposing (Node)
import Html.Styled exposing (Attribute)
import Buttons.BasicButtons.BasicButton exposing (basicButton, Variant(..))

-- convenience function: returns a basicButton with the Variant "Primary"
primaryButton : List (Attribute msg) -> String -> ButtonSize -> Node msg
primaryButton attrs txt size =
    basicButton attrs txt size Primary

-- convenience function: returns a basicButton with the Variant "Secondary"
secondaryButton : List (Attribute msg) -> String -> ButtonSize -> Node msg
secondaryButton attrs txt size =
    basicButton attrs txt size Secondary


-- convenience function: returns a basicButton with the Variant "White"
whiteButton : List (Attribute msg) -> String -> ButtonSize -> Node msg
whiteButton attrs txt size =
    basicButton attrs txt size White


circular : ( ButtonSize, Html msg ) -> Html msg
circular ( size, icon ) =
    CircularButton.view ( size, icon )

leadingIcon : (LeadingIconButton.Size, String, LeadingIconButton.Icon) -> Html msg
leadingIcon (size, text, icon) =
    LeadingIconButton.view ({size = size, text = text, icon = icon})

trailingIcon: (TrailingIconButton.Size, String, TrailingIconButton.Icon) -> Html msg
trailingIcon (size, text, icon) =
    TrailingIconButton.view ({size = size, text = text, icon = icon})