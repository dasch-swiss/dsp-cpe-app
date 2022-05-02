module Projects.Focus.Content exposing (..)

import CustomCss.DaschTailwind as Dtw
import Html exposing (Html, div, figcaption, figure, h2, h3, img, li, p, span, text, ul)
import Html.Attributes exposing (alt, class, height, src, width)
import Html.Attributes.Aria exposing (ariaHidden, role)
import Svg exposing (defs, path, pattern, rect, svg)
import Svg.Attributes exposing (clipRule, d, fill, fillRule, id, patternUnits, viewBox, x, y)


type alias Model =
    { text : String }


view : Model -> Html msg
view model =
    div []
        [ div [ class (Dtw.classList [ Dtw.mt_8, Dtw.lg [ Dtw.grid, Dtw.grid_cols_2, Dtw.gap_8 ] ]) ]
            [ div [ class (Dtw.classList [ Dtw.relative, Dtw.lg [ Dtw.row_start_1, Dtw.col_start_2 ] ]) ]
                [ svg
                    [ class (Dtw.classList [ Dtw.hidden, Dtw.top_0, Dtw.right_0, Dtw.neg_mt_20, Dtw.neg_mr_20, Dtw.lg [ Dtw.block ] ])
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
                                , class Dtw.text_gray_200
                                , fill "currentColor"
                                ]
                                []
                            ]
                        ]
                    ]
                , rect
                    [ width 404
                    , height 384
                    , fill "url(#de316486-4a29-4312-bdfc-fbce2132a2c1)"
                    ]
                    []
                ]
            , div [ class (Dtw.classList [ Dtw.relative, Dtw.text_base, Dtw.mx_auto, Dtw.max_w_prose, Dtw.lg [ Dtw.max_w_none ] ]) ]
                [ figure
                    []
                    [ div [ class (Dtw.classList [ Dtw.aspect_w_12, Dtw.aspect_h_7, Dtw.lg [ Dtw.aspect_none ] ]) ]
                        [ img
                            [ class (Dtw.classList [ Dtw.rounded_lg, Dtw.shadow_lg, Dtw.object_cover, Dtw.object_center ])
                            , src "https://images.unsplash.com/photo-1546913199-55e06682967e?ixlib=rb-1.2.1&auto=format&fit=crop&crop=focalpoint&fp-x=.735&fp-y=.55&w=1184&h=1376&q=80"
                            , alt "Whitney leaning against a railing on a downtown street"
                            , width 1184
                            , height 1376
                            ]
                            []
                        ]
                    , figcaption [ class (Dtw.classList [ Dtw.mt_3, Dtw.flex, Dtw.text_sm, Dtw.text_gray_500 ]) ]
                        [ svg
                            [ class (Dtw.classList [ Dtw.flex_none, Dtw.w_5, Dtw.h_5, Dtw.text_gray_400 ])
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
            ]
        , div [ class (Dtw.classList [ Dtw.mt_8, Dtw.lg [ Dtw.mt_0 ] ]) ]
            [ div [ class (Dtw.classList [ Dtw.text_base, Dtw.max_w_prose, Dtw.mx_auto, Dtw.lg [ Dtw.max_w_none ] ]) ]
                [ p [ class (Dtw.classList [ Dtw.text_lg, Dtw.text_gray_500 ]) ]
                    [ text "Sagittis scelerisque nulla cursus in enim consectetur quam. Dictum urna sed consectetur neque tristique pellentesque. Blandit amet, sed aenean erat arcu morbi." ]
                ]
            , div [ class (Dtw.classList [ Dtw.mt_5, Dtw.prose, Dtw.prose_indigo, Dtw.text_gray_500, Dtw.mx_auto, Dtw.lg [ Dtw.max_w_none, Dtw.row_start_1, Dtw.col_start_1 ] ]) ]
                [ p []
                    [ text "Sollicitudin tristique eros erat odio sed vitae, consequat turpis elementum. Lorem nibh vel, eget pretium arcu vitae. Eros eu viverra donec ut volutpat donec laoreet quam urna." ]
                , p []
                    [ text "Bibendum eu nulla feugiat justo, elit adipiscing. Ut tristique sit nisi lorem pulvinar. Urna, laoreet fusce nibh leo. Dictum et et et sit. Faucibus sed non gravida lectus dignissim imperdiet a." ]
                , p []
                    [ text "Dictum magnis risus phasellus vitae quam morbi. Quis lorem lorem arcu, metus, egestas netus cursus. In." ]
                , ul
                    [ role "list"
                    ]
                    [ li []
                        [ text "Quis elit egestas venenatis mattis dignissim." ]
                    , li []
                        [ text "Cras cras lobortis vitae vivamus ultricies facilisis tempus." ]
                    , li []
                        [ text "Orci in sit morbi dignissim metus diam arcu pretium." ]
                    ]
                , p []
                    [ text "Rhoncus nisl, libero egestas diam fermentum dui. At quis tincidunt vel ultricies. Vulputate aliquet velit faucibus semper. Pellentesque in venenatis vestibulum consectetur nibh id. In id ut tempus egestas. Enim sit aliquam nec, a. Morbi enim fermentum lacus in. Viverra." ]
                , h3 []
                    [ text "How we helped" ]
                , p []
                    [ text "Tincidunt integer commodo, cursus etiam aliquam neque, et. Consectetur pretium in volutpat, diam. Montes, magna cursus nulla feugiat dignissim id lobortis amet. Laoreet sem est phasellus eu proin massa, lectus. Diam rutrum posuere donec ultricies non morbi. Mi a platea auctor mi." ]
                , p []
                    [ text "Sagittis scelerisque nulla cursus in enim consectetur quam. Dictum urna sed consectetur neque tristique pellentesque. Blandit amet, sed aenean erat arcu morbi." ]
                ]
            ]
        ]
