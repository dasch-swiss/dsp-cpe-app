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
            , fixedPosition = True
            }
    }


body : Struct.Body msg
body =
    { circularAvatars = Nothing
    , primaryButtons = Nothing
    , secondaryButtons = Nothing
    , whiteButtons = Nothing
    , circularButtons = Nothing
    , leadingIconButtons = Nothing
    , trailingIconButtons = Nothing
    , iconButtonDividers = Nothing
    , projectDescriptions = Nothing
    , accordions = Nothing
    , imageTileGrids =
        Just
            [ [ { src = "https://m.media-amazon.com/images/I/51Dmo6as7CL._AC_SX385._SX._UX._SY._UY_.jpg", alt = "Black", buttonAlt = "", title = "Black", subtitle = "Best Black card", url = "https://scryfall.com/card/2xm/109/thoughtseize" }
              , { src = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4Urm7Ecn8IHA1AVD9G-2F2mbzdpuynQzMAg&usqp=CAU", alt = "Green", buttonAlt = "", title = "Green", subtitle = "Best Green card", url = "https://scryfall.com/card/3ed/194/fastbond" }
              , { src = "https://www.pngitem.com/pimgs/m/484-4849222_the-gathering-magic-points-mana-playing-card-collectible.png", alt = "Red", buttonAlt = "", title = "Red", subtitle = "Best Red card", url = "https://scryfall.com/card/clb/187/lightning-bolt" }
              , { src = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBZCpVcmUL7Rja96CMxRtCE4DzvUSug4IJxg&usqp=CAU", alt = "Blue", buttonAlt = "", title = "Blue", subtitle = "Best Blue card", url = "https://scryfall.com/card/vma/1/ancestral-recall" }
              , { src = "https://static.wikia.nocookie.net/mtgsalvation_gamepedia/images/8/8d/Old_W.svg/revision/latest/scale-to-width-down/200?cb=20170110205458", alt = "White", buttonAlt = "", title = "White", subtitle = "Best White card", url = "https://scryfall.com/card/ncc/211/swords-to-plowshares" }
              ]
            ]
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
