module Modules.Projects.TailwindPlayground exposing (..)

import DspCpeApi as Api
import Html exposing (Html, div, h3, text)
import Html.Attributes exposing (class)

import Modules.Text.Accordion as Accordion
import Modules.Text.ProjectDescription as ProjectDescription
import Modules.Tiles.ImageTile as ImageTile
import Shared.SharedTypes exposing (BasicButtonSize(..), CircularAvatarSize(..), CircularButtonSize(..), LeadingSize(..), NavItem, TrailingSize(..))
import Util.Icon as Icon
import Projects.Focus.Focus as ProjectFocus

type alias Model =
    { text : String
    , projectDescriptionModel : ProjectDescription.Model
    , accordionModel : Accordion.Model
    , projectFocusModel : ProjectFocus.Model
    }


type Msg

    = ProjDesMsg ProjectDescription.Msg
    | AccordionMsg Accordion.Msg
    | ProjectFocusMsg ProjectFocus.Msg


initialModel : Model
initialModel =
    { text = "playground"
    , projectDescriptionModel = ProjectDescription.initialModel
    , accordionModel = exampleAccordion
    , projectFocusModel = ProjectFocus.initialModel
    }


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )


view : Model -> Html Msg
view model =
    div [ class "playground" ]
        [ div [ class "buttons" ]
            [ div [ class "preview primary-button" ]
                [ h3 [ class "label" ] [ text "Primary Buttons" ]
                , Api.primaryButton [] "Extra small" BasicExtraSmall
                , Api.primaryButton [] "Small" BasicSmall
                , Api.primaryButton [] "Normal" BasicNormal
                , Api.primaryButton [] "Large" BasicLarge
                , Api.primaryButton [] "Extra large" BasicExtraLarge
                ]
            , div [ class "preview secondary-button" ]
                [ h3 [ class "label" ] [ text "Secondary Buttons" ]
                , Api.secondaryButton [] "Extra small" BasicExtraSmall
                , Api.secondaryButton [] "Small" BasicSmall
                , Api.secondaryButton [] "Normal" BasicNormal
                , Api.secondaryButton [] "Large" BasicLarge
                , Api.secondaryButton [] "Extra large" BasicExtraLarge
                ]
            , div [ class "preview white-button" ]
                [ h3 [ class "label" ] [ text "White Buttons" ]
                , Api.whiteButton [] "Extra small" BasicExtraSmall
                , Api.whiteButton [] "Small" BasicSmall
                , Api.whiteButton [] "Normal" BasicNormal
                , Api.whiteButton [] "Large" BasicLarge
                , Api.whiteButton [] "Extra large" BasicExtraLarge
                ]
            , div [ class "preview circular-button" ]
                [ h3 [ class "label" ] [ text "Circular Buttons" ]
                , Api.circularButton CircularExtraSmall Icon.ArrowRight []
                , Api.circularButton CircularSmall Icon.Annotation []
                , Api.circularButton CircularNormal Icon.Plus []
                , Api.circularButton CircularLarge Icon.Check []
                , Api.circularButton CircularExtraLarge Icon.EmojiHappy []
                ]
            , div [ class "preview leading-button" ]
                [ h3 [ class "label" ] [ text "Leading Icon Buttons" ]
                , Api.leadingIconButton LeadingSmall "Small" Icon.Annotation []
                , Api.leadingIconButton LeadingNormal "Normal" Icon.EmojiHappy []
                , Api.leadingIconButton LeadingLarge "Large" Icon.Plus []
                , Api.leadingIconButton LeadingExtraLarge "Extra Large" Icon.Check []
                ]
            , div [ class "preview leading-button" ]
                [ h3 [ class "label" ] [ text "Trailing Icon Buttons" ]
                , Api.trailingIconButton TrailingSmall "Small" Icon.Annotation []
                , Api.trailingIconButton TrailingNormal "Normal" Icon.EmojiHappy []
                , Api.trailingIconButton TrailingLarge "Large" Icon.Plus []
                , Api.trailingIconButton TrailingExtraLarge "Extra Large" Icon.Check []
                ]

            -- insert other buttons here
            ]
        , div [ class "avatars" ]
            [ div [ class "preview circular-avatar" ]
                [ h3 [ class "label" ] [ text "Circular Avatar" ]
                , Api.circularAvatar
                    CircularAvatarExtraSmall
                    "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
                    "Extra small"
                    []
                , Api.circularAvatar
                    CircularAvatarSmall
                    "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
                    "Small"
                    []
                , Api.circularAvatar
                    CircularAvatarNormal
                    "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
                    "Normal"
                    []
                , Api.circularAvatar
                    CircularAvatarLarge
                    "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
                    "Large"
                    []
                , Api.circularAvatar
                    CircularAvatarExtraLarge
                    "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
                    "Extra large"
                    []
                ]
            ]
        , div [ class "label" ]
            [ h3 [] [ text "Header module signed in" ]
            , div [] []
            , div [] [ Api.header "https://beol.dasch.swiss/assets/images/beol-logo.png" fakeUser [ someNavitem, otherNavitem ] True ]
            ]
        , div [ class "label" ]
            [ h3 [] [ text "Header module signed out" ]
            , div [] []
            , div [] [ Api.header "https://beol.dasch.swiss/assets/images/beol-logo.png" Nothing [ someNavitem, otherNavitem ] True ]
            ]
        , div [ class "text" ]
            [ div [ class "preview project description" ]
                [ h3 [ class "label" ] [ text "Project description" ]
                , Api.projectDescription model.projectDescriptionModel.isOpen model.projectDescriptionModel.text |> Html.map ProjDes
                ]
            ]
        , div [ class "accordion" ]
            [ div []
                [ h3 [ class "label" ] [ text "Accordion" ]
                , Api.accordion model.accordionModel.isOpen model.accordionModel.text model.accordionModel.size |> Html.map AccordionMsg
                ]
            ]
        , div [ class "tiles" ]
            [ div [ class "preview tiles" ]
                [ h3 [ class "label" ] [ text "Image Tile Grid" ]
                , Api.imageTileGrid [ exampleImageTile, exampleImageTile, exampleImageTile, exampleImageTile, exampleImageTile, exampleImageTile ]
                ]
            ]
        , div [ class "project-focus" ]
            [ ProjectFocus.view model.projectFocusModel |> Html.map ProjectFocusMsg
            ]
        , div [ class "footer" ]
            [ div []
                [ h3 [ class "label" ] [ text "Footer" ]
                , Api.footer "© 2022 DaSCH" "Contact Us" "mailto:info@dasch.swiss" "/assets/images/license-cc-beol.jpg"
                ]
            ]
        ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ProjDesMsg projDesMsg ->
            ( { model
                | projectDescriptionModel =
                    ProjectDescription.update projDesMsg model.projectDescriptionModel
              }
            , Cmd.none
            )

        AccordionMsg accordionMsg ->
            ( { model
                | accordionModel =
                    Accordion.update accordionMsg model.accordionModel
              }
            , Cmd.none
            )

        ProjectFocusMsg projectFocusMsg ->
            let
                ( newModel, _ ) =
                    ProjectFocus.update projectFocusMsg model.projectFocusModel
            in
            ( { model
                | projectFocusModel =
                    newModel
              }
            , Cmd.none
            )


subscriptions : Model -> Sub msg
subscriptions _ =
    Sub.none



-- Navigation header data ...


exampleImageTile : ImageTile.Model
exampleImageTile =
    { src = "https://images.unsplash.com/photo-1582053433976-25c00369fc93?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=512&q=80", alt = "", buttonAlt = "View details for IMG_4985.HEIC", title = "IMG_4985.HEIC", subtitle = "3.9 MB", url = "project/1" }



-- Use only if trying to display GravsearchCountViewer. Disabled for now since it is not production ready
-- exampleGravCount : GravsearchCountViewer.Model
-- exampleGravCount =
--    { query = "PREFIX knora-api: <http://api.knora.org/ontology/knora-api/v2#>CONSTRUCT {?person knora-api:isMainResource true .} WHERE {?person a knora-api:Resource .}", result = Nothing, error = Nothing }


exampleAccordion : Accordion.Model
exampleAccordion =
    { isOpen = False
    , text = """Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus 
            est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, 
            no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. 
            Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, 
            vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod 
            tincidunt ut laoreet dolore magna aliquam erat volutpat."""
    , size = Accordion.FullWidth
    }


someNavitem : NavItem msg
someNavitem =
    { attrs = [], text = "Dasch", href = "https://www.dasch.swiss", cmd = Cmd.none, isActive = True }


otherNavitem : NavItem msg
otherNavitem =
    { attrs = [], text = "Beol", href = "project/1", cmd = Cmd.none, isActive = False }


fakeUser : Maybe { uId : String, uImg : String }
fakeUser =
    Just
        { uId = "sthId"
        , uImg = "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
        }
