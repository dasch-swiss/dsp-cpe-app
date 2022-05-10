module Modules.Footer.Licensing exposing (..)

import Html exposing (Html, div, img)
import Html.Attributes exposing (class, src)


type alias Model =
    { path : String }


view : Model -> Html msg
view model =
    div [ class "licensing" ] [ img [ src model.path ] [] ]
