module Buttons.BasicButtons.BasicButton exposing (..)

import Buttons.BasicButtons.PrimaryButton exposing (primaryButtonClasses)
import Buttons.BasicButtons.SecondaryButton exposing (secondaryButtonClasses)
import Buttons.BasicButtons.WhiteButton exposing (whiteButtonClasses)
import CustomCss.DaschTailwind as Dtw
import Html exposing (Attribute, Html, button, text)
import Html.Attributes exposing (class)


type BasicButtonSize
    = BasicExtraSmall
    | BasicSmall
    | BasicNormal
    | BasicLarge
    | BasicExtraLarge


baseButtonClasses : String
baseButtonClasses =
    Dtw.classList
        [ Dtw.inline_flex
        , Dtw.items_center
        , Dtw.border
        , Dtw.font_medium
        , Dtw.rounded
        , Dtw.shadow_sm
        , Dtw.onFocus
            [ Dtw.outline_none
            , Dtw.ring_2
            , Dtw.ring_offset_2
            , Dtw.ring_indigo_500
            ]
        ]


getBtnSizeClasses : BasicButtonSize -> String
getBtnSizeClasses size =
    case size of
        BasicExtraSmall ->
            Dtw.classList
                [ Dtw.px_2_dot_5
                , Dtw.py_1_dot_5
                , Dtw.text_xs
                ]

        BasicSmall ->
            Dtw.classList
                [ Dtw.px_3
                , Dtw.py_2
                , Dtw.text_sm
                , Dtw.leading_4
                ]

        BasicNormal ->
            Dtw.classList
                [ Dtw.px_4
                , Dtw.py_2
                , Dtw.text_sm
                ]

        BasicLarge ->
            Dtw.classList
                [ Dtw.px_4
                , Dtw.py_2
                , Dtw.text_base
                ]

        BasicExtraLarge ->
            Dtw.classList
                [ Dtw.px_6
                , Dtw.py_3
                , Dtw.text_base
                ]


type alias BasicButtonModel msg =
    { attrs : List (Attribute msg) -- onClick disable and all other events as well as custom attributes
    , text : String
    , size : BasicButtonSize
    , variant : Variant
    }



-- convenience function: Constructs the Buttonmodel and passes it into view; returns the view


basicButton : List (Attribute msg) -> String -> BasicButtonSize -> Variant -> Html msg
basicButton attributes text size variant =
    view { attrs = attributes, text = text, size = size, variant = variant }


type Variant
    = Primary
    | Secondary
    | White


getVariantClasses : Variant -> String
getVariantClasses variant =
    case variant of
        Primary ->
            primaryButtonClasses

        Secondary ->
            secondaryButtonClasses

        White ->
            whiteButtonClasses


view : BasicButtonModel msg -> Html msg
view b =
    button
        (b.attrs
            ++ [ class (getBtnSizeClasses b.size)
               , class (getVariantClasses b.variant)
               , class baseButtonClasses
               ]
        )
        [ text b.text ]
