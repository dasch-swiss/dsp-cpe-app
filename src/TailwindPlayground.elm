module TailwindPlayground exposing (..)
import Browser
import Buttons.Button exposing (..)
import Html exposing (Html, h3, div, p, text)
import Html.Attributes exposing (class)
import Avatars.CircularAvatar as CircularAvatar

type alias Model =
    String


main : Program () Model msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


init : () -> ( Model, Cmd msg )
init _ =
    ( "", Cmd.none )


view : Model -> Html msg
view _ =
    div [ class "main"]
        [ div [ class "buttons" ]
            [ div [ class "preview primary-button" ]
                [ p [ class "header" ] [ text "Primary Buttons" ]
                , cpeButton (Primary, ExtraSmall, "Extra small")
                , cpeButton (Primary, Small, "Small")
                , cpeButton (Primary, Normal, "Normal")
                , cpeButton (Primary, Large, "Large")
                , cpeButton (Primary, ExtraLarge, "Extra large")
                ]

            , div [ class "preview secondary-button" ]
                [ p [ class "header" ] [ text "Secondary Buttons" ]
                , cpeButton (Secondary, ExtraSmall, "Extra small")
                , cpeButton (Secondary, Small, "Small")
                , cpeButton (Secondary, Normal, "Normal")
                , cpeButton (Secondary, Large, "Large")
                , cpeButton (Secondary, ExtraLarge, "Extra large")
                ]
            , div [ class "preview white-button" ]
            [ p [ class "header" ] [ text "White Buttons" ]
                , cpeButton (White, ExtraSmall, "Extra small")
                , cpeButton (White, Small, "Small")
                , cpeButton (White, Normal, "Normal")
                , cpeButton (White, Large, "Large")
                , cpeButton (White, ExtraLarge, "Extra large")
            ] 

            -- insert other buttons here
        ]
        , div [class "avatars"]
            [ div [ class "preview circular-avatar"]
                [ h3 [ class "header"][ text "Circular Avatar"]
                    , CircularAvatar.view { size = CircularAvatar.ExtraSmall
                        , img = "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
                        , alt = "Extra small"}
                    , CircularAvatar.view { size = CircularAvatar.Small
                        , img = "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
                        , alt = "Small"}
                    , CircularAvatar.view { size = CircularAvatar.Normal
                        , img = "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
                        , alt = "Normal"}
                    , CircularAvatar.view { size = CircularAvatar.Large
                        , img = "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
                        , alt = "Large"}
                    , CircularAvatar.view { size = CircularAvatar.ExtraLarge
                        , img = "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
                        , alt = "Extra large"}
                ]
        ]
    ]

type Msg = DisplayWhichButtonClicked 

--update : msg -> Model -> ( Model, Cmd msg )
update : a -> b -> (b, Cmd msg)
update _ model =
    ( model, Cmd.none )


subscriptions : Model -> Sub msg
subscriptions _ =
    Sub.none
