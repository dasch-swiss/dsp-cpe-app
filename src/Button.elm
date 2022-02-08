module Button exposing (..)

import Html exposing (Html)
import Buttons.CircularButton as CircularButton
import Buttons.Types exposing (Size)

circular : Size -> String -> Html msg
circular size icon =  
    CircularButton.view size icon
 