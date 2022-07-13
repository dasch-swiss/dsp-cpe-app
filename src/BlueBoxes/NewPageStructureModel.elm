module BlueBoxes.NewPageStructureModel exposing (..)

import Shared.SharedTypes exposing (WidgetInstanceId(..))

type Page
    = Page (List PagePart)


type PagePart
    = PageContent Content


type Content
    = Content (List ContentPart)

-- in the future, this will also hold onto the position
type ContentPart
    = ProjectDescription WidgetInstanceId
    | Accordion WidgetInstanceId
