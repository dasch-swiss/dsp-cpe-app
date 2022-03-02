module Projects.ListProjects exposing (..)

import Html exposing (Html, a, text)
import Html.Attributes exposing (href)


type alias Model =
    { foo : String }


type Msg
    = NoOp


init : ( Model, Cmd Msg )
init =
    ( { foo = "bar" }, Cmd.none )


view : Model -> Html Msg
view model =
    a [ href "/project/playground" ] [ text "Playground" ]


update : Msg -> Model -> ( Model, Cmd Msg )
update _ model =
    ( model, Cmd.none )


subscriptions : Model -> Sub msg
subscriptions _ =
    Sub.none
