module Footer.DaschCopyright exposing (..)

import Html exposing (Html, div, text)
import Html.Attributes exposing (class)

type alias Model =
    { text : String }


view : Model -> Html msg
view model =
    div [ class "copyright" ] [ text model.text ]
    
