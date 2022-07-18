module Modules.Text.Accordion exposing (..)

import Html exposing (Html, div, p, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import RemoteData exposing (WebData)
import Shared.SharedTypes exposing (AccordionSize(..), WidgetInstanceId(..))
import Util.CustomCss.CssColors exposing (CustomColor(..))
import Util.CustomCss.DaschTailwind as Dtw
import Util.Icon as Icon
import Http
import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline exposing (required)


type alias Model =
    { isOpen : Bool
    , data : WebData WidgetData
    , id : WidgetInstanceId
    }


type alias WidgetData =
    { text : String
    , size : AccordionSize
    }


type Msg
    = AccordionClicked WidgetInstanceId
    | FetchWidgetData WidgetInstanceId
    | WidgetDataReceived (WebData WidgetData)


init : WidgetInstanceId -> ( Model, Cmd Msg )
init wid =
    ( { isOpen = False, data = RemoteData.Loading, id = wid }, fetchData wid )


fetchData : WidgetInstanceId -> Cmd Msg
fetchData _ =
    Http.get
        { url = "http://localhost:2023/accordion/"
        , expect =
            dataDecoder
                |> Http.expectJson (RemoteData.fromResult >> WidgetDataReceived)
        }

dataDecoder : Decoder WidgetData
dataDecoder =
    Decode.succeed WidgetData
        |> required "text" Decode.string
        |> required "size" accordionSizeDecoder


accordionSizeDecoder : Decoder AccordionSize
accordionSizeDecoder =
    Decode.string |> Decode.andThen (fromResult << parseSize)


fromResult : Result String a -> Decoder a
fromResult result =
  case result of
    Ok a -> Decode.succeed a
    Err errorMessage -> Decode.fail errorMessage


parseSize : String -> Result String AccordionSize
parseSize string =
    case string of
        "Full" ->
            Result.Ok FullWidth
        
        "Half" ->
            Result.Ok HalfWidth

        _ ->
            Result.Err ("Invalid width: " ++ string)

view : Model -> Html Msg
view model =
    case model.data of
        RemoteData.NotAsked ->
            text ""
        
        -- skeleton loading
        RemoteData.Loading ->
            div [] [ text "Loading..." ]

        RemoteData.Success data ->
            let
                accordionSize =
                    case data.size of
                        HalfWidth ->
                            Dtw.w_6_slash_12

                        FullWidth ->
                            Dtw.w_full

                accordionHeaderClasses =
                    if model.isOpen then
                        Dtw.classList
                            [ Dtw.rounded_lg
                            , Dtw.border_2
                            , Dtw.cursor_pointer
                            , Dtw.custom_bg Secondary
                            , Dtw.custom_border Secondary
                            ]

                    else
                        Dtw.classList
                            [ Dtw.rounded_lg
                            , Dtw.border_2
                            , Dtw.cursor_pointer
                            , Dtw.custom_border Primary
                            ]

                accordionHeaderTextClasses =
                    if model.isOpen then
                        Dtw.classList [ Dtw.p_2, Dtw.pl_3, Dtw.custom_text White ]

                    else
                        Dtw.classList [ Dtw.p_2, Dtw.pl_3, Dtw.custom_text Primary ]

                accordionContentClasses =
                    if model.isOpen then
                        Dtw.classList [ Dtw.block, Dtw.w_11_slash_12, Dtw.mx_auto ]

                    else
                        Dtw.hidden

                icon =
                    if model.isOpen then
                        Icon.getHtml Icon.MinusCircle

                    else
                        Icon.getHtml Icon.PlusCircle

                iconColor =
                    if model.isOpen then
                        Dtw.custom_text White

                    else
                        Dtw.custom_text Primary

                iconClasses =
                    Dtw.classList
                        [ Dtw.ml_2
                        , Dtw.h_4
                        , Dtw.w_4
                        , Dtw.mt_3
                        , iconColor
                        ]
            in
            div [ class accordionSize ]
                [ div
                    [ class accordionHeaderClasses, onClick (AccordionClicked model.id) ]
                    [ div [ class (Dtw.classList [ Dtw.inline_flex ]) ]
                        [ div [ class iconClasses ] [ icon ]
                        , div [ class accordionHeaderTextClasses ] [ text "Annotations" ]
                        ]
                    ]
                , div [ class accordionContentClasses ] [ p [] [ text data.text ] ]
                ]

        RemoteData.Failure httpError ->
            div [] [ text "Failed" ]
        -- TODO: We need cleaner error handling here

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        AccordionClicked id ->
            if id == model.id then
                case model.data of
                    RemoteData.Success _ ->
                        ({ model | isOpen = not model.isOpen }, Cmd.none)

                    _ ->
                        (model, Cmd.none)
            else
                (model, Cmd.none)

        FetchWidgetData wid ->
            ( { model | data = RemoteData.Loading }, fetchData wid )

        WidgetDataReceived res ->
            ( { model | data = res }, Cmd.none )