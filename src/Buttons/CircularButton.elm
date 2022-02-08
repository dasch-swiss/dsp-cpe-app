module Buttons.CircularButton exposing (..)

import Css
import Css.Global
import Heroicons.Solid
-- import Html as Html
import Html.Styled as HtmlStyled
import Html.Styled.Attributes as Attr
import Tailwind.Utilities as Tw
import VirtualDom
import Buttons.Types as Btn exposing ( Size )


type alias Model =
    { size : Size
    , icon : String
    }


initialModel : Model
initialModel =
    { size = Btn.Small
    , icon = "plus"
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
    , Tw.rounded_full
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
        [ Tw.bg_indigo_700
        ]
    ]


view : Size -> String -> VirtualDom.Node msg
view size icon =
    let
        btnSize =
            case size of
                Btn.ExtraSmall ->
                    [ Tw.p_1 ]

                Btn.Small ->
                    [ Tw.p_1_dot_5 ]

                Btn.Normal ->
                    [ Tw.p_2 ]

                Btn.Large ->
                    [ Tw.p_2 ]

                Btn.ExtraLarge ->
                    [ Tw.p_3 ]
        icnSize =
            if size == Btn.ExtraSmall || size == Btn.Small || size == Btn.Normal then
                [ Tw.h_5
                , Tw.w_5
                ]
            else
                [ Tw.h_6
                , Tw.w_6
                ]
    in
    HtmlStyled.toUnstyled <|
        HtmlStyled.button
            [ Attr.type_ "button"
            , Attr.css (btnSize ++ baseButton)
            ]
            [ HtmlStyled.span [Attr.css icnSize ] [HtmlStyled.fromUnstyled <| Heroicons.Solid.plus [ ]]
            , Css.Global.global Tw.globalStyles
            ]

