module Buttons.BasicButtons.SecondaryButton exposing (..)

import Css
import Tailwind.Utilities as Tw


secondaryButtonStyle : List Css.Style
secondaryButtonStyle =
    [ Tw.text_indigo_700
    , Tw.bg_indigo_100
    , Tw.border_transparent
    , Css.hover
        [ Tw.bg_indigo_200 ]
    ]

