module Buttons.BasicButtons.PrimaryButton exposing (..)

import Css
import CustomCss.DaschTailwind as Dtw
import String
import Tailwind.Utilities as Tw


primaryButtonStyle : List Css.Style
primaryButtonStyle =
    [ Tw.text_white
    , Tw.bg_indigo_600
    , Tw.border_transparent
    , Css.hover
        [ Tw.bg_indigo_700 ]
    ]

primaryButtonClasses : String
primaryButtonClasses =
    String.join " "
        [ Dtw.text_white
        , Dtw.bg_indigo_600
        , Dtw.border_transparent
        , Dtw.hover Dtw.bg_indigo_700
        ]
