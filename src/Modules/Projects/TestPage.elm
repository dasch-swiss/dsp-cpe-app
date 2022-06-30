module Modules.Projects.TestPage exposing (..)

import BlueBoxes.PageStructureModel as Struct


testProjectDescription : Struct.ContentPart
testProjectDescription =
    Struct.ProjectDescription
        { isOpen = False
        , text = "My Project"
        , title = "Title"
        , subtitle = "Subtitle"
        }


testProjectFocus : Struct.ContentPart
testProjectFocus =
    Struct.ProjectFocus
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
        }


testAppHeader : Struct.HeaderPart
testAppHeader =
    Struct.AppHeader
        { logo =
            { src = "https://beol.dasch.swiss/assets/images/beol-logo.png"
            , lbl = "Beol Logo"
            , attrs = []
            }
        , navBar =
            [ { attrs = [], text = "Goldbach", href = "https://www.dasch.swiss", cmd = Cmd.none, isActive = True }
            , { attrs = [], text = "Meditationes", href = "project/1", cmd = Cmd.none, isActive = False }
            , { attrs = [], text = "Condorcet-Turgo", href = "project/1", cmd = Cmd.none, isActive = False }
            , { attrs = [], text = "Leibniz", href = "project/1", cmd = Cmd.none, isActive = False }
            , { attrs = [], text = "Newton", href = "project/1", cmd = Cmd.none, isActive = False }
            , { attrs = [], text = "3D graph", href = "project/1", cmd = Cmd.none, isActive = False }
            , { attrs = [], text = "Advanced Search", href = "project/1", cmd = Cmd.none, isActive = False }
            ]
        , user =
            Just
                { id = "sthId"
                , img = "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
                , name = "Tom Cook"
                , mail = "tom@example.com"
                }
        , showSearchBar = False
        , showMobileMenu = False
        , fixedPosition = True
        }


testAppFooter : Struct.FooterPart
testAppFooter =
    Struct.AppFooter
        { copyrightText = "© 2022 DaSCH"
        , contactUsText = "Contact Us"
        , contactUsUrl = "mailto:info@dasch.swiss"
        , licensingFilePath = "/assets/images/license-cc-beol.jpg"
        }


testHeader : Struct.Header
testHeader =
    Struct.Header [ testAppHeader ]


testContent : Struct.Content
testContent =
    Struct.Content [ testProjectDescription, testProjectFocus ]


testFooter : Struct.Footer
testFooter =
    Struct.Footer [ testAppFooter ]

testPageContentPagePart : Struct.PagePart
testPageContentPagePart =
    Struct.PageContent testContent


testPageHeaderPagePart : Struct.PagePart
testPageHeaderPagePart =
    Struct.PageHeader testHeader


testPageFooterPagePart : Struct.PagePart
testPageFooterPagePart =
    Struct.PageFooter testFooter


testPage : Struct.Page
testPage =
    Struct.Page [ testPageHeaderPagePart, testPageContentPagePart, testPageFooterPagePart ]



-- testContentPart : Struct.ContentPart
-- testContentPart = Struct.ProjectDescription
-- testContent : Struct.ContentPart -> Struct.Content
-- testContent contentPart = Struct.Content [contentPart]
-- testPagePart : Struct.Content -> Struct.PagePart
-- testPagePart content = Struct.PageContent content
-- testPage : Struct.PagePart -> Struct.Page
-- testPage pagePart = Struct.Page [pagePart]
