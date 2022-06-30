module BlueBoxes.PageStructureModel exposing (..)

import Modules.NavigationHeader.NavigationHeader as NavigationHeader
import Modules.Projects.Focus.Focus as ProjectFocus
import Modules.Text.ProjectDescription as ProjectDescription
import Modules.Footer.Footer as Footer

type Page
    = Page (List PagePart)


type PagePart
    = PageHeader Header
    | PageContent Content
    | PageFooter Footer


type Header
    = Header (List HeaderPart)


type HeaderPart
    = AppHeader NavigationHeader.HeaderModel


type Content
    = Content (List ContentPart)


type ContentPart
    = ProjectDescription ProjectDescription.Model
    | ProjectFocus ProjectFocus.Model


type Footer
    = Footer (List FooterPart)


type FooterPart
    = AppFooter Footer.Model
