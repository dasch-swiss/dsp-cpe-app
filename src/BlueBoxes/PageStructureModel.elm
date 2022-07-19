module BlueBoxes.PageStructureModel exposing (..)

import Shared.SharedTypes exposing (WidgetInstanceId(..))

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
