module Tiles.ImageTile exposing (..)

import CustomCss.DaschTailwind as Dtw
import Html exposing (Html, button, div, img, li, p, span, text, ul)
import Html.Attributes exposing (alt, class, src, type_)
import Html.Attributes.Aria exposing (role)


type alias Model =
    { src : String
    , alt : String
    , buttonAlt : String
    , title : String
    , subtitle : String
    }


imageTileClasses : String
imageTileClasses =
    Dtw.classList
        [ Dtw.group
        , Dtw.block
        , Dtw.w_full
        , Dtw.rounded_lg
        , Dtw.bg_gray_100
        , Dtw.overflow_hidden
        , Dtw.focusWithin Dtw.ring_2
        , Dtw.focusWithin Dtw.ring_offset_2
        , Dtw.focusWithin Dtw.ring_indigo_500
        , Dtw.focusWithin Dtw.ring_offset_gray_100
        ]


tile : Model -> Html msg
tile model =
    li [ class Dtw.relative ]
        [ div
            [ class imageTileClasses
            ]
            [ img
                [ alt model.alt
                , src model.src
                , class
                    (Dtw.classList
                        [ Dtw.object_cover
                        , Dtw.pointer_events_none
                        , Dtw.groupHover Dtw.opacity_75
                        , Dtw.aspect_arbitrary 10 7
                        ]
                    )
                ]
                []
            , button
                [ type_ "button"
                , class
                    (Dtw.classList
                        [ Dtw.absolute
                        , Dtw.inset_0
                        , Dtw.focus Dtw.outline_none
                        ]
                    )
                ]
                [ span [ class Dtw.sr_only ] [ text model.buttonAlt ] ]
            ]
        , p
            [ class
                (Dtw.classList
                    [ Dtw.mt_2
                    , Dtw.block
                    , Dtw.text_sm
                    , Dtw.font_medium
                    , Dtw.text_gray_900
                    , Dtw.truncate
                    , Dtw.pointer_events_none
                    ]
                )
            ]
            [ text model.title ]
        , p
            [ class
                (Dtw.classList
                    [ Dtw.block
                    , Dtw.text_sm
                    , Dtw.font_medium
                    , Dtw.text_gray_500
                    , Dtw.pointer_events_none
                    ]
                )
            ]
            [ text model.subtitle ]
        ]


view : Model -> Html msg
view model =
    div
        [ class
            (Dtw.classList
                [ Dtw.max_w_7xl
                , Dtw.mx_auto
                , Dtw.py_8
                , Dtw.px_4
                , Dtw.sm Dtw.px_6
                , Dtw.lg Dtw.px_8
                ]
            )
        ]
        [ ul
            [ role "list"
            , class
                (Dtw.classList
                    [ Dtw.grid
                    , Dtw.grid_cols_2
                    , Dtw.gap_x_4
                    , Dtw.gap_y_8
                    , Dtw.sm Dtw.grid_cols_3
                    , Dtw.sm Dtw.gap_x_6
                    , Dtw.lg Dtw.grid_cols_4
                    , Dtw.xl Dtw.gap_x_8
                    ]
                )
            ]
            [ tile model, tile model, tile model, tile model, tile model, tile model, tile model, tile model, tile model ]
        ]
