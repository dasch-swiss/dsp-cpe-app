module Util.CustomCss.ColorSchema exposing (Model, Msg(..), SemanticColor(..), colorize, update)


type SemanticColor
    = Background
    | Primary
    | Secondary


getColor : Model -> SemanticColor -> String
getColor model color =
    case color of
        Primary ->
            model.primary

        Secondary ->
            model.secondary

        Background ->
            model.background


type Msg
    = ColorSchemaMsg


type alias Model =
    { primary : String
    , secondary : String
    , background : String
    }


colors : Model
colors =
    { primary = "#1D4ED8"
    , secondary = "#130075"
    , background = "#FFFFFF"
    }


colorize : SemanticColor -> String
colorize color =
    getColor colors color


update : Msg -> Model -> Model
update msg model =
    let
        _ =
            Debug.log "New color model: " model
    in
    case msg of
        ColorSchemaMsg ->
            { model
                | primary = model.primary
                , secondary = model.secondary
                , background = model.background
            }
