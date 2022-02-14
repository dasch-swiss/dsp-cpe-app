module Buttons.LeadingIconButton exposing (..)

import Browser
import Css
import Css.Global
import Html.Styled as Styled
import Html.Styled.Attributes as Attr
import Heroicons.Solid
import Tailwind.Utilities as Tw
import VirtualDom
type Size
    = Small
    | Normal
    | Large
    | ExtraLarge

type ButtonType
    = Button
    | Submit
    | Reset

type alias Model =
    { size : Size
    , text : String
    , icon : Icon
    }

type Icon
    = EmojiHappy
    | Annotation
    | Plus
    | Check

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
    , text = "Default"
    , icon = EmojiHappy
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
        svgStyle =
            case model.size of
               
                Small ->
                    [ Tw.neg_ml_1 
                    , Tw.mr_2
                    , Tw.h_4
                    , Tw.w_4
                    ]

                Normal ->
                    [ Tw.neg_ml_1 
                    , Tw.mr_2
                    , Tw.h_5
                    , Tw.w_5
                    ]

                Large ->
                    [ Tw.neg_ml_1 
                    , Tw.mr_3
                    , Tw.h_5
                    , Tw.w_5
                    ]

                ExtraLarge ->
                    [ Tw.neg_ml_1 
                    , Tw.mr_3
                    , Tw.h_5
                    , Tw.w_5
                    ]
        iconMethod =
            case model.icon of
                EmojiHappy ->
                    Heroicons.Solid.emojiHappy []
                Annotation ->
                    Heroicons.Solid.annotation []
                Plus ->
                    Heroicons.Solid.plus []
                Check ->
                    Heroicons.Solid.check []
    in
    Styled.toUnstyled <|
        Styled.button
            [ Attr.type_ "button"
            , Attr.css (btnStyle ++ baseButton)
            ]
            [ Styled.span [Attr.css svgStyle ] [Styled.fromUnstyled <| iconMethod]
            , Styled.text model.text
            , Css.Global.global Tw.globalStyles
            ]
update : msg -> Model -> ( Model, Cmd msg )
update _ model =
    ( model, Cmd.none )


subscriptions : Model -> Sub msg
subscriptions _ =
    Sub.none
