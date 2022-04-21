module Footer.ContactUs exposing (..)

import CustomCss.DaschTailwind as Dtw exposing (..)
import Html exposing (Html, div, text, a)
import Html.Attributes exposing (class, href)

type alias Model =
    { text : String
    , url : String
    }


view : Model -> Html msg
view model =
    div [ class "contact-us", class Dtw.text_blue_700 ] [ a [ href model.url ] [ text model.text ] ]