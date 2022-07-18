module Modules.Text.ProjectDescription exposing (..)

import Html exposing (Html, div, h2, h3, p, text)
import Html.Attributes exposing (class, style)
import Html.Events exposing (onClick)
import Http
import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline exposing (required)
import Modules.Dividers.IconButtonDivider as IconButtonDivider
import RemoteData exposing (WebData)
import Shared.SharedTypes exposing (WidgetInstanceId(..))
import Util.CustomCss.DaschTailwind as Dtw
import Util.Icon as Icon


type alias Model =
    { isOpen : Bool
    , data : WebData WidgetData
    , id : WidgetInstanceId
    }


type alias WidgetData =
    { text : String
    , title : String
    , subtitle : String
    }


type Msg
    = Clicked WidgetInstanceId
    | FetchWidgetData WidgetInstanceId
    | WidgetDataReceived (WebData WidgetData)


init : WidgetInstanceId -> ( Model, Cmd Msg )
init wid =
    ( { isOpen = False, data = RemoteData.Loading, id = wid }, fetchData wid )


fetchData : WidgetInstanceId -> Cmd Msg
fetchData _ =
    Http.get
        { url = "http://localhost:2023/projectDescription/"
        , expect =
            dataDecoder
                |> Http.expectJson (RemoteData.fromResult >> WidgetDataReceived)
        }


dataDecoder : Decoder WidgetData
dataDecoder =
    Decode.succeed WidgetData
        |> required "text" Decode.string
        |> required "subtitle" Decode.string
        |> required "title" Decode.string


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
                title =
                    div []
                        [ div [ class (Dtw.classList [ Dtw.mx_auto, Dtw.text_base, Dtw.max_w_prose ]) ]
                            [ div []
                                [ if data.subtitle /= "" then
                                    h2 [ class (Dtw.classList [ Dtw.text_base, Dtw.text_gray_600, Dtw.font_semibold, Dtw.tracking_wide, Dtw.uppercase ]) ] [ text data.subtitle ]

                                  else
                                    text ""
                                , if data.text /= "" then
                                    h3 [ class (Dtw.classList [ Dtw.mt_2, Dtw.text_3xl, Dtw.leading_8, Dtw.font_extrabold, Dtw.tracking_tight, Dtw.text_gray_900, Dtw.sm [ Dtw.text_4xl ] ]) ] [ text data.title ]

                                  else
                                    text ""
                                ]
                            ]
                        ]
            in
            if model.isOpen then
                div []
                    [ title
                    , div
                        [ class (Dtw.classList [ Dtw.mt_6, Dtw.prose, Dtw.prose_indigo, Dtw.prose_lg, Dtw.text_gray_500, Dtw.mx_auto, Dtw.max_w_prose ]) ]
                        [ p [ style "padding-bottom" "1%" ] [ text data.text ] ]
                    , IconButtonDivider.view { buttonAttrs = [ onClick (Clicked model.id) ], icon = Icon.PlusSm, text = "Read Less" }
                    ]

            else
                div []
                    [ title
                    , div
                        [ class (Dtw.classList [ Dtw.mt_6, Dtw.prose, Dtw.prose_indigo, Dtw.prose_lg, Dtw.text_gray_500, Dtw.mx_auto, Dtw.max_w_prose ]) ]
                        [ p
                            [ style "overflow" "hidden"
                            , style "text-overflow" "ellipsis"
                            , style "display" "-webkit-box"
                            , style "-webkit-line-clamp" "6"
                            , style "line-clamp" "6"
                            , style "-webkit-box-orient" "vertical"
                            , style "padding-bottom" "0.5%"
                            ]
                            [ text data.text ]
                        ]

                    -- Don't use api to avoid circularities
                    , IconButtonDivider.view { buttonAttrs = [ onClick (Clicked model.id) ], icon = Icon.PlusSm, text = "Read More" }
                    ]

        RemoteData.Failure httpError ->
            div [] [ text "Failed" ]
        -- TODO: We need cleaner Error handling here

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Clicked id ->
            if id == model.id then
                case model.data of
                    RemoteData.Success _ ->
                        ( { model | isOpen = not model.isOpen }, Cmd.none )

                    _ ->
                        ( model, Cmd.none )

            else
                ( model, Cmd.none )

        FetchWidgetData wid ->
            ( { model | data = RemoteData.Loading }, fetchData wid )

        WidgetDataReceived res ->
            ( { model | data = res }, Cmd.none )
