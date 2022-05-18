module DspCpeApi exposing (..)

import Html exposing (Attribute, Html)
import Modules.Avatars.CircularAvatar as CircularAvatar
import Modules.Buttons.BasicButtons.BasicButton exposing (Variant(..), basicButton)
import Modules.Buttons.CircularButton as CircularButton
import Modules.Buttons.LeadingIconButton as LeadingIconButton
import Modules.Buttons.TrailingIconButton as TrailingIconButton
import Modules.Dividers.IconButtonDivider as IconButtonDivider
import Modules.Footer.Footer as Footer
import Modules.NavigationHeader.NavigationHeader as Header
import Modules.Projects.Focus.Focus as Focus
import Modules.Text.Accordion as Accordion
import Modules.Text.ProjectDescription as ProjectDescription
import Modules.Tiles.ImageTile as ImageTile
import Modules.Tiles.ImageTileGrid as ImageTileGrid
import Shared.SharedTypes exposing (BasicButtonSize(..), CircularAvatarSize(..), CircularButtonSize(..), LeadingSize(..), TrailingSize(..))
import Util.Icon as Icon


circularAvatar : CircularAvatarSize -> String -> String -> List (Attribute msg) -> Html msg
circularAvatar size img alt attrs =
    CircularAvatar.view { size = size, img = img, alt = alt, attrs = attrs }



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


leadingIconButton : LeadingSize -> String -> Icon.Icon -> List (Attribute msg) -> Html msg
leadingIconButton size text icon attrs =
    LeadingIconButton.view { size = size, text = text, icon = icon, attrs = attrs }



-- convenience function: returns a "TrailingIcon" button


trailingIconButton : TrailingSize -> String -> Icon.Icon -> List (Attribute msg) -> Html msg
trailingIconButton size text icon attrs =
    TrailingIconButton.view { size = size, text = text, icon = icon, attrs = attrs }


iconButtonDivider : List (Attribute msg) -> Icon.Icon -> String -> Html msg
iconButtonDivider attr icon text =
    IconButtonDivider.view { buttonAttrs = attr, icon = icon, text = text }


header : Header.Logo -> List Header.NavItem -> Maybe Header.User -> Bool -> Bool -> Html Header.Msg
header logo navBar user showSearchBar showMobileMenu =
    Header.view { logo = logo, navBar = navBar, user = user, showSearchBar = showSearchBar, showMobileMenu = showMobileMenu }


projectDescription : Bool -> String -> Html.Html ProjectDescription.Msg
projectDescription isOpen text =
    ProjectDescription.view { isOpen = isOpen, text = text }


accordion : Bool -> String -> Accordion.AccordionSize -> Html.Html Accordion.Msg
accordion isOpen text size =
    Accordion.view { isOpen = isOpen, text = text, size = size }


imageTileGrid : List ImageTile.Model -> Html.Html msg
imageTileGrid tiles =
    ImageTileGrid.view { tiles = tiles }


footer : String -> String -> String -> String -> Html.Html msg
footer copyrightText contactUsText contactUsUrl licensingFilePath =
    Footer.view { copyrightText = copyrightText, contactUsText = contactUsText, contactUsUrl = contactUsUrl, licensingFilePath = licensingFilePath }


focus : Focus.Model -> Html.Html Focus.Msg
focus model =
    Focus.view model
