module Buttons.CircularButton exposing (..)

import Browser
import Buttons.Shared exposing (Size(..))
import Css
import Css.Global
import Heroicons.Solid
import Html exposing (Html)
import Html.Styled as HtmlStyled
import Html.Styled.Attributes as Attr
import Svg.Attributes exposing (..)
import Tailwind.Utilities as Tw
import VirtualDom


main : Program () ( Size, Html msg ) msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


initialModel : ( Size, Html msg )
initialModel =
    ( Normal, Heroicons.Solid.plus [] )


init : () -> ( ( Size, Html msg ), Cmd msg )
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


view : ( Size, Html msg ) -> VirtualDom.Node msg
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
            , Attr.css (btnSize ++ baseButton)
            ]
            [ HtmlStyled.span [ Attr.css icnSize ] [ HtmlStyled.fromUnstyled <| icon ]
            , Css.Global.global Tw.globalStyles
            ]


update : msg -> ( Size, Html msg ) -> ( ( Size, Html msg ), Cmd msg )
update _ ( size, text ) =
    ( ( size, text ), Cmd.none )


subscriptions : ( Size, Html msg ) -> Sub msg
subscriptions _ =
    Sub.none
