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
import Shared.SharedTypes exposing (AccordionSize(..), BasicButtonSize(..), CircularAvatarSize(..), CircularButtonSize(..), LeadingSize(..), TrailingSize(..))
import Util.Icon as Icon
import Shared.SharedTypes exposing (ModuleInstanceId)


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


iconButtonDivider : { attrs : List (Attribute msg), icon : Icon.Icon, text : String } -> Html msg
iconButtonDivider args =
    IconButtonDivider.view { buttonAttrs = args.attrs, icon = args.icon, text = args.text }


header : { logo : Header.Logo, navBar : List Header.NavItem, showSearchBar : Bool, user : Maybe Header.User, showMobileMenu : Bool, fixedPosition : Bool } -> Html Header.Msg
header args =
    Header.view { logo = args.logo, navBar = args.navBar, showSearchBar = args.showSearchBar, user = args.user, showMobileMenu = args.showMobileMenu, fixedPosition = args.fixedPosition }


projectDescription : { isOpen : Bool, text : String, title : String, subtitle : String, id: ModuleInstanceId } -> Html.Html ProjectDescription.Msg
projectDescription args =
    ProjectDescription.view { isOpen = args.isOpen, text = args.text, title = args.title, subtitle = args.subtitle, id = args.id }


accordion : { isOpen : Bool, text : String, size : AccordionSize, id : ModuleInstanceId } -> Html.Html Accordion.Msg
accordion args =
    Accordion.view { isOpen = args.isOpen, text = args.text, size = args.size, id = args.id }


imageTileGrid : List ImageTile.Model -> Html.Html msg
imageTileGrid tiles =
    ImageTileGrid.view { tiles = tiles }


footer : { copyrightText : String, contactUsText : String, contactUsUrl : String, licensingFilePath : String } -> Html.Html msg
footer args =
    Footer.view { copyrightText = args.copyrightText, contactUsText = args.contactUsText, contactUsUrl = args.contactUsUrl, licensingFilePath = args.licensingFilePath }


focus : Focus.Model -> Html.Html Focus.Msg
focus model =
    Focus.view model


back : Html.Html BackButton.Msg
back =
    BackButton.view
