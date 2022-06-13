module BestPageEver exposing (..)

import BlueBox.ProjectInterfaceStructureModel as Struct
import Html.Attributes exposing (href)
import Shared.SharedTypes exposing (BasicButtonSize(..))


bestPage : Struct.Model msg
bestPage =
    { header = header
    , body = body
    , footer = footer
    }


header : Struct.Header msg
header =
    { circularAvatars = Nothing
    , primaryButtons = Nothing
    , secondaryButtons = Nothing
    , whiteButtons = Nothing
    , circularButtons = Nothing
    , leadingIconButtons = Nothing
    , trailingIconButtons = Nothing
    , header =
        Just
            { logo =
                { src = "https://beol.dasch.swiss/assets/images/beol-logo.png"
                , lbl = "Best Logo ever"
                , attrs = []
                }
            , navBar = []
            , showSearchBar = True
            , user = Nothing
            , showMobileMenu = True
            }
    }


body : Struct.Body msg
body =
    { circularAvatars = Nothing
    , primaryButtons = Just [ { attrs = [ href "https://scryfall.com/card/2xm/109/thoughtseize" ], text = "Black", size = BasicNormal }, { attrs = [ href "https://scryfall.com/card/clb/187/lightning-bolt" ], text = "Red", size = BasicNormal }, { attrs = [ href "https://scryfall.com/card/2xm/151/ancient-stirrings" ], text = "Green", size = BasicNormal }, { attrs = [ href "https://scryfall.com/card/vma/1/ancestral-recall" ], text = "Blue", size = BasicNormal }, { attrs = [ href "https://scryfall.com/card/ncc/211/swords-to-plowshares" ], text = "White", size = BasicNormal } ]
    , secondaryButtons = Nothing
    , whiteButtons = Nothing
    , circularButtons = Nothing
    , leadingIconButtons = Nothing
    , trailingIconButtons = Nothing
    , iconButtonDividers = Nothing
    , projectDescriptions = Nothing
    , accordions = Nothing
    , imageTileGrids = Nothing
    , focus = Nothing
    , back = Just {}
    }


footer : Struct.Footer msg
footer =
    { circularAvatars = Nothing
    , primaryButtons = Nothing
    , secondaryButtons = Nothing
    , whiteButtons = Nothing
    , circularButtons = Nothing
    , leadingIconButtons = Nothing
    , trailingIconButtons = Nothing
    , footer = Just { copyrightText = "Owned by smart Devs near you", contactUsText = "Please dont contact us", contactUsUrl = "google.ch", licensingFilePath = "" }
    }
