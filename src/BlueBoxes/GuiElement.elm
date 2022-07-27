module BlueBoxes.GuiElement exposing (..)

import BlueBoxes.PageStructureModel as Struct
import BlueBoxes.WidgetContainer as WidgetContainer
import Html exposing (Html, div)
import Html.Attributes exposing (class, id)
import Html.Events exposing (onClick)
import Modules.Dividers.IconButtonDivider as IconButton
import Modules.Text.Accordion as Accordion
import Modules.Text.ProjectDescription as ProjectDescription
import Shared.SharedTypes as Shared exposing (AlignSelf(..), BasicButtonSize(..), CircularAvatarSize(..), CircularButtonSize(..), JustifySelf(..), LeadingSize(..), TrailingSize(..), WidgetContainerId(..), WidgetInstanceId(..))
import String exposing (fromInt)
import Util.CustomCss.DaschTailwind as Dtw
import Util.Icon as Icon


type alias Model =
    { content : GuiElementVariant
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


type Msg
    = ProjectDescriptionMsg ProjectDescription.Msg
    | AccordionMsg Accordion.Msg
    | WidgetContainerMsg WidgetContainer.Msg


renderGuiElements : List Model -> List (Html Msg)
renderGuiElements widgets =
    widgets
        |> List.map
            (\n ->
                view n
            )


view : Model -> Html Msg
view model =
    div
        [ id (idToString model.widgetContainer.id)
        , class (Dtw.custom_grid_col_start model.widgetContainer.position.colStart)
        , class (Dtw.custom_grid_col_end model.widgetContainer.position.colEnd)
        , class (Dtw.custom_grid_row_start model.widgetContainer.position.rowStart)
        , class (Dtw.custom_grid_row_end model.widgetContainer.position.rowEnd)
        ]
        [ div []
            [ IconButton.view
                { buttonAttrs =
                    [ onClick (WidgetContainer.AppendGridColMsg model.widgetContainer.id)
                    ]
                , icon = Icon.PlusSm
                , text = ""
                }
            ]
            |> Html.map WidgetContainerMsg
        , contentView model
        ]


contentView : Model -> Html Msg
contentView model =
    let
        content =
            case model.content of
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
            case model.content of
                ProjectDescriptionElement projDescModel ->
                    let
                        ( newModel, newCmd ) =
                            ProjectDescription.update projDescMsg projDescModel
                    in
                    ( { content = ProjectDescriptionElement newModel, widgetContainer = model.widgetContainer }, Cmd.map ProjectDescriptionMsg newCmd )

                _ ->
                    ( model, Cmd.none )

        AccordionMsg accMsg ->
            case model.content of
                AccordionElement accModel ->
                    let
                        ( newModel, newCmd ) =
                            Accordion.update accMsg accModel
                    in
                    ( { content = AccordionElement newModel, widgetContainer = model.widgetContainer }, Cmd.map AccordionMsg newCmd )

                _ ->
                    ( model, Cmd.none )

        WidgetContainerMsg widgetContainerMsg ->
            ( { content = model.content, widgetContainer = WidgetContainer.update widgetContainerMsg model.widgetContainer }, Cmd.none )


updateWidgetContainers : List Model -> WidgetContainer.Msg -> List Model
updateWidgetContainers guiElements containerMsg =
    let
        colSpaceLeft =
            colSpanLeft guiElements containerMsg
    in
    case containerMsg of
        WidgetContainer.AppendGridColMsg widgetContainerId ->
            if colSpaceLeft > 0 then
                guiElements
                    |> List.map
                        (\e -> { content = e.content, widgetContainer = WidgetContainer.update containerMsg e.widgetContainer })

            else
                guiElements

        -- Todo fetch data ...
        WidgetContainer.PositionDataReceivedMsg sth ->
            guiElements



-- Helper functions


getContainerInGuiElements : List Model -> WidgetContainerId -> Maybe WidgetContainer.Model
getContainerInGuiElements guiElements widgetContainerId =
    let
        containers =
            guiElements
                |> List.map .widgetContainer
    in
    getContainerById containers widgetContainerId


getContainerById : List WidgetContainer.Model -> WidgetContainerId -> Maybe WidgetContainer.Model
getContainerById containers widgetContainerId =
    let
        filtered =
            containers
                |> List.filter (\c -> c.id == widgetContainerId)
    in
    List.head filtered


colSpanLeft : List Model -> WidgetContainer.Msg -> Int
colSpanLeft guiElements containerMsg =
    Struct.pageCanvas.colSpanMax
        + 1
        - (case containerMsg of
            WidgetContainer.AppendGridColMsg widgetContainerId ->
                let
                    container =
                        getContainerInGuiElements guiElements widgetContainerId
                in
                case container of
                    Just con ->
                        getPositionsInRow guiElements con.position.rowStart
                            |> colSpaceUsed

                    Nothing ->
                        0

            WidgetContainer.PositionDataReceivedMsg positionMsg ->
                0
          )


getPositionsInRow : List Model -> Int -> List GridPosition
getPositionsInRow widgets row =
    widgets
        |> List.map .widgetContainer
        |> List.map .position
        |> List.filter (\p -> p.rowStart <= row && p.rowEnd >= row)


colSpaceUsed : List GridPosition -> Int
colSpaceUsed gridPositions =
    gridPositions
        |> List.map
            (\p -> p.colEnd - p.colStart)
        |> List.sum


getPositionsInColumn : List Model -> Int -> List GridPosition
getPositionsInColumn widgets col =
    widgets
        |> List.map .widgetContainer
        |> List.map .position
        |> List.filter (\p -> p.colStart <= col && p.colEnd >= col)


rowSpaceUsed : List GridPosition -> Int
rowSpaceUsed gridPositions =
    gridPositions
        |> List.map
            (\p -> p.rowEnd - p.rowStart)
        |> List.sum


idToString : WidgetContainerId -> String
idToString widgetContainerId =
    case widgetContainerId of
        WidgetContainerId id ->
            fromInt id
