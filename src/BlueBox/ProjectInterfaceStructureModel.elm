module BlueBox.ProjectInterfaceStructureModel exposing (..)

import Html exposing (Attribute)
import Modules.NavigationHeader.NavigationHeader exposing (Logo, NavItem, User)
import Modules.Projects.Focus.Focus as Focus
import Modules.Tiles.ImageTile as ImageTile
import Shared.SharedTypes exposing (AccordionSize, BasicButtonSize, CircularAvatarSize, CircularButtonSize, LeadingSize, ModuleInstanceId, TrailingSize)
import Util.Icon exposing (Icon)


type alias Model msg =
    { header : Header msg
    , body : Body msg
    , footer : Footer msg
    }


type alias Header msg =
    { circularAvatars : Maybe (List { size : CircularAvatarSize, img : String, alt : String, attrs : List (Attribute msg) })
    , primaryButtons : Maybe (List { attrs : List (Attribute msg), text : String, size : BasicButtonSize })
    , secondaryButtons : Maybe (List { attrs : List (Attribute msg), text : String, size : BasicButtonSize })
    , whiteButtons : Maybe (List { attrs : List (Attribute msg), text : String, size : BasicButtonSize })
    , circularButtons : Maybe (List { size : CircularButtonSize, icon : Icon, attrs : List (Attribute msg) })
    , leadingIconButtons : Maybe (List { size : LeadingSize, text : String, icon : Icon, attrs : List (Attribute msg) })
    , trailingIconButtons : Maybe (List { size : TrailingSize, text : String, icon : Icon, attrs : List (Attribute msg) })
    , header : Maybe { logo : Logo, navBar : List NavItem, showSearchBar : Bool, user : Maybe User, showMobileMenu : Bool, fixedPosition : Bool }
    }


type alias Body msg =
    { circularAvatars : Maybe (List { size : CircularAvatarSize, img : String, alt : String, attrs : List (Attribute msg) })
    , primaryButtons : Maybe (List { attrs : List (Attribute msg), text : String, size : BasicButtonSize })
    , secondaryButtons : Maybe (List { attrs : List (Attribute msg), text : String, size : BasicButtonSize })
    , whiteButtons : Maybe (List { attrs : List (Attribute msg), text : String, size : BasicButtonSize })
    , circularButtons : Maybe (List { size : CircularButtonSize, icon : Icon, attrs : List (Attribute msg) })
    , leadingIconButtons : Maybe (List { size : LeadingSize, text : String, icon : Icon, attrs : List (Attribute msg) })
    , trailingIconButtons : Maybe (List { size : TrailingSize, text : String, icon : Icon, attrs : List (Attribute msg) })
    , iconButtonDividers : Maybe (List { attrs : List (Attribute msg), icon : Icon, text : String })
    , projectDescriptions : Maybe (List { isOpen : Bool, text : String, title : String, subtitle : String, id : ModuleInstanceId })
    , accordions : Maybe (List { isOpen : Bool, text : String, size : AccordionSize, id : ModuleInstanceId })
    , imageTileGrids : Maybe (List (List ImageTile.Model))
    , focuses : Maybe (List Focus.Model)
    , back : Maybe {}
    }


type alias Footer msg =
    { circularAvatars : Maybe (List { size : CircularAvatarSize, img : String, alt : String, attrs : List (Attribute msg) })
    , primaryButtons : Maybe (List { attrs : List (Attribute msg), text : String, size : BasicButtonSize })
    , secondaryButtons : Maybe (List { attrs : List (Attribute msg), text : String, size : BasicButtonSize })
    , whiteButtons : Maybe (List { attrs : List (Attribute msg), text : String, size : BasicButtonSize })
    , circularButtons : Maybe (List { size : CircularButtonSize, icon : Icon, attrs : List (Attribute msg) })
    , leadingIconButtons : Maybe (List { size : LeadingSize, text : String, icon : Icon, attrs : List (Attribute msg) })
    , trailingIconButtons : Maybe (List { size : TrailingSize, text : String, icon : Icon, attrs : List (Attribute msg) })
    , footer : Maybe { copyrightText : String, contactUsText : String, contactUsUrl : String, licensingFilePath : String }
    }
