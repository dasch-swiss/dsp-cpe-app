module BlueBoxes.WidgetContainer exposing (..)

import BlueBoxes.PageStructureModel as Struct
import Html exposing (Html)
import Html.Events exposing (onClick)
import Http
import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline exposing (required)
import Modules.Dividers.IconButtonDivider as IconButton
import RemoteData exposing (WebData)
import Shared.SharedTypes as Shared exposing (AlignSelf(..), JustifySelf(..), WidgetContainerId(..))
import Util.Icon as Icon


type alias WebModel =
    { position : WebData GridPosition -- the position in the grid
    , justifySelf : JustifySelf
    , alignSelf : AlignSelf
    }


type alias Model =
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
    = AppendGridColMsg Shared.WidgetContainerId
    | PositionDataReceivedMsg (WebData GridPosition)


type WidgetContainerMsg
    = WidgetContainerMsg Msg


increaseButton : WidgetContainerId -> Html Msg
increaseButton widgetId =
    IconButton.view
        { buttonAttrs =
            [ onClick (AppendGridColMsg widgetId)
            ]
        , icon = Icon.PlusSm
        , text = ""
        }



--Api.trailingIconButton { attrs = [ onClick (AppendGridColMsg widgetId) ], size = Shared.TrailingSmall, text = "increase me", icon = Icon.Plus }
-- |> Html.map AppendGridColMsg
--| AppendGridRow
--| AppendWidget
--| FetchContainerData WidgetContainerId


init : WidgetContainerId -> Model
init widgetContainerId =
    let
        filtered =
            List.filter (\w -> w.id == widgetContainerId) fakeWidgets
    in
    case List.head filtered of
        Just widgetContainer ->
            widgetContainer

        Nothing ->
            default


update : Msg -> Model -> Model
update msg model =
    let
        _ =
            Debug.log "Value of a: " msg
    in
    case msg of
        AppendGridColMsg widgetContainerId ->
            appendGridCol model widgetContainerId

        PositionDataReceivedMsg data ->
            model


appendGridCol : Model -> Shared.WidgetContainerId -> Model
appendGridCol model widgetContainerId =
    if widgetContainerId == model.id then
        let
            oldPosition =
                model.position

            newPosition =
                { oldPosition | colEnd = increaseColEnd oldPosition.colEnd }
        in
        { model | position = newPosition }

    else
        model


appendable : Int -> Bool
appendable colSpan =
    colSpan < Struct.pageCanvas.colSpanMax


increaseColEnd : Int -> Int
increaseColEnd end =
    if end < Struct.pageCanvas.colSpanMax + 1 && end < Struct.pageCanvas.colSpanMax + 1 then
        end + 1

    else
        end


fakeWidgets : List Model
fakeWidgets =
    [ { id = WidgetContainerId 1
      , position =
            { order = 1
            , rowStart = 1
            , rowEnd = 5
            , colStart = 1
            , colEnd = 4
            }
      , justifySelf = JustifyCenter
      , alignSelf = AlignCenter
      }
    , { id = WidgetContainerId 2
      , position =
            { order = 2
            , rowStart = 1
            , rowEnd = 1
            , colStart = 5
            , colEnd = 6
            }
      , justifySelf = JustifyCenter
      , alignSelf = AlignCenter
      }
    ]


default : Model
default =
    { id = WidgetContainerId 999
    , position =
        { order = 0
        , rowStart = 5
        , rowEnd = 8
        , colStart = 1
        , colEnd = 3
        }
    , justifySelf = JustifyCenter
    , alignSelf = AlignCenter
    }


init_from_data : WidgetContainerId -> ( WebModel, Cmd Msg )
init_from_data widgetID =
    ( { position = RemoteData.Loading
      , justifySelf = JustifyCenter
      , alignSelf = AlignCenter
      }
    , fetchData widgetID
    )


fetchData : WidgetContainerId -> Cmd Msg
fetchData _ =
    Http.get
        { url = "http://localhost:2023/widgetContainer/position/"
        , expect =
            dataDecoder
                |> Http.expectJson (RemoteData.fromResult >> PositionDataReceivedMsg)
        }


dataDecoder : Decoder GridPosition
dataDecoder =
    Decode.succeed GridPosition
        |> required "order" Decode.int
        |> required "rowStart" Decode.int
        |> required "rowEnd" Decode.int
        |> required "colStart" Decode.int
        |> required "colEnd" Decode.int
