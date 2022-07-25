module BlueBoxes.WidgetContainer exposing (..)

import Http
import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline exposing (required)
import RemoteData exposing (WebData)
import Shared.SharedTypes as Shared exposing (AlignSelf(..), JustifySelf(..), WidgetContainerId(..))


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
    = AppendGrid
    | FetchContainerData WidgetContainerId
    | PositionDataReceived (WebData GridPosition)


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
            , colEnd = 8
            }
      , justifySelf = JustifyCenter
      , alignSelf = AlignCenter
      }
    ]


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
                |> Http.expectJson (RemoteData.fromResult >> PositionDataReceived)
        }


dataDecoder : Decoder GridPosition
dataDecoder =
    Decode.succeed GridPosition
        |> required "order" Decode.int
        |> required "rowStart" Decode.int
        |> required "rowEnd" Decode.int
        |> required "colStart" Decode.int
        |> required "colEnd" Decode.int
