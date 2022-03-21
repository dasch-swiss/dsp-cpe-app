module Text.ProjectDescription exposing (..)
import Dividers.Divider as Divider
import Icon
import Html.Styled.Events exposing (onClick)
import Html.Styled.Attributes as Attr
import Html.Styled as Styled exposing ( p, div, text)
import VirtualDom
import Tailwind.Utilities as Tw
type alias Model =
    { isOpen: Bool
    , text: String
    }

type Msg
    = Show |
    Hide


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

view : Model -> VirtualDom.Node Msg
view model =
    if model.isOpen then
        Styled.toUnstyled <|
            div [][
                div[ Attr.css [Tw.mt_6, Tw.prose, Tw.prose_indigo, Tw.prose_lg, Tw.text_gray_500, Tw.mx_auto]][p [ Attr.style "padding-bottom" "1%"] [ text model.text ] ]
                , Styled.fromUnstyled <| Divider.iconButtonDivider [onClick Hide] Icon.PlusSm "Read Less"
            ]
    else
        Styled.toUnstyled <|
            div [][
                div[Attr.css [Tw.mt_6, Tw.prose, Tw.prose_indigo, Tw.prose_lg, Tw.text_gray_500, Tw.mx_auto]]
                    [ p
                        [ Attr.style "overflow" "hidden"
                        , Attr.style "text-overflow" "ellipsis"
                        , Attr.style "display" "-webkit-box"
                        , Attr.style "-webkit-line-clamp" "6"
                        , Attr.style "line-clamp" "6"
                        , Attr.style "-webkit-box-orient" "vertical"
                        , Attr.style "padding-bottom" "1%" ] [text model.text]]
                , Styled.fromUnstyled <| Divider.iconButtonDivider [onClick Show] Icon.PlusSm "Read More"
            ]
update : Msg -> Model -> Model
update msg model =
    case msg of
        Show -> 
            ({isOpen = True, text = model.text})
        Hide -> (
            {isOpen = False, text = model.text})

