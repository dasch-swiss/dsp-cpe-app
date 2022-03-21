module Projects.TailwindPlayground exposing (..)

import Avatars.Avatar exposing (circular)
import Avatars.CircularAvatar exposing (CircularAvatarSize(..))
import Buttons.BasicButtons.BasicButton exposing (BasicButtonSize(..))
import Buttons.Button as Button exposing (primaryButton, secondaryButton, whiteButton)
import Buttons.CircularButton exposing (CircularButtonSize(..))
import Buttons.LeadingIconButton exposing (LeadingSize(..))
import Buttons.TrailingIconButton exposing (TrailingSize(..))
import Dividers.Divider as Divider
import Html exposing (Html, div, h3, text)
import Html.Attributes exposing (class)
import Icon as Icon
import Text.ProjectDescription as ProjectDescription


type alias Model =
    { text : String
    , projectDescriptionModel : ProjectDescription.Model
    }


type Msg
    = ProjDes ProjectDescription.Msg


initialModel : Model
initialModel =
    { text = "playground"
    , projectDescriptionModel = ProjectDescription.initialModel
    }


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )


view : Model -> Html Msg
view model =
    div [ class "playground" ]
        [ div [ class "buttons" ]
            [ div [ class "preview primary-button" ]
                [ h3 [ class "header" ] [ text "Primary Buttons" ]
                , primaryButton [] "Extra small" BasicExtraSmall
                , primaryButton [] "Small" BasicSmall
                , primaryButton [] "Normal" BasicNormal
                , primaryButton [] "Large" BasicLarge
                , primaryButton [] "Extra large" BasicExtraLarge
                ]
            , div [ class "preview secondary-button" ]
                [ h3 [ class "header" ] [ text "Secondary Buttons" ]
                , secondaryButton [] "Extra small" BasicExtraSmall
                , secondaryButton [] "Small" BasicSmall
                , secondaryButton [] "Normal" BasicNormal
                , secondaryButton [] "Large" BasicLarge
                , secondaryButton [] "Extra large" BasicExtraLarge
                ]
            , div [ class "preview white-button" ]
                [ h3 [ class "header" ] [ text "White Buttons" ]
                , whiteButton [] "Extra small" BasicExtraSmall
                , whiteButton [] "Small" BasicSmall
                , whiteButton [] "Normal" BasicNormal
                , whiteButton [] "Large" BasicLarge
                , whiteButton [] "Extra large" BasicExtraLarge
                ]
            , div [ class "preview circular-button" ]
                [ h3 [ class "header" ] [ text "Circular Buttons" ]
                , Button.circular ( CircularExtraSmall, Icon.ArrowRight )
                , Button.circular ( CircularSmall, Icon.Annotation )
                , Button.circular ( CircularNormal, Icon.Plus )
                , Button.circular ( CircularLarge, Icon.Check )
                , Button.circular ( CircularExtraLarge, Icon.EmojiHappy )
                ]
            , div [ class "preview leading-button" ]
                [ h3 [ class "header" ] [ text "Leading Icon Buttons" ]
                , Button.leadingIcon ( LeadingSmall, "Small", Icon.Annotation )
                , Button.leadingIcon ( LeadingNormal, "Normal", Icon.EmojiHappy )
                , Button.leadingIcon ( LeadingLarge, "Large", Icon.Plus )
                , Button.leadingIcon ( LeadingExtraLarge, "Extra Large", Icon.Check )
                ]
            , div [ class "preview leading-button" ]
                [ h3 [ class "header" ] [ text "Trailing Icon Buttons" ]
                , Button.trailingIcon ( TrailingSmall, "Small", Icon.Annotation )
                , Button.trailingIcon ( TrailingNormal, "Normal", Icon.EmojiHappy )
                , Button.trailingIcon ( TrailingLarge, "Large", Icon.Plus )
                , Button.trailingIcon ( TrailingExtraLarge, "Extra Large", Icon.Check )
                ]

            -- insert other buttons here
            ]
        , div [ class "avatars" ]
            [ div [ class "preview circular-avatar" ]
                [ h3 [ class "header" ] [ text "Circular Avatar" ]
                , circular
                    ( CircularAvatarExtraSmall
                    , "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
                    , "Extra small"
                    )
                , circular
                    ( CircularAvatarSmall
                    , "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
                    , "Small"
                    )
                , circular
                    ( CircularAvatarNormal
                    , "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
                    , "Normal"
                    )
                , circular
                    ( CircularAvatarLarge
                    , "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
                    , "Large"
                    )
                , circular
                    ( CircularAvatarExtraLarge
                    , "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
                    , "Extra large"
                    )
                ]
            ]
        , div [ class "text" ]
            [ div [ class "preview project description" ]
                [ h3 [ class "header" ] [ text "Project description" ]
                , ProjectDescription.view model.projectDescriptionModel |> Html.map ProjDes
                ]
            ]
        ]


update : Msg -> Model -> ( Model, Cmd msg )
update msg model =
    case msg of
        ProjDes projDesMsg ->
            ( { model
                | projectDescriptionModel =
                    ProjectDescription.update projDesMsg model.projectDescriptionModel
              }
            , Cmd.none
            )


subscriptions : Model -> Sub msg
subscriptions _ =
    Sub.none
