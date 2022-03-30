module Buttons.BasicButtons.WhiteButton exposing (..)

import Css
import CustomCss.DaschTailwind as Dtw
import String
import Tailwind.Utilities as Tw


whiteButtonStyle : List Css.Style
whiteButtonStyle =
    [ Tw.text_gray_700
    , Tw.bg_white
    , Tw.border_gray_300
    , Css.hover
        [ Tw.bg_gray_50 ]
    ]

whiteButtonClasses : String
whiteButtonClasses =
    String.join " "
        [ Dtw.text_gray_700
        , Dtw.bg_white
        , Dtw.border_gray_300
        , "hover:" ++ Dtw.bg_gray_50
        ]
