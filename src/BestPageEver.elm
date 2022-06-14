module BestPageEver exposing (..)

import BlueBox.ProjectInterfaceStructureModel as Struct
import Html.Attributes exposing (href)
import Shared.SharedTypes exposing (AccordionSize(..), BasicButtonSize(..), ModuleInstanceId(..))


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
    , projectDescriptions = Just [{ text = """Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus 
                    est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, 
                    no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. 
                    Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, 
                    vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod 
                    tincidunt ut laoreet dolore magna aliquam erat volutpat."""
    , title = "Title"
    , subtitle = "Subtitle"
    , isOpen = False
    , id = ModuleInstanceId 4
    }
    , { text = """Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus 
                    est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, 
                    no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. 
                    Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, 
                    vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod 
                    tincidunt ut laoreet dolore magna aliquam erat volutpat."""
    , title = "Title"
    , subtitle = "Subtitle"
    , isOpen = False
    , id = ModuleInstanceId 5
    }]
    , accordions =
        Just
            [ { isOpen = False
              , text = """Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus 
                        est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, 
                        no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. 
                        Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, 
                        vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod 
                        tincidunt ut laoreet dolore magna aliquam erat volutpat."""
              , size = FullWidth
              , id = ModuleInstanceId 1
              }
            , { isOpen = False
              , text = """Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus 
                        est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, 
                        no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. 
                        Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, 
                        vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod 
                        tincidunt ut laoreet dolore magna aliquam erat volutpat."""
              , size = FullWidth
              , id = ModuleInstanceId 2
              }
            ]
    , imageTileGrids =
        Just
            [ [ { src = "https://m.media-amazon.com/images/I/51Dmo6as7CL._AC_SX385._SX._UX._SY._UY_.jpg", alt = "Black", buttonAlt = "", title = "Black", subtitle = "Best Black card", url = "https://scryfall.com/card/2xm/109/thoughtseize" }
              , { src = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4Urm7Ecn8IHA1AVD9G-2F2mbzdpuynQzMAg&usqp=CAU", alt = "Green", buttonAlt = "", title = "Green", subtitle = "Best Green card", url = "https://scryfall.com/card/3ed/194/fastbond" }
              , { src = "https://www.pngitem.com/pimgs/m/484-4849222_the-gathering-magic-points-mana-playing-card-collectible.png", alt = "Red", buttonAlt = "", title = "Red", subtitle = "Best Red card", url = "https://scryfall.com/card/clb/187/lightning-bolt" }
              , { src = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBZCpVcmUL7Rja96CMxRtCE4DzvUSug4IJxg&usqp=CAU", alt = "Blue", buttonAlt = "", title = "Blue", subtitle = "Best Blue card", url = "https://scryfall.com/card/vma/1/ancestral-recall" }
              , { src = "https://static.wikia.nocookie.net/mtgsalvation_gamepedia/images/8/8d/Old_W.svg/revision/latest/scale-to-width-down/200?cb=20170110205458", alt = "White", buttonAlt = "", title = "White", subtitle = "Best White card", url = "https://scryfall.com/card/ncc/211/swords-to-plowshares" }
              ]
            ]
    , focuses = Just [
        { headerModel =
        { title = "Title"
        , subtitle = "subtitle"
        }
    , contentModel =
        { contentBody = """Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus 
                    est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, 
                    no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. 
                    Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, 
                    vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod 
                    tincidunt ut laoreet dolore magna aliquam erat volutpat."""
        , imagePath = "https://images.unsplash.com/photo-1546913199-55e06682967e?ixlib=rb-1.2.1&auto=format&fit=crop&crop=focalpoint&fp-x=.735&fp-y=.55&w=1184&h=1376&q=80"
        , imageAltText = "Whitney leaning against a railing on a downtown street"
        , isReadMoreOpen = False
        , datasetTitle = "Test Dataset"
        }
    , id = ModuleInstanceId 5
    },
    { headerModel =
        { title = "Title"
        , subtitle = "subtitle"
        }
    , contentModel =
        { contentBody = """Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus 
                    est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, 
                    no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. 
                    Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, 
                    vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod 
                    tincidunt ut laoreet dolore magna aliquam erat volutpat."""
        , imagePath = "https://images.unsplash.com/photo-1546913199-55e06682967e?ixlib=rb-1.2.1&auto=format&fit=crop&crop=focalpoint&fp-x=.735&fp-y=.55&w=1184&h=1376&q=80"
        , imageAltText = "Whitney leaning against a railing on a downtown street"
        , isReadMoreOpen = False
        , datasetTitle = "Test Dataset"
        }
    , id = ModuleInstanceId 6
    }
    ]
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
    , footer = Just { copyrightText = "Owned by smart Devs near you", contactUsText = "Please dont contact us", contactUsUrl = "https://www.google.ch", licensingFilePath = "" }
    }
