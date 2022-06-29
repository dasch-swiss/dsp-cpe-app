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


testContent : Struct.Content
testContent =
    Struct.Content [ testProjectDescription, testProjectFocus ]


testPagePart : Struct.PagePart
testPagePart =
    Struct.PageContent testContent


testPage : Struct.Page
testPage =
    Struct.Page [ testPagePart ]



-- testContentPart : Struct.ContentPart
-- testContentPart = Struct.ProjectDescription
-- testContent : Struct.ContentPart -> Struct.Content
-- testContent contentPart = Struct.Content [contentPart]
-- testPagePart : Struct.Content -> Struct.PagePart
-- testPagePart content = Struct.PageContent content
-- testPage : Struct.PagePart -> Struct.Page
-- testPage pagePart = Struct.Page [pagePart]
