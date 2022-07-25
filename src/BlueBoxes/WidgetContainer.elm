module BlueBoxes.WidgetContainer exposing (..)

import DspCpeApi as Api
import Html exposing (Html, div, h3, text)
import Html.Attributes exposing (class, id)
import Html.Events exposing (onClick)
import Http
import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline exposing (required)
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
    = AppendGridCol Shared.WidgetContainerId
    | PositionDataReceived (WebData GridPosition)



--increaseButton : Html (WidgetContainerId -> GuiElementVariant -> Msg)


increaseButton widgetId =
    Api.trailingIconButton { attrs = [ onClick (AppendGridCol widgetId) ], size = Shared.TrailingSmall, text = "increase me", icon = Icon.Plus }



--| AppendGridRow
--| AppendWidget
--| FetchContainerData WidgetContainerId


type GuiElementVariant
    = ProjectDescriptionElement
    | AccordionElement


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
    case msg of
        AppendGridCol widgetContainerId ->
            appendGridCol model widgetContainerId

        PositionDataReceived data ->
            model


appendGridCol : Model -> Shared.WidgetContainerId -> Model
appendGridCol model widgetContainerId =
    if widgetContainerId == model.id then
        let
            oldPosition =
                model.position

            newPosition =
                { oldPosition | colEnd = increaseColEnd oldPosition.colEnd 8 }
        in
        { model | position = newPosition }

    else
        model


increaseColEnd : Int -> Int -> Int
increaseColEnd end maxEnd =
    if end < maxEnd && end < 8 then
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
            , colEnd = 5
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
