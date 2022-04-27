module Text.Accordion exposing (..)

import CustomCss.DaschTailwind as Dtw
import Html exposing (Html, div, p, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Icon
import Svg exposing (svg)


type AccordionSize
    = HalfWidth
    | FullWidth


type alias Model =
    { isOpen : Bool
    , text : String
    , size : AccordionSize
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
    , size = FullWidth
    }


init : () -> ( Model, Cmd Msg )
init _ =
    ( initialModel, Cmd.none )


view : Model -> Html Msg
view model =
    let
        accordionClasses =
            case model.size of
                HalfWidth ->
                    Dtw.w_6_slash_12

                FullWidth ->
                    Dtw.w_full

        iconColor =
            if model.isOpen then
                Dtw.text_white

            else
                Dtw.text_blue_700

        svgClasses =
            Dtw.classList
                [ Dtw.ml_2
                , Dtw.h_4
                , Dtw.w_4
                , Dtw.mt_3
                , iconColor
                ]
    in
    if model.isOpen then
        div [ class accordionClasses ]
            [ div
                [ class
                    (Dtw.classList
                        [ Dtw.rounded_lg
                        , Dtw.border_blue_700
                        , Dtw.border_2
                        , Dtw.bg_blue_700
                        , Dtw.cursor_pointer
                        ]
                    )
                , onClick Hide
                ]
                [ div [ class (Dtw.classList [ Dtw.inline_flex ]) ]
                    [ div [ class svgClasses ] [ Icon.getHtml Icon.MinusCircle ]
                    , div [ class (Dtw.classList [ Dtw.p_2, Dtw.pl_3, Dtw.text_white ]) ] [ text "Click to hide" ]
                    ]
                ]
            , div [ class (Dtw.classList [ Dtw.w_11_slash_12, Dtw.mx_auto ]) ] [ p [] [ text model.text ] ]
            ]

    else
        div [ class accordionClasses ]
            [ div
                [ class
                    (Dtw.classList
                        [ Dtw.rounded_lg
                        , Dtw.border_blue_700
                        , Dtw.border_2
                        , Dtw.cursor_pointer
                        ]
                    )
                , onClick Show
                ]
                [ div [ class (Dtw.classList [ Dtw.inline_flex ]) ]
                    [ div [ class svgClasses ] [ Icon.getHtml Icon.PlusCircle ]
                    , div [ class (Dtw.classList [ Dtw.p_2, Dtw.pl_3, Dtw.text_blue_700 ]) ] [ text "Click to show" ]
                    ]
                ]
            ]


update : Msg -> Model -> Model
update msg model =
    case msg of
        Show ->
            { isOpen = True, text = model.text, size = model.size }

        Hide ->
            { isOpen = False, text = model.text, size = model.size }
