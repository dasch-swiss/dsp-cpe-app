module Projects.Focus.Modules.Header exposing (..)

import CustomCss.DaschTailwind as Dtw
import Html exposing (Html, div, text, h2, h3)
import Html.Attributes exposing (class)


type alias Model =
    { title : String
    , subtitle : String
    }

view : Model -> Html msg
view model =
    div []
        [ div [ class (Dtw.classList [ Dtw.hidden, Dtw.bg_gray_50, Dtw.absolute, Dtw.top_0, Dtw.bottom_0, Dtw.left_3_slash_4, Dtw.w_screen, Dtw.lg [ Dtw.block ] ]) ][]
        , div [ class (Dtw.classList [ Dtw.mx_auto, Dtw.text_base, Dtw.max_w_prose, Dtw.lg [ Dtw.grid, Dtw.grid_cols_2, Dtw.gap_8, Dtw.max_w_none ] ]) ]
            [ div []
                [ h2 [ class (Dtw.classList [ Dtw.text_base, Dtw.text_gray_600, Dtw.font_semibold, Dtw.tracking_wide, Dtw.uppercase ]) ][ text model.subtitle ]
                , h3 [ class (Dtw.classList [ Dtw.mt_2, Dtw.text_3xl, Dtw.leading_8, Dtw.font_extrabold, Dtw.tracking_tight, Dtw.text_gray_900, Dtw.sm [ Dtw.text_4xl ] ]) ][ text model.title ]
                ]
            ]
        ]