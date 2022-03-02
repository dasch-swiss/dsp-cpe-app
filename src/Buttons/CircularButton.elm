module Buttons.CircularButton exposing (..)

import Browser
import Buttons.Shared exposing (ButtonSize(..))
import Css
import Css.Global
import Heroicons.Solid
import Html exposing (Html)
import Html.Styled as HtmlStyled
import Html.Styled.Attributes as Attr
import Svg.Attributes exposing (..)
import Tailwind.Utilities as Tw
import VirtualDom


main : Program () ( ButtonSize, Html msg ) msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


initialModel : ( ButtonSize, Html msg )
initialModel =
    ( Normal, Heroicons.Solid.plus [] )


init : () -> ( ( ButtonSize, Html msg ), Cmd msg )
init _ =
    ( initialModel, Cmd.none )


circularButtonStyle : List Css.Style
circularButtonStyle =
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


view : ( ButtonSize, Html msg ) -> VirtualDom.Node msg
view ( size, icon ) =
    let
        btnSize =
            case size of
                ExtraSmall ->
                    [ Tw.p_1 ]

                Small ->
                    [ Tw.p_1_dot_5 ]

                ExtraLarge ->
                    [ Tw.p_3 ]

                -- Normal and Large
                _ ->
                    [ Tw.p_2 ]

        icnSize =
            if size == ExtraSmall || size == Small || size == Normal then
                [ Tw.h_5
                , Tw.w_5
                ]

            else
                [ Tw.h_6
                , Tw.w_6
                ]

        -- icnEle = if (Just icon == Maybe.Nothing) then Heroicons.Solid.plus [] else icon
    in
    HtmlStyled.toUnstyled <|
        HtmlStyled.button
            [ Attr.type_ "button"
            , Attr.class "circular-button"
            , Attr.css (btnSize ++ circularButtonStyle)
            ]
            [ HtmlStyled.span [ Attr.css icnSize ] [ HtmlStyled.fromUnstyled <| icon ]
            , Css.Global.global Tw.globalStyles
            ]


update : msg -> ( ButtonSize, Html msg ) -> ( ( ButtonSize, Html msg ), Cmd msg )
update _ ( size, text ) =
    ( ( size, text ), Cmd.none )


subscriptions : ( ButtonSize, Html msg ) -> Sub msg
subscriptions _ =
    Sub.none
