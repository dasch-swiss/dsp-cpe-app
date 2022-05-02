module Text.Accordion exposing (..)

import CustomCss.DaschTailwind as Dtw
import Html exposing (Html, div, p, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Icon
import CustomCss.CssColors exposing (CustomColor(..))


type AccordionSize
    = HalfWidth
    | FullWidth


type alias Model =
    { isOpen : Bool
    , text : String
    , size : AccordionSize
    }


type Msg
    = AccordionClicked


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
        accordionSize =
            case model.size of
                HalfWidth ->
                    Dtw.w_6_slash_12

                FullWidth ->
                    Dtw.w_full

        accordionHeaderClasses =
            if model.isOpen then
                Dtw.classList
                    [ Dtw.rounded_lg
                    , Dtw.border_2
                    , Dtw.cursor_pointer
                    , (Dtw.custom_bg Secondary)
                    , (Dtw.custom_border Secondary)
                    ]

            else
                Dtw.classList
                    [ Dtw.rounded_lg
                    , Dtw.border_2
                    , Dtw.cursor_pointer
                    , (Dtw.custom_border Primary)
                    ]

        accordionHeaderTextClasses =
            if model.isOpen then
                Dtw.classList [ Dtw.p_2, Dtw.pl_3, (Dtw.custom_text White) ]

            else
                Dtw.classList [ Dtw.p_2, Dtw.pl_3, (Dtw.custom_text Primary) ]

        accordionContentClasses =
            if model.isOpen then
                Dtw.classList [ Dtw.block, Dtw.w_11_slash_12, Dtw.mx_auto ]

            else
                Dtw.hidden

        icon =
            if model.isOpen then
                Icon.getHtml Icon.MinusCircle

            else
                Icon.getHtml Icon.PlusCircle

        iconColor =
            if model.isOpen then
                Dtw.custom_text White

            else
                Dtw.custom_text Primary

        iconClasses =
            Dtw.classList
                [ Dtw.ml_2
                , Dtw.h_4
                , Dtw.w_4
                , Dtw.mt_3
                , iconColor
                ]
    in
    div [ class accordionSize ]
        [ div
            [ class accordionHeaderClasses, onClick AccordionClicked ]
            [ div [ class (Dtw.classList [ Dtw.inline_flex ]) ]
                [ div [ class iconClasses ] [ icon ]
                , div [ class accordionHeaderTextClasses ] [ text "Annotations" ]
                ]
            ]
        , div [ class accordionContentClasses ] [ p [] [ text model.text ] ]
        ]


update : Msg -> Model -> Model
update msg model =
    case msg of
        AccordionClicked ->
            if model.isOpen then
                { isOpen = False, text = model.text, size = model.size }
            else
                { isOpen = True, text = model.text, size = model.size }
