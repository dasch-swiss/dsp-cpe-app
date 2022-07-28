module BlueBoxes.GuiElement exposing (..)

import BlueBoxes.PageStructureModel as Struct
import BlueBoxes.WidgetContainer as WidgetContainer
import DspCpeApi exposing (circularButton)
import Html exposing (Html, div)
import Html.Attributes exposing (class, id)
import Html.Events exposing (onClick)
import List exposing (range)
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


renderGuiElements : List Model -> Bool -> List (Html Msg)
renderGuiElements widgets editModeOn =
    widgets
        |> List.map
            (\n ->
                view n editModeOn
            )


view : Model -> Bool -> Html Msg
view model editing =
    div
        [ id (idToString model.widgetContainer.id)
        , class (Dtw.custom_grid_col_start model.widgetContainer.position.colStart)
        , class (Dtw.custom_grid_col_end model.widgetContainer.position.colEnd)
        , class (Dtw.custom_grid_row_start model.widgetContainer.position.rowStart)
        , class (Dtw.custom_grid_row_end model.widgetContainer.position.rowEnd)
        ]
        [ if editing then
            editorGrid model

          else
            div [ class "flex-auto" ] [ contentView model ]
        ]


editorGrid : Model -> Html Msg
editorGrid model =
    div []
        [ div [ class "flex", class "justify-center" ]
            [ circularButton
                { attrs =
                    [ onClick (WidgetContainer.AppendGridColMsg model.widgetContainer.id)
                    ]
                , size = CircularExtraSmall
                , icon = Icon.PlusSm
                }
            ]
            |> Html.map WidgetContainerMsg
        , div [ class "flex" ]
            [ div [ class "self-center" ]
                [ div [ class "self-center" ]
                    [ circularButton
                        { attrs =
                            [ onClick (WidgetContainer.AppendGridColMsg model.widgetContainer.id)
                            ]
                        , size = CircularExtraSmall
                        , icon = Icon.PlusSm
                        }
                    ]
                    |> Html.map WidgetContainerMsg
                ]
            , div [ class "flex-auto" ] [ contentView model ]
            , div [ class "self-center" ]
                [ circularButton
                    { attrs =
                        [ onClick (WidgetContainer.AppendGridColMsg model.widgetContainer.id)
                        ]
                    , size = CircularExtraSmall
                    , icon = Icon.PlusSm
                    }
                , circularButton
                    { attrs =
                        [ onClick (WidgetContainer.SliceGridColMsg model.widgetContainer.id)
                        ]
                    , size = CircularExtraSmall
                    , icon = Icon.MinusSm
                    }
                ]
                |> Html.map WidgetContainerMsg
            ]
        , div [ class "flex", class "justify-center" ]
            [ circularButton
                { attrs =
                    [ onClick (WidgetContainer.AppendGridColMsg model.widgetContainer.id)
                    ]
                , size = CircularExtraSmall
                , icon = Icon.PlusSm
                }
            ]
            |> Html.map WidgetContainerMsg
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

        WidgetContainerMsg wMsg ->
            ( model, Cmd.none )



-- not updating here


updateWidgetContainers : WidgetContainer.Msg -> List Model -> ( List Model, Cmd Msg )
updateWidgetContainers containerMsg guiElements =
    case containerMsg of
        WidgetContainer.AppendGridColMsg widgetContainerId ->
            if isAppendable guiElements widgetContainerId then
                let
                    _ =
                        Debug.log "expandable: " id
                in
                let
                    gElements =
                        guiElements
                            |> List.map
                                (\e -> { content = e.content, widgetContainer = WidgetContainer.update containerMsg e.widgetContainer })
                in
                ( gElements, Cmd.none )

            else
                let
                    _ =
                        Debug.log "not expandable: " id
                in
                ( guiElements, Cmd.none )

        WidgetContainer.SliceGridColMsg widgetContainerId ->
            let
                gElements =
                    guiElements
                        |> List.map
                            (\e -> { content = e.content, widgetContainer = WidgetContainer.update containerMsg e.widgetContainer })
            in
            ( gElements, Cmd.none )

        -- Todo fetch data ...
        WidgetContainer.PositionDataReceivedMsg sth ->
            ( guiElements, Cmd.none )


isAppendable : List Model -> Shared.WidgetContainerId -> Bool
isAppendable guiElements id =
    let
        container =
            getContainerInGuiElements guiElements id
    in
    case container of
        Just con ->
            isExpandable guiElements con.position (con.position.colEnd + 1)

        Nothing ->
            False



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


isExpandable : List Model -> GridPosition -> Int -> Bool
isExpandable guiElements gridPosition targetColumn =
    let
        positionsInRowRange =
            getPositionsInRowRange guiElements gridPosition.rowStart gridPosition.rowEnd
    in
    gridColumnUnused targetColumn positionsInRowRange && colwithinCanvas targetColumn


colRangewithinCanvas : Int -> Int -> Bool
colRangewithinCanvas start end =
    colwithinCanvas start && colwithinCanvas end


colwithinCanvas : Int -> Bool
colwithinCanvas targetCol =
    targetCol > 0 && targetCol <= Struct.pageCanvas.colSpanMax + 1


getPositionsInRowRange : List Model -> Int -> Int -> List GridPosition
getPositionsInRowRange widgets rowStart rowEnd =
    widgets
        |> List.map .widgetContainer
        |> List.map .position
        |> List.filter (\p -> p.rowStart <= rowEnd && rowStart >= p.rowEnd)


getPositionsInColRange : List Model -> Int -> Int -> List GridPosition
getPositionsInColRange widgets colStart colEnd =
    widgets
        |> List.map .widgetContainer
        |> List.map .position
        |> List.filter (\p -> p.colStart <= colEnd && colStart >= p.colEnd)


gridColumnUnused : Int -> List GridPosition -> Bool
gridColumnUnused targetColumn positions =
    -- Checks if a grid item is not yet used by any of the given positions
    let
        widgetsOnGridItem =
            -- if the targetColumn is within the range of another widgets position
            List.filter
                (\p -> List.member targetColumn (gridRange p.colStart p.colEnd))
                positions
    in
    List.isEmpty widgetsOnGridItem


gridRange : Int -> Int -> List Int
gridRange start end =
    -- in a css grid content can stop at the same grid column where another widget starts and vice versa
    -- so the range of disallowed columns must be changed accordingly
    if end - 1 < start + 1 || end < start + 1 then
        range (start + 1) (start + 1)

    else
        range (start + 1) (end - 1)


getPositionsInColumn : List Model -> Int -> List GridPosition
getPositionsInColumn widgets col =
    widgets
        |> List.map .widgetContainer
        |> List.map .position
        |> List.filter (\p -> p.colStart <= col && p.colEnd >= col)


idToString : WidgetContainerId -> String
idToString widgetContainerId =
    case widgetContainerId of
        WidgetContainerId id ->
            fromInt id
