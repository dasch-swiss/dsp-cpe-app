module Projects.Focus.Focus exposing (..)

import CustomCss.DaschTailwind as Dtw
import Html exposing (Html, div)
import Html.Attributes exposing (class)
import Projects.Focus.Modules.Content as Content
import Projects.Focus.Modules.Header as Header


type alias Model =
    { headerModel : Header.Model
    , contentModel : Content.Model
    }


type Msg
    = ContentMsg Content.Msg


initialModel : Model
initialModel =
    { headerModel =
        { title = "Title"
        , subtitle = "subtitle"
        }
    , contentModel =
        { contentBody = """Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus 
                    est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, 
                    no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. 
                    Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, 
                    vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod 
                    tincidunt ut laoreet dolore magna aliquam erat volutpat."""
        , imagePath = "https://images.unsplash.com/photo-1546913199-55e06682967e?ixlib=rb-1.2.1&auto=format&fit=crop&crop=focalpoint&fp-x=.735&fp-y=.55&w=1184&h=1376&q=80"
        , imageAltText = "Whitney leaning against a railing on a downtown street"
        , isReadMoreOpen = False
        , datasetTitle = "Test Dataset"
        }
    }


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
