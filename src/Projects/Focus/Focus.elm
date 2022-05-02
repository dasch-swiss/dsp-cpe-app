module Projects.Focus.Focus exposing (..)

import CustomCss.DaschTailwind as Dtw
import Html exposing (Html, div)
import Projects.Focus.Modules.Header as Header exposing (view)
import Projects.Focus.Modules.Content as Content exposing (view)
import Html.Attributes exposing (class)


type alias Model =
    { headerTitle : String
    , headerSubtitle : String
    , contentBody : String
    }

view : Model -> Html msg
view model =
    div
    [ class (Dtw.classList [ Dtw.bg_white, Dtw.overflow_hidden ]) ]
    [ div [ class (Dtw.classList [ Dtw.relative, Dtw.max_w_7xl, Dtw.mx_auto, Dtw.py_16, Dtw.px_4, Dtw.sm [ Dtw.px_6 ], Dtw.lg [ Dtw.px_8 ] ]) ]
        [ Header.view { title = model.headerTitle, subtitle = model.headerSubtitle }
        , Content.view { text = model.contentBody }
        ]
    ]