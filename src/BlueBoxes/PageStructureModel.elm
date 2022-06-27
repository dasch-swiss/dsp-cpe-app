module BlueBoxes.PageStructureModel exposing (..)


type Page
    = Page (List PagePart)


type PagePart
    = PageHeader Header
    | PageBody Body
    | PageFooter Footer


type Header
    = Header (List HeaderPart)


type HeaderPart
    = AppHeader


type Body
    = Body (List BodyPart)


type BodyPart
    = ProjectDescription { isOpen : Bool, text : String, title : String, subtitle : String}

type Footer
    = Footer (List FooterPart)


type FooterPart
    = AppFooter


-- type alias Page =
--     { pagePart : List PagePart }
-- type PagePart
--     = Header HeaderPart Logo Profile
--     | Body
--     | Footer
-- type alias HeaderPart =
--     { header : Header }
