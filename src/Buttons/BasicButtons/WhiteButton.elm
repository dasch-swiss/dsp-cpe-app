module Buttons.BasicButtons.WhiteButton exposing (..)

import CustomCss.DaschTailwind as Dtw


whiteButtonClasses : String
whiteButtonClasses =
    Dtw.classList
        [ Dtw.text_gray_700
        , Dtw.bg_white
        , Dtw.border_gray_300
        , Dtw.hover Dtw.bg_gray_50
        ]
