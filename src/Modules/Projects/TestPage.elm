module Modules.Projects.TestPage exposing (..)

import BlueBoxes.PageStructureModel as Struct

testContentPart : Struct.ContentPart
testContentPart =
    Struct.ProjectDescription { isOpen = False, text = "My Project", title = "Title", subtitle = "Subtitle" }


testContent : Struct.Content
testContent =
    Struct.Content [ testContentPart ]


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
