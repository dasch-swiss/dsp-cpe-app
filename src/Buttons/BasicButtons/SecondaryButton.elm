module Buttons.BasicButtons.SecondaryButton exposing (..)

import CustomCss.DaschTailwind as Dtw
import String


secondaryButtonClasses : String
secondaryButtonClasses =
    String.join " "
        [ Dtw.text_indigo_700
        , Dtw.bg_indigo_100
        , Dtw.border_transparent
        , Dtw.hover Dtw.bg_indigo_200
        ]
