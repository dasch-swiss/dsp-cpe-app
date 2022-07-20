module BlueBoxes.NewExecutor exposing (..)

import BlueBoxes.NewGuiElement as GuiElement exposing (AlignSelf(..), JustifySelf(..))
import BlueBoxes.PageStructureModel as Struct
import BlueBoxes.WidgetContainer as WidgetContainer
import DspCpeApi as Api
import Html exposing (Html, div)
import List
import Shared.SharedTypes exposing (WidgetContainerId)


type alias Model =
    { page : Struct.Page2 }


execute : Struct.Page2 -> ( List GuiElement.Model, Cmd GuiElement.Msg )
execute (Struct.Page2 pageParts) =
    deconstructGuiElementList (List.map executePagePart pageParts)


deconstructGuiElementList : List ( List GuiElement.Model, Cmd GuiElement.Msg ) -> ( List GuiElement.Model, Cmd GuiElement.Msg )
deconstructGuiElementList list =
    ( List.concatMap (\tuple -> Tuple.first tuple) list, Cmd.batch (List.map (\tuple -> Tuple.second tuple) list) )


executePagePart : Struct.PagePart2 -> ( List GuiElement.Model, Cmd GuiElement.Msg )
executePagePart pagePart =
    case pagePart of
        Struct.PageContent2 (Struct.Content2 widgetContainer) ->
            let
                list =
                    List.map executeWidgetContainer widgetContainer
            in
            ( List.map (\tuple -> Tuple.first tuple) list, Cmd.batch (List.map (\tuple -> Tuple.second tuple) list) )


executeWidgetContainer : Struct.WidgetContainer -> ( GuiElement.Model, Cmd GuiElement.Msg )
executeWidgetContainer widgetContainer =
    case widgetContainer of
        Struct.WidgetContainer widgetContainerId widgetContent ->
            let
                ( newVariant, cmd ) =
                    executeWidgetContent widgetContent
            in
            ( { variant = newVariant, widgetContainer = getWidgetContainer widgetContainerId }, cmd )



-- Todo: Api for widgetContainers Execution
--getWidgetContainer : WidgetContainerId -> ( GuiElement.WidgetContainer


getWidgetContainer : WidgetContainerId -> GuiElement.WidgetContainer
getWidgetContainer widgetContainerId =
    { position =
        { order = 1
        , rowStart = 1
        , rowEnd = 5
        , colStart = 1
        , colEnd = 8
        }
    , justifySelf = JustifyCenter
    , alignSelf = AlignCenter
    }


executeWidgetContent : Struct.WidgetContent -> ( GuiElement.GuiElementVariant, Cmd GuiElement.Msg )
executeWidgetContent widgetContent =
    case widgetContent of
        Struct.ProjectDescription2 widgetID ->
            let
                ( model, cmd ) =
                    Api.initProjectDescription widgetID
            in
            ( GuiElement.ProjectDescriptionElement model, Cmd.map GuiElement.ProjectDescriptionMsg cmd )

        Struct.Accordion2 widgetID ->
            let
                ( model, cmd ) =
                    Api.initAccordion widgetID
            in
            ( GuiElement.AccordionElement model, Cmd.map GuiElement.AccordionMsg cmd )
