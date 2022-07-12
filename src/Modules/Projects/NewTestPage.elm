module Modules.Projects.NewTestPage exposing (..)

import BlueBoxes.NewPageStructureModel as Struct
import Shared.SharedTypes exposing (AccordionSize(..), WidgetInstanceId(..))


testProjectDescription : Struct.ContentPart
testProjectDescription =
    Struct.ProjectDescription (WidgetInstanceId 1)


testContent : Struct.Content
testContent =
    Struct.Content
        [ testProjectDescription
        ]


testPageContentPagePart : Struct.PagePart
testPageContentPagePart =
    Struct.PageContent testContent


testPage : Struct.Page
testPage =
    Struct.Page [ testPageContentPagePart ]
