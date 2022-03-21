module Text.ProjectDescription exposing (..)
import Dividers.Divider as Divider
import Icon
import Browser
import Html.Styled.Events exposing (onClick)
import Html.Styled.Attributes as Attr
import Html.Styled as Styled exposing ( textarea, div, text)
import VirtualDom
main : Program () Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
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
    , text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse consequat ac dolor at euismod. Nam vulputate, dolor eget sodales sodales, purus eros interdum dui, a dignissim est est eget orci. Curabitur nec finibus justo. Nam tincidunt tristique ipsum, in aliquet orci pulvinar rutrum. Proin vitae ullamcorper quam. Suspendisse consequat dui nec mattis vehicula. In ligula ex, malesuada et leo quis, gravida tincidunt odio. Suspendisse pellentesque nulla id elit condimentum, at viverra tellus blandit. Integer facilisis posuere posuere. Vestibulum vitae orci in erat vehicula varius. Ut interdum consectetur erat, eget fermentum orci ultrices in. Mauris lacinia dolor convallis, porta sem at, mollis sapien. Sed nec pharetra lectus. Sed mattis ipsum molestie semper finibus."
    }
init : () -> ( Model, Cmd Msg )
init _ =
    ( initialModel, Cmd.none )

view : Model -> VirtualDom.Node Msg
view model =
    if model.isOpen then
        Styled.toUnstyled <|
            div [][
                    textarea [] [text model.text]
                    , Styled.fromUnstyled <| Divider.iconButtonDivider [onClick Hide] Icon.PlusSm "Read Less"
                ]
    else
        Styled.toUnstyled <|
            div [][
                textarea [Attr.rows 6] [text model.text]
                , Styled.fromUnstyled <| Divider.iconButtonDivider [onClick Show] Icon.PlusSm "Read More"
            ]
{-TODO: Handle cases if text is not long enough to show more etc. Style the textareas-}
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Show -> 
            (({isOpen = True, text = model.text}), Cmd.none)
        Hide -> (({isOpen = False, text = model.text}), Cmd.none)


subscriptions _ =
    Sub.none