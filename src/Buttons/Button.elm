module Buttons.Button exposing (..)

import Buttons.CircularButton as CircularButton
import Buttons.PrimaryButton as PrimaryButton
import Buttons.SecondaryButton as SecondaryButton
import Buttons.LeadingIconButton as LeadingIconButton
import Buttons.Shared exposing (Size(..))
import Buttons.WhiteButton as WhiteButton
import Html exposing (Html)


primary : ( Size, String ) -> Html msg
primary ( size, text ) =
    PrimaryButton.view ( size, text )


secondary : ( Size, String ) -> Html msg
secondary ( size, text ) =
    SecondaryButton.view ( size, text )


white : ( Size, String ) -> Html msg
white ( size, text ) =
    WhiteButton.view ( size, text )


circular : ( Size, Html msg ) -> Html msg
circular ( size, icon ) =
    CircularButton.view ( size, icon )

leadingIcon : (LeadingIconButton.Size, String, LeadingIconButton.Icon) -> Html msg
leadingIcon (size, text, icon) =
    LeadingIconButton.view ({size = size, text = text, icon = icon})
