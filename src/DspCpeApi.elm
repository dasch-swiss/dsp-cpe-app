module DspCpeApi exposing (..)

import Html exposing (Attribute, Html)
import Modules.Avatars.CircularAvatar as CircularAvatar
import Modules.Buttons.BackButton as BackButton
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


circularAvatar : { size : CircularAvatarSize, img : String, alt : String, attrs : List (Attribute msg) } -> Html msg
circularAvatar args =
    CircularAvatar.view { size = args.size, img = args.img, alt = args.alt, attrs = args.attrs }



-- convenience function: returns a basicButton with the Variant "Primary"


primaryButton : { attrs : List (Attribute msg), text : String, size : BasicButtonSize } -> Html msg
primaryButton args =
    basicButton args.attrs args.text args.size Primary



-- convenience function: returns a basicButton with the Variant "Secondary"


secondaryButton : { attrs : List (Attribute msg), text : String, size : BasicButtonSize } -> Html msg
secondaryButton args =
    basicButton args.attrs args.text args.size Secondary



-- convenience function: returns a basicButton with the Variant "White"


whiteButton : { attrs : List (Attribute msg), text : String, size : BasicButtonSize } -> Html msg
whiteButton args =
    basicButton args.attrs args.text args.size White



-- convenience function: returns a "Circular" button


circularButton : { size : CircularButtonSize, icon : Icon.Icon, attrs : List (Attribute msg) } -> Html msg
circularButton args =
    CircularButton.view { size = args.size, icon = args.icon, attrs = args.attrs }



-- convenience function: returns a "LeadingIcon" button


leadingIconButton : { size : LeadingSize, text : String, icon : Icon.Icon, attrs : List (Attribute msg) } -> Html msg
leadingIconButton args =
    LeadingIconButton.view { size = args.size, text = args.text, icon = args.icon, attrs = args.attrs }



-- convenience function: returns a "TrailingIcon" button


trailingIconButton : { size : TrailingSize, text : String, icon : Icon.Icon, attrs : List (Attribute msg) } -> Html msg
trailingIconButton args =
    TrailingIconButton.view { size = args.size, text = args.text, icon = args.icon, attrs = args.attrs }


iconButtonDivider : List (Attribute msg) -> Icon.Icon -> String -> Html msg
iconButtonDivider attr icon text =
    IconButtonDivider.view { buttonAttrs = attr, icon = icon, text = text }


header : { logo : Header.Logo, navBar : List Header.NavItem, showSearchBar : Bool, user : Maybe Header.User, showMobileMenu : Bool } -> Html Header.Msg
header args =
    Header.view { logo = args.logo, navBar = args.navBar, showSearchBar = args.showSearchBar, user = args.user, showMobileMenu = args.showMobileMenu }


projectDescription : { isOpen : Bool, text : String, title : String, subtitle : String } -> Html.Html ProjectDescription.Msg
projectDescription args =
    ProjectDescription.view { isOpen = args.isOpen, text = args.text, title = args.title, subtitle = args.subtitle }


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


back : Html.Html BackButton.Msg
back =
    BackButton.view
