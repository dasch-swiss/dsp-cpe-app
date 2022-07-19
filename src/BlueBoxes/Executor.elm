module BlueBoxes.Executor exposing (..)

import BlueBoxes.GuiElement as GuiElement
import BlueBoxes.PageStructureModel as Struct
import DspCpeApi as Api
import List


type alias Model =
    { page : Struct.Page }


execute : Struct.Page -> ( List GuiElement.Model, Cmd GuiElement.Msg )
execute (Struct.Page pageParts) =
    deconstructGuiElementList (List.map executePagePart pageParts)


deconstructGuiElementList : List ( List GuiElement.Model, Cmd GuiElement.Msg ) -> ( List GuiElement.Model, Cmd GuiElement.Msg )
deconstructGuiElementList list =
    ( List.concatMap (\tuple -> Tuple.first tuple) list, Cmd.batch (List.map (\tuple -> Tuple.second tuple) list) )


executePagePart : Struct.PagePart -> ( List GuiElement.Model, Cmd GuiElement.Msg )
executePagePart pagePart =
    case pagePart of
        Struct.PageContent (Struct.Content contentPart) ->
            let
                list =
                    List.map executeContentPart contentPart
            in
            ( List.map (\tuple -> Tuple.first tuple) list, Cmd.batch (List.map (\tuple -> Tuple.second tuple) list) )


executeContentPart : Struct.ContentPart -> ( GuiElement.Model, Cmd GuiElement.Msg )
executeContentPart contentPart =
    case contentPart of
        Struct.ProjectDescription widgetID ->
            let
                ( model, cmd ) =
                    Api.initProjectDescription widgetID
            in
            ( { variant = GuiElement.ProjectDescriptionElement model }, Cmd.map GuiElement.ProjectDescriptionMsg cmd )

        Struct.Accordion widgetID ->
            let
                ( model, cmd ) =
                    Api.initAccordion widgetID
            in
            ( { variant = GuiElement.AccordionElement model }, Cmd.map GuiElement.AccordionMsg cmd )
