module Buttons.BasicButtons.PrimaryButton exposing (..)

import CustomCss.DaschTailwind as Dtw
import String


primaryButtonClasses : String
primaryButtonClasses =
    String.join " "
        [ Dtw.text_white
        , Dtw.bg_indigo_600
        , Dtw.border_transparent
        , Dtw.hover Dtw.bg_indigo_700
        ]
