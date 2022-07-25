module BlueBoxes.NewGuiElement exposing (..)

import BlueBoxes.WidgetContainer as Cntr
import Html exposing (Html, div)
import Html.Attributes exposing (class, id)
import Modules.Text.Accordion as Accordion
import Modules.Text.ProjectDescription as ProjectDescription
import Shared.SharedTypes as Shared exposing (AlignSelf(..), BasicButtonSize(..), CircularAvatarSize(..), CircularButtonSize(..), JustifySelf(..), LeadingSize(..), TrailingSize(..), WidgetContainerId, WidgetInstanceId(..))
import Util.CustomCss.DaschTailwind as Dtw


type alias Model =
    { variant : GuiElementVariant
    , widgetContainer : WidgetContainer
    }


type GuiElementVariant
    = ProjectDescriptionElement ProjectDescription.Model
    | AccordionElement Accordion.Model


type alias WidgetContainer =
    { id : WidgetContainerId
    , position : GridPosition -- the position in the grid
    , justifySelf : JustifySelf
    , alignSelf : AlignSelf
    }


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
view guiElement =
    div
        [ id "someContainerID"
        , class (Dtw.custom_grid_col_start guiElement.widgetContainer.position.colStart)
        , class (Dtw.custom_grid_col_end guiElement.widgetContainer.position.colEnd)
        , class (Dtw.custom_grid_row_start guiElement.widgetContainer.position.rowStart)
        , class (Dtw.custom_grid_row_end guiElement.widgetContainer.position.rowEnd)
        , class "rounded-lg border-2 cursor-pointer border-[#1D4ED8]"
        ]
        [ --div [] [ Cntr.increaseButton guiElement.widgetContainer.id ] |> Html.map Cntr.AppendGridCol
          guiElementView guiElement
        ]


guiElementView : Model -> Html Msg
guiElementView model =
    let
        content =
            case model.variant of
                ProjectDescriptionElement projDescModel ->
                    ProjectDescription.view projDescModel |> Html.map ProjectDescriptionMsg

                AccordionElement accModel ->
                    Accordion.view accModel
                        |> Html.map AccordionMsg
    in
    content


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
