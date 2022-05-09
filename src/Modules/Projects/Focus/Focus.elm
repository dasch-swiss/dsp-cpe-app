module Modules.Projects.Focus.Focus exposing (..)

import Html exposing (Html, div)
import Html.Attributes exposing (class)
import Modules.Projects.Focus.Modules.Content as Content
import Modules.Projects.Focus.Modules.Header as Header
import Util.CustomCss.DaschTailwind as Dtw


type alias Model =
    { headerModel : Header.Model
    , contentModel : Content.Model
    }


type Msg
    = ContentMsg Content.Msg


view : Model -> Html Msg
view model =
    div
        [ class (Dtw.classList [ Dtw.bg_white, Dtw.overflow_hidden ]) ]
        [ div [ class (Dtw.classList [ Dtw.relative, Dtw.max_w_7xl, Dtw.mx_auto, Dtw.py_16, Dtw.px_4, Dtw.sm [ Dtw.px_6 ], Dtw.lg [ Dtw.px_8 ] ]) ]
            [ Header.view model.headerModel
            , Content.view model.contentModel |> Html.map ContentMsg
            ]
        ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ContentMsg contentMsg ->
            ( { model
                | contentModel =
                    Content.update contentMsg model.contentModel
              }
            , Cmd.none
            )
