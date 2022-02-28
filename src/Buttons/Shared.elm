module Buttons.Shared exposing (..)

import Css
import Tailwind.Utilities as Tw

type ButtonSize
    = ExtraSmall
    | Small
    | Normal
    | Large
    | ExtraLarge


type ButtonType
    = Button
    | Submit
    | Reset


baseButton : List Css.Style
baseButton =
    [ Tw.inline_flex
    , Tw.items_center
    , Tw.border
    , Tw.font_medium
    , Tw.rounded
    , Tw.shadow_sm
    , Css.focus
        [ Tw.outline_none
        , Tw.ring_2
        , Tw.ring_offset_2
        , Tw.ring_indigo_500
        ]
    ]


renderBtnSize : ButtonSize -> List Css.Style
renderBtnSize size =
    case size of
        ExtraSmall ->
            [ Tw.px_2_dot_5
            , Tw.py_1_dot_5
            , Tw.text_xs
            ]

        Small ->
            [ Tw.px_3
            , Tw.py_2
            , Tw.text_sm
            , Tw.leading_4
            ]

        Normal ->
            [ Tw.px_4
            , Tw.py_2
            , Tw.text_sm
            ]

        Large ->
            [ Tw.px_4
            , Tw.py_2
            , Tw.text_base
            ]

        ExtraLarge ->
            [ Tw.px_6
            , Tw.py_3
            , Tw.text_base
            ]
