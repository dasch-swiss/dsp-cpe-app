module Modules.Projects.Focus.Modules.Content exposing (..)

import Html exposing (Html, button, div, figcaption, figure, img, p, span, text)
import Html.Attributes exposing (alt, class, height, src, width)
import Html.Attributes.Aria exposing (ariaHidden)
import Html.Events exposing (onClick)
import Svg exposing (defs, path, pattern, rect, svg)
import Svg.Attributes as SvgAttr exposing (clipRule, d, fill, fillRule, id, patternUnits, viewBox, x, y)
import Util.CustomCss.ColorSchema exposing (SemanticColor(..))
import Util.CustomCss.DaschTailwind as Dtw


type alias Model =
    { contentBody : String
    , imagePath : String
    , imageAltText : String
    , isReadMoreOpen : Bool
    , datasetTitle : String
    }


type Msg
    = ReadMoreClicked
    | DatasetClicked


view : Model -> Html Msg
view model =
    let
        readMoreText =
            if model.isReadMoreOpen then
                "Read less"

            else
                "Read more"

        contentLineClampStyles =
            -- if the content is expanded, remove the css classes
            if model.isReadMoreOpen then
                Dtw.classList []
                -- else, add line clamp css
                -- also add largest tailwind max height class available because Safari doesn't handle line clamps on divs correctly

            else
                Dtw.classList [ Dtw.line_clamp_10, Dtw.max_h_96 ]

        image =
            -- if the image path is not an empty string, generate the html for the image
            if model.imagePath /= "" then
                div [ class (Dtw.classList [ Dtw.relative, Dtw.text_base, Dtw.mx_auto, Dtw.max_w_prose, Dtw.lg [ Dtw.max_w_none ] ]) ]
                    [ figure
                        []
                        [ div [ class (Dtw.classList [ Dtw.aspect_w_12, Dtw.aspect_h_7, Dtw.lg [ Dtw.aspect_none ] ]) ]
                            [ img
                                [ class (Dtw.classList [ Dtw.rounded_lg, Dtw.shadow_lg, Dtw.object_cover, Dtw.object_center ])
                                , src model.imagePath
                                , alt model.imageAltText
                                , width 1184
                                , height 1376
                                ]
                                []
                            ]
                        , figcaption [ class (Dtw.classList [ Dtw.mt_3, Dtw.flex, Dtw.text_sm, Dtw.text_gray_500 ]) ]
                            [ svg
                                [ SvgAttr.class (Dtw.classList [ Dtw.flex_none, Dtw.w_5, Dtw.h_5, Dtw.text_gray_400 ])
                                , viewBox "0 0 20 20"
                                , fill "currentColor"
                                , ariaHidden True
                                ]
                                [ path
                                    [ fillRule "evenodd"
                                    , d "M4 5a2 2 0 00-2 2v8a2 2 0 002 2h12a2 2 0 002-2V7a2 2 0 00-2-2h-1.586a1 1 0 01-.707-.293l-1.121-1.121A2 2 0 0011.172 3H8.828a2 2 0 00-1.414.586L6.293 4.707A1 1 0 015.586 5H4zm6 9a3 3 0 100-6 3 3 0 000 6z"
                                    , clipRule "evenodd"
                                    ]
                                    []
                                ]
                            , span [ class Dtw.ml_2 ] [ text "Photograph by Marcus O’Leary" ]
                            ]
                        ]
                    ]
                -- else don't generate the html for the image

            else
                div [] []
    in
    div []
        [ div [ class (Dtw.classList [ Dtw.mt_8, Dtw.lg [ Dtw.grid, Dtw.grid_cols_2, Dtw.gap_8 ] ]) ]
            [ div [ class (Dtw.classList [ Dtw.relative, Dtw.lg [ Dtw.row_start_1, Dtw.col_start_2 ] ]) ]
                [ svg
                    [ SvgAttr.class (Dtw.classList [ Dtw.hidden, Dtw.absolute, Dtw.top_0, Dtw.right_0, Dtw.neg_mt_20, Dtw.neg_mr_20, Dtw.lg [ Dtw.block ] ])
                    , width 404
                    , height 384
                    , fill "none"
                    , viewBox "0 0 404 384"
                    , ariaHidden True
                    ]
                    [ defs []
                        [ pattern
                            [ id "de316486-4a29-4312-bdfc-fbce2132a2c1"
                            , x "0"
                            , y "0"
                            , width 20
                            , height 20
                            , patternUnits "userSpaceOnUse"
                            ]
                            [ rect
                                [ x "0"
                                , y "0"
                                , width 4
                                , height 4
                                , SvgAttr.class Dtw.text_gray_200
                                , fill "currentColor"
                                ]
                                []
                            ]
                        ]
                    , rect
                        [ width 404
                        , height 384
                        , fill "url(#de316486-4a29-4312-bdfc-fbce2132a2c1)"
                        ]
                        []
                    ]
                , image
                ]
            , div [ class (Dtw.classList [ Dtw.lg [ Dtw.mt_0 ] ]) ]
                [ div [ class (Dtw.classList [ Dtw.prose, Dtw.prose_indigo, Dtw.text_gray_500, Dtw.mx_auto, Dtw.lg [ Dtw.max_w_none, Dtw.row_start_1, Dtw.col_start_1 ] ]) ]
                    [ div [ class contentLineClampStyles ]
                        [ p []
                            [ text model.contentBody ]
                        ]
                    ]
                , div [ class (Dtw.classList [ Dtw.mb_8, Dtw.prose, Dtw.mx_auto, Dtw.textColor Primary, Dtw.sm [ Dtw.mt_8 ], Dtw.lg [ Dtw.max_w_none, Dtw.row_start_1, Dtw.col_start_1 ] ]) ]
                    [ button [ onClick ReadMoreClicked ] [ text readMoreText ] ]
                , div
                    [ class (Dtw.classList [ Dtw.prose, Dtw.mx_auto, Dtw.lg [ Dtw.max_w_none, Dtw.row_start_1, Dtw.col_start_1 ], Dtw.onHover [ Dtw.cursor_pointer ] ])
                    , onClick DatasetClicked
                    ]
                    [ button [ class (Dtw.classList [ Dtw.text_left, Dtw.border, Dtw.borderColor Primary, Dtw.rounded_lg, Dtw.w_full ]) ]
                        [ div [ class (Dtw.classList [ Dtw.p_6 ]) ]
                            [ p [ class (Dtw.classList [ Dtw.text_sm, Dtw.text_blue_500, Dtw.mt_0, Dtw.mb_0 ]) ] [ text "Dataset" ]
                            , p [ class (Dtw.classList [ Dtw.text_3xl, Dtw.pt_1, Dtw.mt_0, Dtw.mb_0, Dtw.textColor Primary, Dtw.font_serif ]) ] [ text model.datasetTitle ]
                            ]
                        ]
                    ]
                ]
            ]
        ]


update : Msg -> Model -> Model
update msg model =
    case msg of
        ReadMoreClicked ->
            { model | isReadMoreOpen = not model.isReadMoreOpen }

        DatasetClicked ->
            -- do nothing currently
            { model | contentBody = model.contentBody }
