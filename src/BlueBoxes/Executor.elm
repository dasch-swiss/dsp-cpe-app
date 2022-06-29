module BlueBoxes.Executor exposing (..)

import BlueBoxes.PageStructureModel as Struct
import DspCpeApi as Api
import Html exposing (Html, div, text)
import List exposing (map)
import Modules.Projects.Focus.Focus as ProjectFocus
import Modules.Projects.TestPage as Test
import Modules.Text.ProjectDescription as ProjectDescription


type alias Model =
    { page : Struct.Page }


type Msg
    = ProjectDescriptionMsg ProjectDescription.Msg
    | ProjectFocusMsg ProjectFocus.Msg


init : ( Model, Cmd Msg )
init =
    ( { page = Test.testPage }, Cmd.none )


execute : Struct.Page -> Html Msg
execute (Struct.Page pageParts) =
    div [] (map executePagePart pageParts)


executePagePart : Struct.PagePart -> Html Msg
executePagePart pagePart =
    case pagePart of
        Struct.PageContent (Struct.Content contentPart) ->
            div [] (map executeContentPart contentPart)



-- Struct.PageHeader (Struct.Header headerPart)->
--     [text ""]
-- Struct.PageFooter (Struct.Footer footerPart)->
--     text ""
-- { isOpen = False, text = "My Project", title = "Title", subtitle = "Subtitle" }


executeContentPart : Struct.ContentPart -> Html Msg
executeContentPart contentPart =
    case contentPart of
        Struct.ProjectDescription projDescModel ->
            Api.projectDescription projDescModel
                |> Html.map ProjectDescriptionMsg

        Struct.ProjectFocus focusModel ->
            Api.focus focusModel
                |> Html.map ProjectFocusMsg


view : Model -> Html Msg
view model =
    execute model.page


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case model.page of
        Struct.Page pageParts ->
            ( { model | page = Struct.Page (map (updatePagePart msg) pageParts) }, Cmd.none )


updatePagePart : Msg -> Struct.PagePart -> Struct.PagePart
updatePagePart msg pagePart =
    case pagePart of
        Struct.PageContent (Struct.Content contentParts) ->
            Struct.PageContent (Struct.Content (map (updateContentPart msg) contentParts))


updateContentPart : Msg -> Struct.ContentPart -> Struct.ContentPart
updateContentPart msg content =
    case content of
        Struct.ProjectDescription projModel ->
            case msg of
                ProjectDescriptionMsg projMsg ->
                    Struct.ProjectDescription (ProjectDescription.update projMsg projModel)

                _ ->
                    content

        Struct.ProjectFocus focusModel ->
            case msg of
                ProjectFocusMsg focusMsg ->
                    Struct.ProjectFocus (ProjectFocus.update focusMsg focusModel)

                _ ->
                    content
