module Buttons.BasicButtons.PrimaryButton exposing (..)

import CustomCss.DaschTailwind as Dtw


primaryButtonClasses : String
primaryButtonClasses =
    Dtw.classList
        [ Dtw.text_white
        , Dtw.bg_indigo_600
        , Dtw.border_transparent
        , Dtw.hover Dtw.bg_indigo_700
        ]
