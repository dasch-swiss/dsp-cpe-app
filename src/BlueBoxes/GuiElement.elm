module BlueBoxes.GuiElement exposing (..)

import Html exposing (Html)
import Modules.Text.Accordion as Accordion
import Modules.Text.ProjectDescription as ProjectDescription


type alias Model =
    { variant : GuiElementVariant }


type GuiElementVariant
    = ProjectDescriptionElement ProjectDescription.Model
    | AccordionElement Accordion.Model


type Msg
    = ProjectDescriptionMsg ProjectDescription.Msg
    | AccordionMsg Accordion.Msg


view : Model -> Html Msg
view model =
    case model.variant of
        ProjectDescriptionElement projDescModel ->
            ProjectDescription.view projDescModel |> Html.map ProjectDescriptionMsg

        AccordionElement accModel ->
            Accordion.view accModel |> Html.map AccordionMsg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ProjectDescriptionMsg projDescMsg ->
            case model.variant of
                ProjectDescriptionElement projDescModel ->
                    let
                        ( newModel, newCmd ) =
                            ProjectDescription.update projDescMsg projDescModel
                    in
                    ( { variant = ProjectDescriptionElement newModel }, Cmd.map ProjectDescriptionMsg newCmd )

                _ ->
                    ( model, Cmd.none )

        AccordionMsg accMsg ->
            case model.variant of
                AccordionElement accModel ->
                    let
                        ( newModel, newCmd ) =
                            Accordion.update accMsg accModel
                    in
                    ( { variant = AccordionElement newModel }, Cmd.map AccordionMsg newCmd )

                _ ->
                    ( model, Cmd.none )
