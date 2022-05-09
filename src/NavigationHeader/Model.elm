module NavigationHeader.Model exposing (..)

import Html exposing (Attribute)


type NavHeaderMsg
    = ToggleSearchBarMsg
    | LogOutMsg
    | SignInRequestMsg
    | SignUpRequestMsg


type alias HeaderModel =
    { logo : String
    , user : Maybe User
    , navBar : List NavItem
    , showSearchBar : Bool
    }


type alias NavItem =
    { attrs : List (Attribute NavHeaderMsg) -- onClick, disable and all other events as well as custom attributes
    , text : String
    , href : String
    , cmd : Cmd NavHeaderMsg
    , isActive : Bool
    }


type alias User =
    { id : String
    , img : String
    }


initalNavItem : NavItem
initalNavItem =
    { attrs = []
    , text = "advanced search"
    , href = "#"
    , isActive = True
    , cmd = Cmd.none
    }
