module Modules.Projects.Beol exposing (..)

import DspCpeApi as Api
import Html exposing (div)
import Html.Attributes exposing (class)
import Modules.NavigationHeader.NavigationHeader as Header
import Modules.Text.ProjectDescription as ProjectDescription
import Util.CustomCss.DaschTailwind as Dtw


type alias Model =
    { header : Header.HeaderModel
    , projectDescription : ProjectDescription.Model
    }


type Msg
    = NavigationHeaderMsg Header.Msg
    | ProjectDescriptionMsg ProjectDescription.Msg


view : Model -> Html.Html Msg
view model =
    div [ class (Dtw.classList [ Dtw.relative, Dtw.min_h_screen ])]
        [ div [ class (Dtw.classList [Dtw.pb_32])]
            [ Api.header
                model.header.logo
                model.header.navBar
                model.header.showSearchBar
                model.header.user
                model.header.showMobileMenu
                model.header.fixedPosition
                |> Html.map NavigationHeaderMsg
            , Api.projectDescription model.projectDescription |> Html.map ProjectDescriptionMsg
            , Api.footer "The contents on our website are licensed under a" "Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License." "https://creativecommons.org/licenses/by-nc-nd/4.0/" "/assets/images/license-cc-beol.jpg"
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

        ProjectDescriptionMsg projMsg ->
            ( { model
                | projectDescription =
                    ProjectDescription.update projMsg model.projectDescription
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
            , fixedPosition = True
            }
      , projectDescription =
            { title = "Bernoulli Euler Online"
            , subtitle = "BEOL"
            , text = """The Bernoulli-Euler Online (BEOL) project is a research platform for the study of early modern mathematics and science. It aims at integrating works and correspondence of members of Bernoulli dynasty and Leonhard Euler.

Currently, the BEOL platform contains three main editions: Basler Edition der Bernoulli-Briefwechsel (ongoing), Leonhard Euler's correspondence with Christian Goldbach (Leonhardi Euleri Opera Omnia IVA/IV), and a multi-layered interactive edition of Jacob Bernoulli's scientific notebook Meditationes. The platform also contains the edition of Leonhard Euler's correspondence with the Marquis de Condorcet and Turgot.

BEOL is connected to the repositories of The Newton Project and the Briefportal Leibniz initiating the formation of a network of digital editions of the correspondence among the early modern natural philosophers."""
            , isOpen = False
            }
      }
    , Cmd.none
    )
