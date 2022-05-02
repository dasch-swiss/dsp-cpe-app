module GravsearchViewer.GravsearchCountViewer exposing (..)

import Buttons.BasicButtons.BasicButton exposing (BasicButtonSize(..))
import Buttons.Button exposing (primaryButton)
import Debug
import Error exposing (buildErrorMessage)
import Html exposing (Html, div, h3, text)
import Html.Events exposing (onClick)
import Http
import Json.Decode as Decode exposing (field, int, map)
import Json.Decode.Pipeline exposing (required)
import Url.Parser exposing (query)


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
    let
        _ =
            Debug.log "Fetching with: " model
    in
    Http.post
        { url = "https://api.test.dasch.swiss/v2/searchextended/count"
        , body = Http.stringBody "text/plain" model.query
        , expect = Http.expectJson Received decoder
        }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    let
        _ =
            Debug.log "Updating with: " msg
    in
    case msg of
        Received (Ok count) ->
            ( { model | result = Just count }, Cmd.none )

        Received (Err err) ->
            ( { model | error = Just (buildErrorMessage err) }, Cmd.none )

        Fetch ->
            ( { model | result = Just { numberOfItems = -2 } }, fetchResult model )



--Improve


view : Model -> Html Msg
view model =
    div []
        [ div [] [ text model.query ]
        , primaryButton [ onClick Fetch ] "Search" BasicLarge
        , resView model
        , errorView model.error
        ]


resView : Model -> Html msg
resView model =
    case model.result of
        Nothing ->
            text ""

        Just count ->
            div [] [ text ("Found " ++ String.fromInt count.numberOfItems ++ " matching resources") ]


errorView : Maybe String -> Html msg
errorView maybeError =
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
