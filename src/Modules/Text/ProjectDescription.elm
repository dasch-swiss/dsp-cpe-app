module Modules.Text.ProjectDescription exposing (..)

import Html exposing (Html, div, p, text)
import Html.Attributes exposing (class, style)
import Html.Events exposing (onClick)
import Modules.Dividers.IconButtonDivider as IconButtonDivider
import Util.CustomCss.DaschTailwind as Dtw
import Util.Icon as Icon


type alias Model =
    { isOpen : Bool
    , text : String
    }


type Msg
    = Show
    | Hide


initialModel : Model
initialModel =
    { isOpen = False
    , text = """Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus 
            est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, 
            no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. 
            Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, 
            vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod 
            tincidunt ut laoreet dolore magna aliquam erat volutpat."""
    }


init : () -> ( Model, Cmd Msg )
init _ =
    ( initialModel, Cmd.none )


view : Model -> Html Msg
view model =
    if model.isOpen then
        div []
            [ div
                [ class (Dtw.classList [ Dtw.mt_6, Dtw.prose, Dtw.prose_indigo, Dtw.prose_lg, Dtw.text_gray_500, Dtw.mx_auto, Dtw.max_w_prose ]) ]
                [ p [ style "padding-bottom" "1%" ] [ text model.text ] ]
            , IconButtonDivider.view { buttonAttrs = [ onClick Hide ], icon = Icon.PlusSm, text = "Read Less" }
            ]

    else
        div []
            [ div
                [ class (Dtw.classList [ Dtw.mt_6, Dtw.prose, Dtw.prose_indigo, Dtw.prose_lg, Dtw.text_gray_500, Dtw.mx_auto, Dtw.max_w_prose ]) ]
                [ p
                    [ style "overflow" "hidden"
                    , style "text-overflow" "ellipsis"
                    , style "display" "-webkit-box"
                    , style "-webkit-line-clamp" "6"
                    , style "line-clamp" "6"
                    , style "-webkit-box-orient" "vertical"
                    , style "padding-bottom" "0.5%"
                    ]
                    [ text model.text ]
                ]

            -- Don't use api to avoid circularities
            , IconButtonDivider.view { buttonAttrs = [ onClick Show ], icon = Icon.PlusSm, text = "Read More" }
            ]


update : Msg -> Model -> Model
update msg model =
    case msg of
        Show ->
            { isOpen = True, text = model.text }

        Hide ->
            { isOpen = False, text = model.text }
