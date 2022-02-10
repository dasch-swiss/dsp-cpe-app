module Buttons.Button exposing (..)

-- import Html exposing (Html)
-- import Buttons.CircularButton as CircularButton
-- import Buttons.Shared exposing (Size(..))
-- circular : Size -> String -> Html msg
-- circular size icon =
--     CircularButton.view {size = size, icon = icon}

import Browser
-- import Buttons.CircularButton as Cb
import Buttons.PrimaryButton exposing (primaryButton)
import Buttons.SecondaryButton exposing (secondaryButton)
import Buttons.WhiteButton exposing (whiteButton)
import Css
import Css.Global
import Html
import Html.Styled as HtmlStyled
import Html.Styled.Attributes as Attr
import Tailwind.Utilities as Tw
import VirtualDom
import Heroicons.Solid

main : Program () ( Variant, Size, String ) msg
main =
    Browser.element
        { init = init
        , view = cpeButton
        , update = update
        , subscriptions = subscriptions
        }


initialModel : ( Variant, Size, String )
initialModel =
    ( Primary, Normal, "" )


init : () -> ( ( Variant, Size, String ), Cmd msg )
init _ =
    ( initialModel, Cmd.none )


getVariant : Variant -> List Css.Style
getVariant variant =
    case variant of
        Primary ->
            primaryButton

        Secondary ->
            secondaryButton

        White ->
            whiteButton


type Size
    = ExtraSmall
    | Small
    | Normal
    | Large
    | ExtraLarge


type Variant
    = Primary
    | Secondary
    | White


type ButtonType
    = Button
    | Submit
    | Reset


renderBtnSize : Size -> List Css.Style
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


renderIcnSize : Size -> List Css.Style
renderIcnSize size =
    if size == ExtraSmall || size == Small || size == Normal then
        [ Tw.h_5
        , Tw.w_5
        ]

    else
        [ Tw.h_6
        , Tw.w_6
        ]



{- View named Button -}


cpeButton : ( Variant, Size, String ) -> VirtualDom.Node msg
cpeButton ( variant, size, text ) =
    HtmlStyled.toUnstyled <|
        HtmlStyled.button
            [ Attr.type_ "button"
            , Attr.css (renderBtnSize size ++ getVariant variant)
            ]
            [ HtmlStyled.text text
            , Css.Global.global Tw.globalStyles
            ]



-- primary : Size -> String -> Html msg
-- primary size text =


-- circular : ( Size, String ) -> VirtualDom.Node msg
-- circular ( size, icon ) =
--     HtmlStyled.toUnstyled <|
--         HtmlStyled.button
--             [ Attr.type_ "button"
--             , Attr.css (renderBtnSize size ++ Cb.baseButton)
--             ]
--             [ HtmlStyled.span [ Attr.css (renderIcnSize size) ] [ HtmlStyled.fromUnstyled <| Heroicons.Solid.plus [] ]
--             , Css.Global.global Tw.globalStyles
--             ]

update : msg -> ( Variant, Size, String ) -> ( ( Variant, Size, String ), Cmd msg )
update _ ( var, size, text ) =
    ( ( var, size, text ), Cmd.none )


subscriptions : ( Variant, Size, String ) -> Sub msg
subscriptions _ =
    Sub.none
