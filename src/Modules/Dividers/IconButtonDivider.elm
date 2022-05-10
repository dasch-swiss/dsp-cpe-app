module Modules.Dividers.IconButtonDivider exposing (..)

import Html exposing (Attribute, Html, div)
import Html.Attributes exposing (class)
import Modules.Dividers.DividerButton as DividerButton
import Util.CustomCss.DaschTailwind as Dtw
import Util.Icon as Icon


type alias Model msg =
    { buttonAttrs : List (Attribute msg)
    , icon : Icon.Icon
    , text : String
    }


dividerButton : List (Attribute msg) -> String -> Icon.Icon -> Html msg
dividerButton attr text icon =
    DividerButton.view { attr = attr, text = text, icon = icon }


view : Model msg -> Html msg
view model =
    div
        [ class Dtw.relative ]
        [ div
            [ class (Dtw.classList [ Dtw.absolute, Dtw.inset_0, Dtw.flex, Dtw.items_center ]) ]
            [ div [ class (Dtw.classList [ Dtw.w_full, Dtw.border_t, Dtw.border_gray_300 ]) ] [] ]
        , div [ class (Dtw.classList [ Dtw.relative, Dtw.flex, Dtw.justify_center ]) ]
            [ dividerButton model.buttonAttrs model.text model.icon ]
        ]
