module Buttons.Button exposing (..)

import Html exposing (Html)
import Buttons.CircularButton as CircularButton
import Buttons.Shared exposing (Size(..))

circular : Size -> String -> Html msg
circular size icon =  
    CircularButton.view {size = size, icon = icon}
