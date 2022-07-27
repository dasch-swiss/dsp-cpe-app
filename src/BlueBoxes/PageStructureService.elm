module BlueBoxes.PageStructureService exposing (..)

import BlueBoxes.PageStructureModel as Struct
import Shared.SharedTypes exposing (WidgetContainerId(..), WidgetInstanceId(..))



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


defaultContent : Struct.Content2
defaultContent =
    Struct.Content2
        [ Struct.WidgetContainer (WidgetContainerId 1) (Struct.ProjectDescription2 (WidgetInstanceId 3))
        , Struct.WidgetContainer (WidgetContainerId 2) (Struct.Accordion2 (WidgetInstanceId 4))
        ]



-- defaultFooter : Struct.Footer
-- defaultFooter =
--     Struct.Footer [ Struct.AppFooter ]


getProjectByID : Int -> Struct.Page2
getProjectByID projectID =
    case projectID of
        1 ->
            Struct.Page2 [ Struct.PageContent2 defaultContent ]

        2 ->
            Struct.Page2 [ Struct.PageContent2 defaultContent ]

        _ ->
            Struct.Page2 [ Struct.PageContent2 defaultContent ]
