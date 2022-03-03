module Buttons.BasicButtons.WhiteButton exposing (..)

import Css
import Tailwind.Utilities as Tw


whiteButtonStyle : List Css.Style
whiteButtonStyle =
    [ Tw.text_gray_700
    , Tw.bg_white
    , Tw.border_gray_300
    , Css.hover
        [ Tw.bg_gray_50 ]
    ]
