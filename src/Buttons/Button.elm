module Buttons.Button exposing (..)

import Browser
import Css
import Css.Global
import Html.Styled as Html
import Html.Styled.Attributes as Attr
import Tailwind.Utilities as Tw
import VirtualDom
import Html.Events
import Buttons.PrimaryButton exposing (primaryButton)
import Buttons.SecondaryButton exposing (secondaryButton)
import Buttons.WhiteButton exposing (whiteButton)


main : Program () (Variant, Size, String) msg
main =
    Browser.element
        { init = init
        , view = cpeButton
        , update = update
        , subscriptions = subscriptions
        }


initialModel : (Variant, Size, String)
initialModel = (Primary, Normal, "")


init : () -> ( (Variant, Size, String), Cmd msg )
init _ =
    ( initialModel, Cmd.none )


getVariant: Variant ->  List Css.Style
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

renderSize : Size -> List Css.Style
renderSize size =
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

{- View named Button -}
cpeButton : (Variant, Size, String)-> VirtualDom.Node msg
cpeButton (variant, size, text) =
    Html.toUnstyled <|
        Html.button
            [ Attr.type_ "button"
            , Attr.css (renderSize size ++ getVariant variant)
            ]
            [ Html.text text
            , Css.Global.global Tw.globalStyles
            ]


update : msg -> (Variant, Size, String) -> ( (Variant, Size, String), Cmd msg )
update _ (var, size, text) =
    ( (var, size, text), Cmd.none )


subscriptions : (Variant, Size, String) -> Sub msg
subscriptions _ =
    Sub.none
