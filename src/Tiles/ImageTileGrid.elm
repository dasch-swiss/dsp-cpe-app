module Tiles.ImageTileGrid exposing (..)

import CustomCss.DaschTailwind as Dtw
import Html exposing (Html, div, ul)
import Html.Attributes exposing (class)
import Html.Attributes.Aria exposing (role)
import Tiles.ImageTile as ImageTile


type alias Model =
    { tiles : List ImageTile.Model
    }


view : Model -> Html msg
view model =
    div
        [ class
            (Dtw.classList
                [ Dtw.max_w_7xl
                , Dtw.mx_auto
                , Dtw.py_8
                , Dtw.px_4
                , Dtw.sm [ Dtw.px_6 ]
                , Dtw.lg [ Dtw.px_8 ]
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
                    , Dtw.sm [ Dtw.grid_cols_3, Dtw.gap_x_6 ]
                    , Dtw.lg [ Dtw.grid_cols_4 ]
                    , Dtw.xl [ Dtw.gap_x_8 ]
                    ]
                )
            ]
            (List.map ImageTile.view model.tiles)
        ]
