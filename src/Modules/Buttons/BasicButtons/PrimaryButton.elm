module Modules.Buttons.BasicButtons.PrimaryButton exposing (..)

import Util.CustomCss.CssColors exposing (CustomColor(..))
import Util.CustomCss.DaschTailwind as Dtw


primaryButtonClasses : String
primaryButtonClasses =
    Dtw.classList
        [ Dtw.text_white
        , Dtw.custom_bg Primary
        , Dtw.border_transparent
        , Dtw.onHover [ Dtw.custom_bg Secondary ]
        ]
