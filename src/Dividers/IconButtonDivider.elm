module Dividers.IconButtonDivider exposing (..)

import Browser
import Buttons.Button exposing (divider)
import Buttons.LeadingIconButton exposing (LeadingSize(..))
import CustomCss.DaschTailwind as Dtw
import Html exposing (Html, Attribute, div)
import Html.Attributes exposing (class)
import Icon
import String

main : Program () (Model msg) msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


type alias Model msg =
    { buttonAttrs : List (Attribute msg)
    , icon : Icon.Icon
    , text : String
    }


initialModel : Model msg
initialModel =
    { buttonAttrs = []
    , icon = Icon.PlusSm
    , text = ""
    }


init : () -> ( Model msg, Cmd msg )
init _ =
    ( initialModel, Cmd.none )


-- view : Model msg -> Html msg
-- view model =
--     HtmlStyled.toUnstyled <|
--         HtmlStyled.div
--             [ Attr.css [ Tw.relative ]
--             ]
--             [ HtmlStyled.div
--                 [ Attr.css [ Tw.absolute, Tw.inset_0, Tw.flex, Tw.items_center ] ]
--                 [ HtmlStyled.div [ Attr.css [ Tw.w_full, Tw.border_t, Tw.border_gray_300 ] ] [] ]
--             , HtmlStyled.div [ Attr.css [ Tw.relative, Tw.flex, Tw.justify_center ] ]
--                 [ HtmlStyled.fromUnstyled (divider model.buttonAttrs model.text model.icon) ]
--             ]

view : Model msg -> Html msg
view model =
    div
        [ class Dtw.relative ]
        [ div
            [ class ( String.join "" [ Dtw.absolute, Dtw.inset_0, Dtw.flex, Dtw.items_center ] ) ]
            [ div [ class ( String.join " " [ Dtw.w_full, Dtw.border_t, Dtw.border_gray_300 ] ) ] [] ]
        , div [ class ( String.join " " [ Dtw.relative, Dtw.flex, Dtw.justify_center ] ) ]
            [ divider model.buttonAttrs model.text model.icon ]
        ]


update : msg -> Model msg -> ( Model msg, Cmd msg )
update _ model =
    ( model, Cmd.none )


subscriptions _ =
    Sub.none
