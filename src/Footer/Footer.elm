module Footer.Footer exposing (..)

import CustomCss.DaschTailwind as Dtw exposing (..)
import Footer.ContactUs as ContactUs
import Footer.DaschCopyright as DaschCopyright
import Footer.Licensing as Licensing
import Html exposing (Html, div)
import Html.Attributes exposing (class)


type alias Model =
    { copyrightText : String
    , contactUsText : String
    , contactUsUrl : String
    , licensingFilePath : String
    }


view : Model -> Html msg
view model =
    div [ class "footer", class Dtw.flex ]
        [ div
            [ class
                (Dtw.classList
                    [ Dtw.flex_none
                    , Dtw.align_middle
                    , Dtw.leading_6
                    , Dtw.text_gray_600
                    , Dtw.mx_auto
                    ]
                )
            ]
            [ DaschCopyright.view { text = model.copyrightText } ]
        , div [ class "flex-auto" ] []
        , div
            [ class
                (Dtw.classList
                    [ Dtw.flex_none
                    , Dtw.align_middle
                    , Dtw.text_blue_700
                    , Dtw.mx_3
                    ]
                )
            ]
            [ ContactUs.view { text = model.contactUsText, url = model.contactUsUrl } ]
        , div
            [ class
                (Dtw.classList
                    [ Dtw.flex_none
                    , Dtw.align_middle
                    , Dtw.mx_3
                    ]
                )
            ]
            [ Licensing.view { path = model.licensingFilePath } ]
        ]
