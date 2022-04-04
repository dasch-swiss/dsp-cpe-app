module Text.ProjectDescription exposing (..)

import CustomCss.DaschTailwind as Dtw
import Dividers.Divider as Divider
import Html exposing (Html, div, p, text)
import Html.Attributes exposing (class, style)
import Html.Events exposing (onClick)
import Icon
import String


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
                [ class ( String.join " " [ Dtw.mt_6, Dtw.prose, Dtw.prose_indigo, Dtw.prose_lg, Dtw.text_gray_500, Dtw.mx_auto ] ) ]
                [ p [ style "padding-bottom" "1%" ] [ text model.text ] ]
            , Divider.iconButtonDivider [ onClick Hide ] Icon.PlusSm "Read Less"
            ]

    else
        div []
            [ div [ class ( String.join " " [ Dtw.mt_6, Dtw.prose, Dtw.prose_indigo, Dtw.prose_lg, Dtw.text_gray_500, Dtw.mx_auto ] ) ]
                [ p
                    [ style "overflow" "hidden"
                    , style "text-overflow" "ellipsis"
                    , style "display" "-webkit-box"
                    , style "-webkit-line-clamp" "6"
                    , style "line-clamp" "6"
                    , style "-webkit-box-orient" "vertical"
                    , style "padding-bottom" "1%"
                    ]
                    [ text model.text ]
                ]
            , Divider.iconButtonDivider [ onClick Show ] Icon.PlusSm "Read More"
            ]


update : Msg -> Model -> Model
update msg model =
    case msg of
        Show ->
            { isOpen = True, text = model.text }

        Hide ->
            { isOpen = False, text = model.text }
