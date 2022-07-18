module Modules.Projects.PageStructureService exposing (..)

import BlueBoxes.PageStructureModel as Struct
import Shared.SharedTypes exposing (AccordionSize(..), WidgetInstanceId(..))


beolHeader : Struct.Header
beolHeader =
    Struct.Header [ Struct.AppHeader
                            { logo =
                                { src = ""
                                , lbl = ""
                                , attrs = []
                                }
                            , navBar =
                                [ { attrs = [], text = "", href = "", cmd = Cmd.none, isActive = False } ]
                            , user = Nothing
                            , showSearchBar = False
                            , showMobileMenu = False
                            } ]


beolContent : Struct.Content
beolContent =
    Struct.Content
        [ Struct.ProjectDescription
                  { isOpen = False
                  , text = ""
                  , title = ""
                  , subtitle = ""
                  , id = WidgetInstanceId 1
                  }
        , Struct.ProjectFocus
                  { headerModel =
                      { title = ""
                      , subtitle = ""
                      }
                  , contentModel =
                      { contentBody = ""
                      , imagePath = ""
                      , imageAltText = ""
                      , isReadMoreOpen = False
                      , datasetTitle = ""
                      }
                  , id = WidgetInstanceId 2
                  }
        ]


beolFooter : Struct.Footer
beolFooter =
    Struct.Footer [ Struct.AppFooter
                            { copyrightText = ""
                            , contactUsText = ""
                            , contactUsUrl = ""
                            , licensingFilePath = ""
                            } ]


mlsHeader : Struct.Header
mlsHeader =
    Struct.Header [ Struct.AppHeader
                            { logo =
                                { src = ""
                                , lbl = ""
                                , attrs = []
                                }
                            , navBar =
                                [ { attrs = [], text = "", href = "", cmd = Cmd.none, isActive = False } ]
                            , user = Nothing
                            , showSearchBar = False
                            , showMobileMenu = False
                            } ]


mlsContent : Struct.Content
mlsContent =
    Struct.Content
        [ Struct.Accordion
                  { isOpen = False
                  , text = ""
                  , size = FullWidth
                  , id = WidgetInstanceId 3
                  } ]


mlsFooter : Struct.Footer
mlsFooter =
    Struct.Footer [ Struct.AppFooter
                            { copyrightText = ""
                            , contactUsText = ""
                            , contactUsUrl = ""
                            , licensingFilePath = ""
                            } ]


defaultHeader : Struct.Header
defaultHeader =
    Struct.Header [ Struct.AppHeader
                            { logo =
                                { src = ""
                                , lbl = ""
                                , attrs = []
                                }
                            , navBar =
                                [ { attrs = [], text = "", href = "", cmd = Cmd.none, isActive = False } ]
                            , user = Nothing
                            , showSearchBar = False
                            , showMobileMenu = False
                            } ]


defaultContent : Struct.Content
defaultContent =
    Struct.Content
        []


defaultFooter : Struct.Footer
defaultFooter =
    Struct.Footer [ Struct.AppFooter
                            { copyrightText = ""
                            , contactUsText = ""
                            , contactUsUrl = ""
                            , licensingFilePath = ""
                            } ]


getProjectByID : Int -> Struct.Page
getProjectByID projectID =
    case projectID of
        1 ->
            Struct.Page [ Struct.PageHeader beolHeader, Struct.PageContent beolContent, Struct.PageFooter beolFooter ]
        2 ->
            Struct.Page [ Struct.PageHeader mlsHeader, Struct.PageContent mlsContent, Struct.PageFooter mlsFooter ]
        _ ->
            Struct.Page [ Struct.PageHeader defaultHeader, Struct.PageContent defaultContent, Struct.PageFooter defaultFooter ]
