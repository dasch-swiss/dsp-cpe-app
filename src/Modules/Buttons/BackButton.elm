module Modules.Buttons.BackButton exposing (..)

import Browser.Navigation as Nav
import Html
import Html.Events exposing (onClick)
import Modules.Buttons.LeadingIconButton as LeadingIconButton
import Shared.SharedTypes as Types
import Util.Icon as Icon

type Msg
    = Clicked


view : Html.Html Msg
view =
    LeadingIconButton.view { size = Types.LeadingNormal, text = "Back", icon = Icon.ChevronLeft, attrs = [ onClick Clicked ] }


update : Msg -> Nav.Key -> Cmd msg
update msg key =
    case msg of
        Clicked ->
            Nav.back key 1
