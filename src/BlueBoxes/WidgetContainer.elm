module BlueBoxes.WidgetContainer exposing (..)

import Http
import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline exposing (required)
import RemoteData exposing (WebData)
import Shared.SharedTypes exposing (WidgetContainerId)


type alias Model =
    { position : WebData GridPosition -- the position in the grid
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


type Msg
    = AppendGrid
    | FetchContainerData WidgetContainerId
    | PositionDataReceived (WebData GridPosition)


init : WidgetContainerId -> ( Model, Cmd Msg )
init widgetID =
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
