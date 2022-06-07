module Modules.Footer.Footer exposing (..)

import Html exposing (Html, div, footer)
import Html.Attributes exposing (class)
import Modules.Footer.ContactUs as ContactUs
import Modules.Footer.DaschCopyright as DaschCopyright
import Modules.Footer.Licensing as Licensing
import Util.CustomCss.DaschTailwind as Dtw exposing (..)


type alias Model =
    { copyrightText : String
    , contactUsText : String
    , contactUsUrl : String
    , licensingFilePath : String
    }


view : Model -> Html msg
view model =
    footer [ class (Dtw.classList [Dtw.bg_white, Dtw.inset_x_0, Dtw.bottom_0]) ]
        [ div
            [ class
                (Dtw.classList
                    [ Dtw.max_w_7xl
                    , Dtw.mx_auto
                    , Dtw.py_12
                    , Dtw.sm [ Dtw.px_6 ]
                    , Dtw.md [ Dtw.flex, Dtw.items_center, Dtw.justify_between ]
                    , Dtw.lg [ Dtw.px_8 ]
                    ]
                )
            ]
            [ div
                [ class
                    (Dtw.classList
                        [ Dtw.flex
                        , Dtw.justify_center
                        , Dtw.space_x_6
                        , Dtw.md [ Dtw.order_2 ]
                        ]
                    )
                ]
                [ ContactUs.view { text = model.contactUsText, url = model.contactUsUrl }
                , Licensing.view { path = model.licensingFilePath }
                ]
            , div
                [ class
                    (Dtw.classList
                        [ Dtw.mt_8
                        , Dtw.md [ Dtw.mt_0, Dtw.order_1 ]
                        ]
                    )
                ]
                [ DaschCopyright.view { text = model.copyrightText } ]
            ]
        ]
