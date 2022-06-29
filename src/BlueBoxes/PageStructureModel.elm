module BlueBoxes.PageStructureModel exposing (..)

import Modules.Projects.Focus.Focus as ProjectFocus
import Modules.Text.ProjectDescription as ProjectDescription
import Modules.NavigationHeader.NavigationHeader as NavigationHeader

type Page
    = Page (List PagePart)


type PagePart
    = PageHeader Header
    | PageContent Content


type Header
    = Header (List HeaderPart)


type HeaderPart
    = NavHeader NavigationHeader.HeaderModel


type Content
    = Content (List ContentPart)


type ContentPart
    = ProjectDescription ProjectDescription.Model
    | ProjectFocus ProjectFocus.Model



-- = PageHeader Header
-- | PageContent Content
-- | PageFooter Footer
-- type Footer
--     = Footer (List FooterPart)
-- type FooterPart
--     = Copyright
--     | Legal
