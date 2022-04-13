module Footer.DaschCopyright exposing (..)

import Html exposing (Html, text)


type alias Model =
    { text : String }


view : Model -> Html msg
view model =
    text model.text
