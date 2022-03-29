module NavigationHeader.HeaderPlayground exposing (..)

import Browser
import Html exposing (div, text)
import Html.Attributes exposing (class)
import Html.Styled.Events exposing (onClick)
import NavigationHeader.HeaderModule exposing (cpeHeader)
import NavigationHeader.NavItem exposing (NavItem)
import NavigationHeader.NavbarModule exposing (..)


type alias Model =
    String


main : Program () Model MyRoute
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



--init: a -> (String, Cmd ClickEvent msg)


type MyRoute
    = RouteOne
    | RouteTwo


init : () -> ( Model, Cmd msg )
init _ =
    ( "", Cmd.none )



--someNavitem : NavItem msg


someNavitem : NavItem MyRoute
someNavitem =
    { attrs = [ onClick RouteOne ], text = "NavItem which does events", href = "#", cmd = Cmd.none, isActive = True }


otherNavitem : NavItem MyRoute
otherNavitem =
    { attrs = [ onClick RouteTwo ], text = "other NavItem", href = "#", cmd = Cmd.none, isActive = False }


view model =
    div [ class "playground" ]
        [ div [ class "buttons" ] []
        , div [] [ cpeHeader "" False [ someNavitem, otherNavitem ] True ]
        , div [] [ text model ]
        ]


update : MyRoute -> b -> ( String, Cmd msg )
update action _ =
    case action of
        RouteOne ->
            ( "changing to route one", Cmd.none )

        RouteTwo ->
            ( "changing to route two", Cmd.none )


subscriptions : Model -> Sub msg
subscriptions _ =
    Sub.none
