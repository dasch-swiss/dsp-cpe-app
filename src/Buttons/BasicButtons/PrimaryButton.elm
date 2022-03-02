module Buttons.BasicButtons.PrimaryButton exposing (..)

import Css
import Tailwind.Utilities as Tw


primaryButtonStyle : List Css.Style
primaryButtonStyle =
    [ Tw.text_white
    , Tw.bg_indigo_600
    , Tw.border_transparent
    , Css.hover
        [ Tw.bg_indigo_700 ]
    ]
