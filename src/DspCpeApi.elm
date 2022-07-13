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
import RemoteData
import Shared.SharedTypes exposing (AccordionSize(..), BasicButtonSize(..), CircularAvatarSize(..), CircularButtonSize(..), LeadingSize(..), TrailingSize(..), WidgetInstanceId(..))
import Util.Icon as Icon


circularAvatar : { attrs : List (Attribute msg), size : CircularAvatarSize, img : String, alt : String } -> Html msg
circularAvatar args =
    CircularAvatar.view { attrs = args.attrs, size = args.size, img = args.img, alt = args.alt }



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


circularButton : { attrs : List (Attribute msg), size : CircularButtonSize, icon : Icon.Icon } -> Html msg
circularButton args =
    CircularButton.view { attrs = args.attrs, size = args.size, icon = args.icon }



-- convenience function: returns a "LeadingIcon" button


leadingIconButton : { attrs : List (Attribute msg), text : String, size : LeadingSize, icon : Icon.Icon } -> Html msg
leadingIconButton args =
    LeadingIconButton.view { attrs = args.attrs, text = args.text, size = args.size, icon = args.icon }



-- convenience function: returns a "TrailingIcon" button


trailingIconButton : { attrs : List (Attribute msg), text : String, size : TrailingSize, icon : Icon.Icon } -> Html msg
trailingIconButton args =
    TrailingIconButton.view { attrs = args.attrs, text = args.text, size = args.size, icon = args.icon }


iconButtonDivider : { attrs : List (Attribute msg), text : String, icon : Icon.Icon } -> Html msg
iconButtonDivider args =
    IconButtonDivider.view { buttonAttrs = args.attrs, text = args.text, icon = args.icon }


header : { logo : Header.Logo, navBar : List Header.NavItem, showSearchBar : Bool, user : Maybe Header.User, showMobileMenu : Bool } -> Html Header.Msg
header args =
    Header.view { logo = args.logo, navBar = args.navBar, showSearchBar = args.showSearchBar, user = args.user, showMobileMenu = args.showMobileMenu }


projectDescription : { isOpen : Bool, id : WidgetInstanceId } -> Html.Html ProjectDescription.Msg
projectDescription args =
    ProjectDescription.view { isOpen = args.isOpen, data = RemoteData.NotAsked, id = args.id }


newProjectDescription : WidgetInstanceId -> ( ProjectDescription.Model, Cmd ProjectDescription.Msg )
newProjectDescription wid =
    ProjectDescription.init wid


accordion : { isOpen : Bool, id : WidgetInstanceId } -> Html.Html Accordion.Msg
accordion args =
    Accordion.view { isOpen = args.isOpen, data = RemoteData.NotAsked, id = args.id }


newAccordion : WidgetInstanceId -> ( Accordion.Model, Cmd Accordion.Msg )
newAccordion wid =
    Accordion.init wid


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
