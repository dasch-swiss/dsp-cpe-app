module BlueBoxes.PageStructureModel2 exposing (..)


type alias Page =
    { pageParts : List PagePart }


type alias PagePart =
    { headerPart : List HeaderPart
    , bodyPart : List BodyPart
    , footerPart : List FooterPart
    }


type alias HeaderPart =
    { header : Header }


type alias Header =
    { showHeader : Bool }


type alias BodyPart =
    { projectDescription : ProjectDescription }


type alias ProjectDescription =
    { isOpen : Bool
    , text : String
    , title : String
    , subtitle : String
    }


type alias FooterPart =
    { footer : Footer }


type alias Footer =
    { showFooter : Bool }
