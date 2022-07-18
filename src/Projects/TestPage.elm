module Projects.TestPage exposing (..)

import BlueBoxes.PageStructureModel as Struct
import Shared.SharedTypes exposing (WidgetInstanceId(..))

testAccordion : Struct.ContentPart
testAccordion =
    Struct.Accordion (WidgetInstanceId 1)

testAccordion2 : Struct.ContentPart
testAccordion2 =
    Struct.Accordion (WidgetInstanceId 3)


testProjectDescription : Struct.ContentPart
testProjectDescription =
    Struct.ProjectDescription (WidgetInstanceId 2)


testContent : Struct.Content
testContent =
    Struct.Content
        [ testProjectDescription
        , testAccordion
        , testAccordion2
        ]


testPageContentPagePart : Struct.PagePart
testPageContentPagePart =
    Struct.PageContent testContent


testPage : Struct.Page
testPage =
    Struct.Page [ testPageContentPagePart ]
