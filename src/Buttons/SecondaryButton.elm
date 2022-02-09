module Buttons.SecondaryButton exposing (..)
import Css
import Tailwind.Utilities as Tw

secondaryButton : List Css.Style
secondaryButton =
    [ Tw.inline_flex
    , Tw.items_center
    , Tw.border
    , Tw.border_transparent
    , Tw.font_medium
    , Tw.rounded
    , Tw.shadow_sm
    , Tw.text_indigo_700
    , Tw.bg_indigo_100
    , Css.focus
        [ Tw.outline_none
        , Tw.ring_2
        , Tw.ring_offset_2
        , Tw.ring_indigo_500
        ]
    , Css.hover
        [ Tw.bg_indigo_200 ]
    ]
