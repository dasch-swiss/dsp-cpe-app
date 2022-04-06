module Buttons.BasicButtons.PrimaryButton exposing (..)

import CustomCss.CssColors exposing (CustomColor(..))
import CustomCss.DaschTailwind as Dtw


primaryButtonClasses : String
primaryButtonClasses =
    Dtw.classList
        [ Dtw.text_white
        , Dtw.custom_bg Primary
        , Dtw.border_transparent
        , Dtw.onHover [ Dtw.custom_bg Secondary ]
        ]
