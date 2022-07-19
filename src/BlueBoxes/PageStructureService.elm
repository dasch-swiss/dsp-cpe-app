module BlueBoxes.PageStructureService exposing (..)

import BlueBoxes.PageStructureModel as Struct
import Shared.SharedTypes exposing (WidgetInstanceId(..))


-- beolHeader : Struct.Header
-- beolHeader =
--     Struct.Header [ Struct.AppHeader ]


beolContent : Struct.Content
beolContent =
    Struct.Content
        [ Struct.ProjectDescription (WidgetInstanceId 1) ]


-- beolFooter : Struct.Footer
-- beolFooter =
--     Struct.Footer [ Struct.AppFooter ]


-- mlsHeader : Struct.Header
-- mlsHeader =
--     Struct.Header [ Struct.AppHeader ]


mlsContent : Struct.Content
mlsContent =
    Struct.Content
        [ Struct.Accordion (WidgetInstanceId 2) ]


-- mlsFooter : Struct.Footer
-- mlsFooter =
--     Struct.Footer [ Struct.AppFooter ]


-- defaultHeader : Struct.Header
-- defaultHeader =
--     Struct.Header [ Struct.AppHeader ]


defaultContent : Struct.Content
defaultContent =
    Struct.Content
        [ Struct.ProjectDescription (WidgetInstanceId 3)
        , Struct.Accordion (WidgetInstanceId 4)
        ]


-- defaultFooter : Struct.Footer
-- defaultFooter =
--     Struct.Footer [ Struct.AppFooter ]


getProjectByID : Int -> Struct.Page
getProjectByID projectID =
    case projectID of
        1 ->
            Struct.Page [ Struct.PageContent beolContent ]
        2 ->
            Struct.Page [ Struct.PageContent mlsContent ]
        _ ->
            Struct.Page [ Struct.PageContent defaultContent ]
