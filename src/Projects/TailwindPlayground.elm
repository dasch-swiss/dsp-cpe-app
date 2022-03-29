module Projects.TailwindPlayground exposing (..)

import Avatars.Avatar exposing (circular)
import Avatars.CircularAvatar exposing (CircularAvatarSize(..))
import Buttons.BasicButtons.BasicButton exposing (BasicButtonSize(..))
import Buttons.Button exposing (circularButtonUnstyled, leadingIconButtonUnstyled, primaryButtonUnStyled, secondaryButtonUnStyled, trailingIconUnstyled, whiteButtonUnstyled)
import Buttons.CircularButton exposing (CircularButtonSize(..))
import Buttons.LeadingIconButton exposing (LeadingSize(..))
import Buttons.TrailingIconButton exposing (TrailingSize(..))
import Html exposing (Html, div, h3, text)
import Html.Attributes exposing (class)
import Icon as Icon
import NavigationHeader.HeaderModule exposing (cpeHeader)
import NavigationHeader.Navitem exposing (NavItem)
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
                , primaryButtonUnStyled [] "Extra small" BasicExtraSmall
                , primaryButtonUnStyled [] "Small" BasicSmall
                , primaryButtonUnStyled [] "Normal" BasicNormal
                , primaryButtonUnStyled [] "Large" BasicLarge
                , primaryButtonUnStyled [] "Extra large" BasicExtraLarge
                ]
            , div [ class "preview secondary-button" ]
                [ h3 [ class "header" ] [ text "Secondary Buttons" ]
                , secondaryButtonUnStyled [] "Extra small" BasicExtraSmall
                , secondaryButtonUnStyled [] "Small" BasicSmall
                , secondaryButtonUnStyled [] "Normal" BasicNormal
                , secondaryButtonUnStyled [] "Large" BasicLarge
                , secondaryButtonUnStyled [] "Extra large" BasicExtraLarge
                ]
            , div [ class "preview white-button" ]
                [ h3 [ class "header" ] [ text "White Buttons" ]
                , whiteButtonUnstyled [] "Extra small" BasicExtraSmall
                , whiteButtonUnstyled [] "Small" BasicSmall
                , whiteButtonUnstyled [] "Normal" BasicNormal
                , whiteButtonUnstyled [] "Large" BasicLarge
                , whiteButtonUnstyled [] "Extra large" BasicExtraLarge
                ]
            , div [ class "preview circular-button" ]
                [ h3 [ class "header" ] [ text "Circular Buttons" ]
                , circularButtonUnstyled [] Icon.ArrowRight CircularExtraSmall
                , circularButtonUnstyled [] Icon.Annotation CircularSmall
                , circularButtonUnstyled [] Icon.Plus CircularNormal
                , circularButtonUnstyled [] Icon.Check CircularLarge
                , circularButtonUnstyled [] Icon.EmojiHappy CircularExtraLarge
                ]
            , div [ class "preview leading-button" ]
                [ h3 [ class "header" ] [ text "Leading Icon Buttons" ]
                , leadingIconButtonUnstyled [] LeadingSmall "Small" Icon.Annotation
                , leadingIconButtonUnstyled [] LeadingNormal "Normal" Icon.EmojiHappy
                , leadingIconButtonUnstyled [] LeadingLarge "Large" Icon.Plus
                , leadingIconButtonUnstyled [] LeadingExtraLarge "Extra Large" Icon.Check
                ]
            , div [ class "preview leading-button" ]
                [ h3 [ class "header" ] [ text "Trailing Icon Buttons" ]
                , trailingIconUnstyled [] TrailingSmall "Small" Icon.Annotation
                , trailingIconUnstyled [] TrailingNormal "Normal" Icon.EmojiHappy
                , trailingIconUnstyled [] TrailingLarge "Large" Icon.Plus
                , trailingIconUnstyled [] TrailingExtraLarge "Extra Large" Icon.Check
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
        , div [ class "header" ]
            [ h3 [] [ text "Header module" ]
            , div [] []
            , div [] [ cpeHeader "https://beol.dasch.swiss/assets/images/beol-logo.png" False [ someNavitem, otherNavitem ] True ]
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



-- Navigation header data ...


someNavitem : NavItem msg
someNavitem =
    { attrs = [], text = "Dasch", href = "https://www.dasch.swiss", cmd = Cmd.none, isActive = True }


otherNavitem : NavItem msg
otherNavitem =
    { attrs = [], text = "Beol", href = "project/1", cmd = Cmd.none, isActive = False }
