module Projects.Beol exposing (..)

import DspCpeApi as Api
import Html exposing (div)
import Html.Attributes exposing (class)
import Modules.NavigationHeader.NavigationHeader as Header
import Shared.SharedTypes exposing (WidgetInstanceId(..))
import Util.CustomCss.DaschTailwind as Dtw


type alias Model =
    { header : Header.HeaderModel
    }


type Msg
    = NavigationHeaderMsg Header.Msg


view : Model -> Html.Html Msg
view model =
    div [ class (Dtw.classList [ Dtw.relative, Dtw.min_h_screen ]) ]
        [ div [ class Dtw.pb_32 ]
            [ Api.header
                model.header
                |> Html.map NavigationHeaderMsg
            , Api.footer { copyrightText = "The contents on our website are licensed under a", contactUsText = "Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.", contactUsUrl = "https://creativecommons.org/licenses/by-nc-nd/4.0/", licensingFilePath = "/assets/images/license-cc-beol.jpg" }
            ]
        ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NavigationHeaderMsg headerMsg ->
            ( { model
                | header =
                    Header.update headerMsg model.header
              }
            , Cmd.none
            )


init : ( Model, Cmd Msg )
init =
    ( { header =
            { logo =
                { src = "https://beol.dasch.swiss/assets/images/beol-logo.png"
                , lbl = "Beol Logo"
                , attrs = []
                }
            , navBar =
                []
            , user = Nothing
            , showSearchBar = False
            , showMobileMenu = False
            }
      }
    , Cmd.none
    )
