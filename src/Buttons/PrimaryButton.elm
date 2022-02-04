module Buttons.PrimaryButton exposing (..)

import Browser
import Css
import Css.Global
import Html.Styled as Html
import Html.Styled.Attributes as Attr
import Tailwind.Utilities as Tw
import VirtualDom
import Buttons.Shared exposing (Size(..))

type alias Model =
    { size : Size
    , text : String
    }


main : Program () Model msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


initialModel : Model
initialModel =
    { size = Normal
    , text = "Primary Button"
    }


init : () -> ( Model, Cmd msg )
init _ =
    ( initialModel, Cmd.none )


baseButton : List Css.Style
baseButton =
    [ Tw.inline_flex
    , Tw.items_center
    , Tw.border
    , Tw.border_transparent
    , Tw.font_medium
    , Tw.rounded
    , Tw.shadow_sm
    , Tw.text_white
    , Tw.bg_indigo_600
    , Css.focus
        [ Tw.outline_none
        , Tw.ring_2
        , Tw.ring_offset_2
        , Tw.ring_indigo_500
        ]
    , Css.hover
        [ Tw.bg_indigo_700 ]
    ]


view : Model -> VirtualDom.Node msg
view model =
    let
        btnStyle =
            case model.size of
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
    in
    Html.toUnstyled <|
        Html.button
            [ Attr.type_ "button"
            , Attr.css (btnStyle ++ baseButton)
            ]
            [ Html.text model.text
            , Css.Global.global Tw.globalStyles
            ]


update : msg -> Model -> ( Model, Cmd msg )
update _ model =
    ( model, Cmd.none )


subscriptions : Model -> Sub msg
subscriptions _ =
    Sub.none
