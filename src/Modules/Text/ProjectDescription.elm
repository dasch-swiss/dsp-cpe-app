module Modules.Text.ProjectDescription exposing (..)

import Html exposing (Html, div, h2, h3, p, text)
import Html.Attributes exposing (class, style)
import Html.Events exposing (onClick)
import Modules.Dividers.IconButtonDivider as IconButtonDivider
import Shared.SharedTypes exposing (WidgetInstanceId(..))
import Util.CustomCss.DaschTailwind as Dtw
import Util.Icon as Icon


type alias Model =
    { isOpen : Bool
    , text : String
    , title : String
    , subtitle : String
    , id : WidgetInstanceId
    }


type Msg
    = Show WidgetInstanceId
    | Hide WidgetInstanceId


view : Model -> Html Msg
view model =
    let
        title =
            div []
                [ div [ class (Dtw.classList [ Dtw.mx_auto, Dtw.text_base, Dtw.max_w_prose ]) ]
                    [ div []
                        [ if model.subtitle /= "" then
                            h2 [ class (Dtw.classList [ Dtw.text_base, Dtw.text_gray_600, Dtw.font_semibold, Dtw.tracking_wide, Dtw.uppercase ]) ] [ text model.subtitle ]

                          else
                            text ""
                        , if model.text /= "" then
                            h3 [ class (Dtw.classList [ Dtw.mt_2, Dtw.text_3xl, Dtw.leading_8, Dtw.font_extrabold, Dtw.tracking_tight, Dtw.text_gray_900, Dtw.sm [ Dtw.text_4xl ] ]) ] [ text model.title ]

                          else
                            text ""
                        ]
                    ]
                ]
    in
    if model.isOpen then
        div []
            [ title
            , div
                [ class (Dtw.classList [ Dtw.mt_6, Dtw.prose, Dtw.prose_indigo, Dtw.prose_lg, Dtw.text_gray_500, Dtw.mx_auto, Dtw.max_w_prose ]) ]
                [ p [ style "padding-bottom" "1%" ] [ text model.text ] ]
            , IconButtonDivider.view { buttonAttrs = [ onClick (Hide model.id) ], icon = Icon.PlusSm, text = "Read Less" }
            ]

    else
        div []
            [ title
            , div
                [ class (Dtw.classList [ Dtw.mt_6, Dtw.prose, Dtw.prose_indigo, Dtw.prose_lg, Dtw.text_gray_500, Dtw.mx_auto, Dtw.max_w_prose ]) ]
                [ p
                    [ style "overflow" "hidden"
                    , style "text-overflow" "ellipsis"
                    , style "display" "-webkit-box"
                    , style "-webkit-line-clamp" "6"
                    , style "line-clamp" "6"
                    , style "-webkit-box-orient" "vertical"
                    , style "padding-bottom" "0.5%"
                    ]
                    [ text model.text ]
                ]

            -- Don't use api to avoid circularities
            , IconButtonDivider.view { buttonAttrs = [ onClick (Show model.id) ], icon = Icon.PlusSm, text = "Read More" }
            ]


update : Msg -> Model -> Model
update msg model =
    case msg of
        Show id ->
            if id == model.id then
                { model | isOpen = True }

            else
                model

        Hide id ->
            if id == model.id then
                { model | isOpen = False }

            else
                model
