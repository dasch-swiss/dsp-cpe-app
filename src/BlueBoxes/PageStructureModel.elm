module BlueBoxes.PageStructureModel exposing (..)
import Modules.Text.ProjectDescription as ProjectDescription
import Modules.Projects.Focus.Focus as ProjectFocus
type Page
    = Page (List PagePart)


type PagePart
    = PageContent Content


type Content
    = Content (List ContentPart)


type ContentPart
    = ProjectDescription ProjectDescription.Model
    | ProjectFocus ProjectFocus.Model



-- = PageHeader Header
-- | PageContent Content
-- | PageFooter Footer
-- type Header
--     = Header (List HeaderPart)
-- type HeaderPart
--     = Logo
--     | Profile
-- type Footer
--     = Footer (List FooterPart)
-- type FooterPart
--     = Copyright
--     | Legal
