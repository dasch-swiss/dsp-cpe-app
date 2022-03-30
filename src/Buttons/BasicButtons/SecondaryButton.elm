module Buttons.BasicButtons.SecondaryButton exposing (..)

import Css
import CustomCss.DaschTailwind as Dtw
import String
import Tailwind.Utilities as Tw


secondaryButtonStyle : List Css.Style
secondaryButtonStyle =
    [ Tw.text_indigo_700
    , Tw.bg_indigo_100
    , Tw.border_transparent
    , Css.hover
        [ Tw.bg_indigo_200 ]
    ]

secondaryButtonClasses : String
secondaryButtonClasses =
    String.join " "
        [ Dtw.text_indigo_700
        , Dtw.bg_indigo_100
        , Dtw.border_transparent
        , Dtw.hover Dtw.bg_indigo_200
        ]
