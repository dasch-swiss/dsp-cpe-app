module Modules.Footer.ContactUs exposing (..)

import Html exposing (Html, a, div, text)
import Html.Attributes exposing (class, href)
import Util.CustomCss.DaschTailwind as Dtw exposing (..)


type alias Model =
    { text : String
    , url : String
    }


view : Model -> Html msg
view model =
    div [ class "contact-us", class Dtw.text_blue_700 ] [ a [ href model.url ] [ text model.text ] ]
