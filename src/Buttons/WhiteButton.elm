module Buttons.WhiteButton exposing (..)
import Css
import Tailwind.Utilities as Tw

whiteButton : List Css.Style
whiteButton =
    [ Tw.inline_flex
    , Tw.items_center
    , Tw.border
    , Tw.border_gray_300
    , Tw.font_medium
    , Tw.rounded
    , Tw.shadow_sm
    , Tw.text_gray_700
    , Tw.bg_white
    , Css.focus
        [ Tw.outline_none
        , Tw.ring_2
        , Tw.ring_offset_2
        , Tw.ring_indigo_500
        ]
    , Css.hover
        [ Tw.bg_gray_50 ]
    ]