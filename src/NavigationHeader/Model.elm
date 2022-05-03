module NavigationHeader.Model exposing (..)

import Html exposing (Attribute)


type Msg
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
    { attrs : List (Attribute Msg) -- onClick, disable and all other events as well as custom attributes
    , text : String
    , href : String -- set to "#" if you like to run sth via onClick
    , cmd : Cmd Msg
    , isActive : Bool
    }


type alias User =
    { uId : String
    , uImg : String
    }


initalNavItem : NavItem
initalNavItem =
    { attrs = []
    , text = "advanced search"
    , href = "#"
    , isActive = True
    , cmd = Cmd.none
    }
