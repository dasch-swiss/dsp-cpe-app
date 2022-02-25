module RollbarService exposing (..)

import Browser
import Dict exposing (Dict)
import Html exposing (Html, button, div, input, text)
import Html.Attributes exposing (value)
import Html.Events exposing (onClick, onInput)
import Json.Encode
import Platform exposing (Task)
import Rollbar exposing (Rollbar)
import TailwindPlayground exposing (view)
import Task


token : String
token =
    "c01694ee3b104c5a93ee2eef1e1a085e"


rollbar : Rollbar
rollbar =
    Rollbar.scoped
        (Rollbar.token token)
        (Rollbar.codeVersion "0.0.1")
        (Rollbar.environment "DSP-CPE")
        "Example"


type alias Model =
    { report : String
    , level : Level
    }


initialModel : Model
initialModel =
    { report = ""
    , level = Debug_
    }



-- UPDATE --


type Msg
    = SetText String
    | NoOp
    | Send
    | SendCritical
    | SendDebug
    | SendError
    | SendInfo
    | SendWarning


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        SetText text ->
            ( { model | report = text }, Cmd.none )

        Send ->
            ( model, info model.report )
        
        SendCritical ->
            ( model, critical model.report )

        SendDebug ->
            ( model, debug model.report )

        SendError ->
            ( model, error model.report )

        SendInfo ->
            ( model, info model.report )

        SendWarning ->
            ( model, warning model.report )


type Level
    = Critical
    | Debug_
    | Error
    | Info
    | Warning



-- item : (Level -> String) -> Cmd Msg
-- item (lvl, report) =
--     case lvl of
--         Critical ->
--             Task.attempt (\_ -> NoOp) (rollbar.critical report Dict.empty)
--         Debug_ ->
--             Task.attempt (\_ -> NoOp) (rollbar.debug report Dict.empty)
--         Error ->
--             Task.attempt (\_ -> NoOp) (rollbar.error report Dict.empty)
--         Info ->
--             Task.attempt (\_ -> NoOp) (rollbar.info report Dict.empty)
--         Warning ->
--             Task.attempt (\_ -> NoOp) (rollbar.warning report Dict.empty)
-- let itemLevel =
--     case lvl of
--         Critical ->
--             rollbar.critical
--         Debug ->
--             rollbar.debug
--         Error ->
--             rollbar.error
--         Info ->
--             rollbar.info
--         Warning ->
--             rollbar.warning
-- in
--     Task.attempt (\_ -> NoOp) (itemLevel report Dict.empty)


critical : String -> Cmd Msg
critical report =
    Task.attempt (\_ -> NoOp) (rollbar.critical report Dict.empty)


debug : String -> Cmd Msg
debug report =
    Task.attempt (\_ -> NoOp) (rollbar.debug report Dict.empty)


error : String -> Cmd Msg
error report =
    Task.attempt (\_ -> NoOp) (rollbar.error report Dict.empty)


info : String -> Cmd Msg
info report =
    Task.attempt (\_ -> NoOp) (rollbar.info report Dict.empty)


warning : String -> Cmd Msg
warning report =
    Task.attempt (\_ -> NoOp) (rollbar.warning report Dict.empty)


json : Json.Encode.Value
json =
    Json.Encode.object [ ( "environment", Json.Encode.string "DSP-CPE" ) ]



-- VIEW --


view : Model -> Html Msg
view model =
    div []
        [ div []
            [ input [ onInput SetText, value model.report ] []
            -- , div [] [ button [ onClick Send ] [ text "Send to rollbar" ] ]
            , div [] [ button [ onClick SendCritical ] [ text "Send critical to rollbar" ] ]
            , div [] [ button [ onClick SendDebug ] [ text "Send debug to rollbar" ] ]
            , div [] [ button [ onClick SendError ] [ text "Send error to rollbar" ] ]
            , div [] [ button [ onClick SendInfo ] [ text "Send info to rollbar" ] ]
            , div [] [ button [ onClick SendWarning ] [ text "Send warning to rollbar" ] ]
            ]
        ]



-- INIT --


main : Program () Model Msg
main =
    Browser.document
        { init = \_ -> init
        , subscriptions = \_ -> Sub.none
        , update = update
        , view = \model -> { title = "Example", body = [ view model ] }
        }


init : ( Model, Cmd msg )
init =
    ( initialModel, Cmd.none )
