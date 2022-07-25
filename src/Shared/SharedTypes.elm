module Shared.SharedTypes exposing (..)

import Html exposing (Attribute)


type WidgetInstanceId
    = WidgetInstanceId Int


type WidgetContainerId
    = WidgetContainerId Int


type CircularAvatarSize
    = CircularAvatarExtraSmall
    | CircularAvatarSmall
    | CircularAvatarNormal
    | CircularAvatarLarge
    | CircularAvatarExtraLarge


type BasicButtonSize
    = BasicExtraSmall
    | BasicSmall
    | BasicNormal
    | BasicLarge
    | BasicExtraLarge


type CircularButtonSize
    = CircularExtraSmall
    | CircularSmall
    | CircularNormal
    | CircularLarge
    | CircularExtraLarge


type LeadingSize
    = LeadingSmall
    | LeadingNormal
    | LeadingLarge
    | LeadingExtraLarge


type TrailingSize
    = TrailingSmall
    | TrailingNormal
    | TrailingLarge
    | TrailingExtraLarge


type alias NavItem msg =
    { attrs : List (Attribute msg) -- onClick, disable and all other events as well as custom attributes
    , text : String
    , href : String -- set to "#" if you like to run sth via onClick
    , cmd : Cmd msg
    , isActive : Bool
    }


type AlignSelf
    = AlignStart
    | AlignEnd
    | AlignCenter


type JustifySelf
    = JustifyStart
    | JustifyEnd
    | JustifyCenter
