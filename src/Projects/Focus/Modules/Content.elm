module Projects.Focus.Modules.Content exposing (..)

import CustomCss.CssColors exposing (CustomColor(..))
import CustomCss.DaschTailwind as Dtw
import Html exposing (Html, div, figcaption, figure, h2, h3, img, li, p, span, text, ul)
import Html.Attributes exposing (alt, class, height, src, width)
import Html.Attributes.Aria exposing (ariaHidden, role)
import Svg exposing (defs, path, pattern, rect, svg)
import Svg.Attributes as SvgAttr exposing (clipRule, d, fill, fillRule, id, patternUnits, viewBox, x, y)
import Html.Attributes exposing (style)
import Html exposing (button)
import Html exposing (th)
import Html.Events exposing (onClick)


type alias Model =
    { text : String
    , isReadMoreOpen : Bool
    , datasetTitle : String
    }


type Msg
    = ReadMoreClicked

view : Model -> Html Msg
view model =
    let
        readMoreText =
            if model.isReadMoreOpen then
                "Read less"
            else
                "Read more"

        contentLineClampStyles =
            if model.isReadMoreOpen then
                Dtw.classList [ ]
            else
                Dtw.classList [ Dtw.line_clamp_10, Dtw.max_h_96  ] -- add largest tailwind max height class available because Safari doesn't handle line clamps on divs correctly
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
                ]
            , div [ class (Dtw.classList [ Dtw.lg [ Dtw.mt_0 ] ]) ]
                [ div [ class (Dtw.classList [ Dtw.prose, Dtw.prose_indigo, Dtw.text_gray_500, Dtw.mx_auto, Dtw.lg [ Dtw.max_w_none, Dtw.row_start_1, Dtw.col_start_1 ] ]) ]
                    [ div [ class contentLineClampStyles ]
                        [ p []
                            [ text "Sagittis scelerisque nulla cursus in enim consectetur quam. Dictum urna sed consectetur neque tristique pellentesque. Blandit amet, sed aenean erat arcu morbi." ]
                        , p []
                            [ text "Sollicitudin tristique eros erat odio sed vitae, consequat turpis elementum. Lorem nibh vel, eget pretium arcu vitae. Eros eu viverra donec ut volutpat donec laoreet quam urna." ]
                        , p []
                            [ text "Bibendum eu nulla feugiat justo, elit adipiscing. Ut tristique sit nisi lorem pulvinar. Urna, laoreet fusce nibh leo. Dictum et et et sit. Faucibus sed non gravida lectus dignissim imperdiet a. Bibendum eu nulla feugiat justo, elit adipiscing. Ut tristique sit nisi lorem pulvinar. " ]
                        , p []
                            [ text "Dictum magnis risus phasellus vitae quam morbi. Quis lorem lorem arcu, metus, egestas netus cursus." ]
                        , p []
                            [ text """Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus 
                                        est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, 
                                        no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. 
                                        Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, 
                                        vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod 
                                        tincidunt ut laoreet dolore magna aliquam erat volutpat.""" ]
                        ]
                        
                    ]
                , div [ class (Dtw.classList [ Dtw.mb_8, Dtw.prose, Dtw.mx_auto, Dtw.sm [ Dtw.mt_8 ], Dtw.lg [ Dtw.max_w_none, Dtw.row_start_1, Dtw.col_start_1 ] ]) ]
                    [ button [ onClick ReadMoreClicked ] [text readMoreText] ]
                , div [ class (Dtw.classList [ Dtw.prose, Dtw.mx_auto, Dtw.lg [ Dtw.max_w_none, Dtw.row_start_1, Dtw.col_start_1 ] ]) ]
                    [ div [ class (Dtw.classList [ Dtw.border, Dtw.custom_border Primary, Dtw.rounded_lg ]) ]
                        [ div [ class (Dtw.classList [ Dtw.p_6 ]) ]
                            [ p [ class (Dtw.classList [ Dtw.text_sm, Dtw.text_blue_500, Dtw.mt_0, Dtw.mb_0 ]) ] [ text "Dataset" ]
                            , p [ class (Dtw.classList [ Dtw.text_3xl, Dtw.pt_1, Dtw.mt_0, Dtw.mb_0, Dtw.custom_text Primary, Dtw.font_serif ]) ] [ text model.datasetTitle ]
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
            if model.isReadMoreOpen then
                { isReadMoreOpen = False, text = model.text, datasetTitle = model.datasetTitle }
            else
                { isReadMoreOpen = True, text = model.text, datasetTitle = model.datasetTitle }