module BlueBoxes.NewExecutor exposing (..)

import BlueBoxes.GuiElement as GuiElement
import BlueBoxes.NewPageStructureModel as Struct
import DspCpeApi as Api
import Html exposing (Html, div, footer, header, main_)
import Html.Attributes exposing (class)
import List exposing (map)
import Modules.Projects.NewTestPage as NewTest
import Shared.SharedTypes exposing (WidgetInstanceId(..))


type alias Model =
    { page : Struct.Page }


init : ( Model, Cmd msg )
init =
    ( { page = NewTest.testPage }, Cmd.none )


execute : Struct.Page -> Html msg
execute (Struct.Page pageParts) =
    div [] (map executePagePart pageParts)


executePagePart : Struct.PagePart -> Html msg
executePagePart pagePart =
    case pagePart of
        Struct.PageContent (Struct.Content contentPart) ->
            main_
                []
                (map executeContentPart contentPart)


executeContentPart : Struct.ContentPart -> Html msg
executeContentPart contentPart =
    case contentPart of
        Struct.ProjectDescription wid ->
            div [] []


executeNewProjectDescription : WidgetInstanceId -> ( GuiElement.Model, Cmd GuiElement.Msg )
executeNewProjectDescription wid =
    let
        ( model, cmd ) =
            Api.newProjectDescription wid
    in
    ( { variant = GuiElement.ProjectDescriptionElement model }, Cmd.map GuiElement.ProjectDescriptionMsg cmd )


executeNewAccordion : WidgetInstanceId -> ( GuiElement.Model, Cmd GuiElement.Msg )
executeNewAccordion wid =
    let
        ( model, cmd ) =
            Api.newAccordion wid
    in
    ( { variant = GuiElement.AccordionElement model }, Cmd.map GuiElement.AccordionMsg cmd )


view : Model -> Html msg
view model =
    execute model.page
