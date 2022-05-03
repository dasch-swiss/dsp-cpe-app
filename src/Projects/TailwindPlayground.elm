module Projects.TailwindPlayground exposing (..)

import Avatars.Avatar exposing (circular)
import Avatars.CircularAvatar exposing (CircularAvatarSize(..))
import Buttons.BasicButtons.BasicButton exposing (BasicButtonSize(..))
import Buttons.Button as Button exposing (primaryButton, secondaryButton, whiteButton)
import Buttons.CircularButton exposing (CircularButtonSize(..))
import Buttons.LeadingIconButton exposing (LeadingSize(..))
import Buttons.TrailingIconButton exposing (TrailingSize(..))
import Html exposing (div, h3, text)
import Html.Attributes exposing (class)
import Icon as Icon
import NavigationHeader.Model as H
import NavigationHeader.Update as HU
import NavigationHeader.View as Header exposing (..)
import Footer.Footer as Footer
import GravsearchViewer.GravsearchCountViewer as GravsearchCountViewer exposing (Count)
import Html exposing (Html, div, h3, text)
import Html.Attributes exposing (class)
import Icon as Icon
import NavigationHeader.HeaderModule exposing (cpeHeader)
import NavigationHeader.Navitem exposing (NavItem)
import Text.Accordion as Accordion
import Text.ProjectDescription as ProjectDescription
import Tiles.ImageTile as ImageTile
import Tiles.ImageTileGrid as ImageTileGrid


type alias Model =
    { text : String
    , projectDescriptionModel : ProjectDescription.Model
    , headerModel : H.HeaderModel
    , countviewerModel : GravsearchCountViewer.Model
    , accordionModel : Accordion.Model
    }


type Msg
    = ProjDes ProjectDescription.Msg
    | HeaderModuleMsg H.Msg
    | CountMsg GravsearchCountViewer.Msg
    | AccordionMsg Accordion.Msg


initialModel : Model
initialModel =
    { text = "playground"
    , projectDescriptionModel = ProjectDescription.initialModel
    , headerModel = header
    , countviewerModel = exampleGravCount
    , accordionModel = Accordion.initialModel
    }


init : ( Model, Cmd msg )
init =
    ( initialModel, Cmd.none )


view model =
    div [ class "playground" ]
        [ div [ class "buttons" ]
            [ div [ class "preview primary-button" ]
                [ h3 [ class "label" ] [ text "Primary Buttons" ]
                , primaryButton [] "Extra small" BasicExtraSmall
                , primaryButton [] "Small" BasicSmall
                , primaryButton [] "Normal" BasicNormal
                , primaryButton [] "Large" BasicLarge
                , primaryButton [] "Extra large" BasicExtraLarge
                ]
            , div [ class "preview secondary-button" ]
                [ h3 [ class "label" ] [ text "Secondary Buttons" ]
                , secondaryButton [] "Extra small" BasicExtraSmall
                , secondaryButton [] "Small" BasicSmall
                , secondaryButton [] "Normal" BasicNormal
                , secondaryButton [] "Large" BasicLarge
                , secondaryButton [] "Extra large" BasicExtraLarge
                ]
            , div [ class "preview white-button" ]
                [ h3 [ class "label" ] [ text "White Buttons" ]
                , whiteButton [] "Extra small" BasicExtraSmall
                , whiteButton [] "Small" BasicSmall
                , whiteButton [] "Normal" BasicNormal
                , whiteButton [] "Large" BasicLarge
                , whiteButton [] "Extra large" BasicExtraLarge
                ]
            , div [ class "preview circular-button" ]
                [ h3 [ class "label" ] [ text "Circular Buttons" ]
                , Button.circularButton CircularExtraSmall Icon.ArrowRight []
                , Button.circularButton CircularSmall Icon.Annotation []
                , Button.circularButton CircularNormal Icon.Plus []
                , Button.circularButton CircularLarge Icon.Check []
                , Button.circularButton CircularExtraLarge Icon.EmojiHappy []
                ]
            , div [ class "preview leading-button" ]
                [ h3 [ class "label" ] [ text "Leading Icon Buttons" ]
                , Button.leadingIcon LeadingSmall "Small" Icon.Annotation []
                , Button.leadingIcon LeadingNormal "Normal" Icon.EmojiHappy []
                , Button.leadingIcon LeadingLarge "Large" Icon.Plus []
                , Button.leadingIcon LeadingExtraLarge "Extra Large" Icon.Check []
                ]
            , div [ class "preview leading-button" ]
                [ h3 [ class "label" ] [ text "Trailing Icon Buttons" ]
                , Button.trailingIcon TrailingSmall "Small" Icon.Annotation []
                , Button.trailingIcon TrailingNormal "Normal" Icon.EmojiHappy []
                , Button.trailingIcon TrailingLarge "Large" Icon.Plus []
                , Button.trailingIcon TrailingExtraLarge "Extra Large" Icon.Check []
                ]

            -- insert other buttons here
            ]
        , div [ class "avatars" ]
            [ div [ class "preview circular-avatar" ]
                [ h3 [ class "label" ] [ text "Circular Avatar" ]
                , circular
                    CircularAvatarExtraSmall
                    "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
                    "Extra small"
                    []
                , circular
                    CircularAvatarSmall
                    "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
                    "Small"
                    []
                , circular
                    CircularAvatarNormal
                    "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
                    "Normal"
                    []
                , circular
                    CircularAvatarLarge
                    "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
                    "Large"
                    []
                , circular
                    CircularAvatarExtraLarge
                    "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
                    "Extra large"
                    []
                ]
            ]
        , div [ class "header" ]
            [ h3 [] [ text "new header module" ]
            , div [] []
            , div [] [ Header.view model.headerModel |> Html.map HeaderModuleMsg ]
            ]
        , div [ class "text" ]
            [ div [ class "preview project description" ]
                [ h3 [ class "label" ] [ text "Project description" ]
                , ProjectDescription.view model.projectDescriptionModel |> Html.map ProjDes
                ]
            ]
        , div [ class "accordion" ]
            [ div []
                [ h3 [ class "label" ] [ text "Accordion" ]
                , Accordion.view model.accordionModel |> Html.map AccordionMsg
                ]
            ]
        , div [ class "tiles" ]
            [ div [ class "preview tiles" ]
                [ h3 [ class "label" ] [ text "Image Tile Grid" ]
                , ImageTileGrid.view { tiles = [ exampleImageTile, exampleImageTile, exampleImageTile, exampleImageTile, exampleImageTile, exampleImageTile ] }
                ]
            ]
        , div [ class "footer" ]
            [ div []
                [ h3 [ class "label" ] [ text "Footer" ]
                , Footer.view { copyrightText = "© 2022 DaSCH", contactUsText = "Contact Us", contactUsUrl = "mailto:info@dasch.swiss", licensingFilePath = "/assets/images/license-cc-beol.jpg" }
                ]
            ]
        , div [ class "tiles" ]
            [ div [ class "preview tiles" ]
                [ h3 [ class "label" ] [ text "Gravsearch" ]
                , GravsearchCountViewer.view model.countviewerModel |> Html.map CountMsg
                ]
            ]
        ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ProjDes projDesMsg ->
            ( { model
                | projectDescriptionModel =
                    ProjectDescription.update projDesMsg model.projectDescriptionModel
              }
            , Cmd.none
            )

        HeaderModuleMsg headerMsg ->
            ( { model
                | headerModel =
                    HU.update headerMsg model.headerModel
        CountMsg countMsg ->
            let
                ( newModel, newCmd ) =
                    GravsearchCountViewer.update countMsg model.countviewerModel
            in
            ( { model
                | countviewerModel =
                    newModel
              }
            , Cmd.map CountMsg newCmd
            )

        AccordionMsg accordionMsg ->
            ( { model
                | accordionModel =
                    Accordion.update accordionMsg model.accordionModel
              }
            , Cmd.none
            )


subscriptions : Model -> Sub msg
subscriptions _ =
    Sub.none



-- Navigation header data ...


header : H.HeaderModel
header =
    { logo = "https://beol.dasch.swiss/assets/images/beol-logo.png"
    , user = someUser
    , navBar = [ someNavitem, otherNavitem ]
    , showSearchBar = False
    }


someNavitem : H.NavItem
someNavitem =
    { attrs = [], text = "Dasch", href = "https://www.dasch.swiss", cmd = Cmd.none, isActive = True }


otherNavitem : H.NavItem
otherNavitem =
    { attrs = [], text = "Beol", href = "project/1", cmd = Cmd.none, isActive = False }


someUser : Maybe { uId : String, uImg : String }
someUser =
    Just
        { uId = "someId"
        , uImg = "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
        }
