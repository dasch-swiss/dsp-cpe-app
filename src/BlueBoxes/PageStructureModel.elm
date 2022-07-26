module BlueBoxes.PageStructureModel exposing (..)

import Shared.SharedTypes exposing (WidgetContainerId(..), WidgetInstanceId(..))


type Page
    = Page (List PagePart)


type PagePart
    = PageContent Content



-- Header and Footer need to be added at some point


type Content
    = Content (List ContentPart)



-- in the future, this will also hold onto the position


type ContentPart
    = ProjectDescription WidgetInstanceId
    | Accordion WidgetInstanceId



--new types


type Page2
    = Page2 (List PagePart2)


type PagePart2
    = PageContent2 Content2


type Content2
    = Content2 (List WidgetContainer)


type WidgetContainer
    = WidgetContainer WidgetContainerId WidgetContent


type WidgetContent
    = ProjectDescription2 WidgetInstanceId
    | Accordion2 WidgetInstanceId


type alias PageCanvas =
    { rowSpanMax : Int, colSpanMax : Int }


pageCanvas : PageCanvas
pageCanvas =
    { rowSpanMax = 8, colSpanMax = 8 }
