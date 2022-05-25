module Modules.Buttons.BasicButtons.PrimaryButton exposing (..)

import Util.CustomCss.ColorSchema as CS exposing (SemanticColor(..))
import Util.CustomCss.DaschTailwind as Dtw


primaryButtonClasses : CS.Model -> String
primaryButtonClasses colors =
    Dtw.classList
        [ Dtw.text_white
        , Dtw.backgroundColor colors.primary
        , Dtw.border_transparent
        , Dtw.onHover [ Dtw.backgroundColor colors.secondary ]
        ]
