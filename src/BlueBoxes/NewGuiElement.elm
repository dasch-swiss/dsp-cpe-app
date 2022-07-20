module BlueBoxes.NewGuiElement exposing (..)

import BlueBoxes.WidgetContainer as WidgetContainer
import Html exposing (Html)
import Modules.Text.Accordion as Accordion
import Modules.Text.ProjectDescription as ProjectDescription


type alias Model =
    { variant : GuiElementVariant
    , widgetContainer : WidgetContainer
    }


type GuiElementVariant
    = ProjectDescriptionElement ProjectDescription.Model
    | AccordionElement Accordion.Model


type alias WidgetContainer =
    { position : GridPosition -- the position in the grid
    , justifySelf : JustifySelf
    , alignSelf : AlignSelf
    }


type AlignSelf
    = AlignStart
    | AlignEnd
    | AlignCenter


type JustifySelf
    = JustifyStart
    | JustifyEnd
    | JustifyCenter


type alias GridPosition =
    { order : Int
    , rowStart : Int
    , rowEnd : Int
    , colStart : Int
    , colEnd : Int
    }



-- More variants will be added here


type Msg
    = ProjectDescriptionMsg ProjectDescription.Msg
    | AccordionMsg Accordion.Msg


view : Model -> Html Msg
view model =
    case model.variant of
        ProjectDescriptionElement projDescModel ->
            ProjectDescription.view projDescModel |> Html.map ProjectDescriptionMsg

        AccordionElement accModel ->
            Accordion.view accModel |> Html.map AccordionMsg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ProjectDescriptionMsg projDescMsg ->
            case model.variant of
                ProjectDescriptionElement projDescModel ->
                    let
                        ( newModel, newCmd ) =
                            ProjectDescription.update projDescMsg projDescModel
                    in
                    ( { variant = ProjectDescriptionElement newModel, widgetContainer = model.widgetContainer }, Cmd.map ProjectDescriptionMsg newCmd )

                _ ->
                    ( model, Cmd.none )

        AccordionMsg accMsg ->
            case model.variant of
                AccordionElement accModel ->
                    let
                        ( newModel, newCmd ) =
                            Accordion.update accMsg accModel
                    in
                    ( { variant = AccordionElement newModel, widgetContainer = model.widgetContainer }, Cmd.map AccordionMsg newCmd )

                _ ->
                    ( model, Cmd.none )
