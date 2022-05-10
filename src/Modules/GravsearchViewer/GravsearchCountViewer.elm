-- This module is not ready for production. It is implemented in a very basic form


module Modules.GravsearchViewer.GravsearchCountViewer exposing (..)

import DspCpeApi exposing (primaryButton)
import Html exposing (Html, div, h3, text)
import Html.Events exposing (onClick)
import Http
import Json.Decode as Decode exposing (field, int, map)
import Shared.SharedTypes exposing (BasicButtonSize(..))
import Util.Error exposing (buildErrorMessage)


type alias Model =
    { query : String
    , result : Maybe Count
    , error : Maybe String
    }


type Msg
    = Fetch
    | Received (Result Http.Error Count)


type alias Count =
    { numberOfItems : Int }


decoder : Decode.Decoder Count
decoder =
    map Count
        (field "schema:numberOfItems" int)


fetchResult : Model -> Cmd Msg
fetchResult model =
    Http.post
        { url = "https://api.test.dasch.swiss/v2/searchextended/count"
        , body = Http.stringBody "text/plain" model.query
        , expect = Http.expectJson Received decoder
        }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Received (Ok count) ->
            ( { model | result = Just count }, Cmd.none )

        Received (Err err) ->
            ( { model | error = Just (buildErrorMessage err) }, Cmd.none )

        Fetch ->
            ( model, fetchResult model )



--Improve


view : Model -> Html Msg
view model =
    div []
        [ div [] [ text model.query ]
        , primaryButton [ onClick Fetch ] "Search" BasicLarge
        , viewRes model
        , viewError model.error
        ]


viewRes : Model -> Html msg
viewRes model =
    case model.result of
        Nothing ->
            text ""

        Just count ->
            div [] [ text ("Found " ++ String.fromInt count.numberOfItems ++ " matching resources") ]


viewError : Maybe String -> Html msg
viewError maybeError =
    case maybeError of
        Just error ->
            div []
                [ h3 [] [ text "ERROR" ]
                , text ("Error: " ++ error)
                ]

        Nothing ->
            text ""


subscriptions : Model -> Sub msg
subscriptions _ =
    Sub.none
