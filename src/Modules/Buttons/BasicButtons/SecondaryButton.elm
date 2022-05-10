module Modules.Buttons.BasicButtons.SecondaryButton exposing (..)

import Util.CustomCss.DaschTailwind as Dtw


secondaryButtonClasses : String
secondaryButtonClasses =
    Dtw.classList
        [ Dtw.text_indigo_700
        , Dtw.bg_indigo_100
        , Dtw.border_transparent
        , Dtw.onHover [ Dtw.bg_indigo_200 ]
        ]
