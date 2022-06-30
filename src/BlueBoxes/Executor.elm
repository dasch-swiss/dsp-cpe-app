module BlueBoxes.Executor exposing (..)

import BlueBoxes.PageStructureModel as Struct
import DspCpeApi as Api
import Html exposing (Html, div, footer, header, main_)
import List exposing (map)
import Modules.NavigationHeader.NavigationHeader as NavigationHeader
import Modules.Projects.Focus.Focus as ProjectFocus
import Modules.Projects.TestPage as Test
import Modules.Text.ProjectDescription as ProjectDescription
import Util.CustomCss.DaschTailwind as Dtw
import Html.Attributes exposing (class)


type alias Model =
    { page : Struct.Page }


type Msg
    = ProjectDescriptionMsg ProjectDescription.Msg
    | ProjectFocusMsg ProjectFocus.Msg
    | AppHeaderMsg NavigationHeader.Msg


init : ( Model, Cmd Msg )
init =
    ( { page = Test.testPage }, Cmd.none )


execute : Struct.Page -> Html Msg
execute (Struct.Page pageParts) =
    div [] (map executePagePart pageParts)


executePagePart : Struct.PagePart -> Html Msg
executePagePart pagePart =
    case pagePart of
        Struct.PageHeader (Struct.Header headerPart) ->
            header
                [ class (Dtw.classList[Dtw.sticky, Dtw.top_0, Dtw.z_50, Dtw.mb_5]) ]
                (map executeHeaderPart headerPart)

        Struct.PageContent (Struct.Content contentPart) ->
            main_
                []
                (map executeContentPart contentPart)

        Struct.PageFooter (Struct.Footer footerPart) ->
            footer
                []
                (map executeFooterPart footerPart)


executeHeaderPart : Struct.HeaderPart -> Html Msg
executeHeaderPart headerPart =
    case headerPart of
        Struct.AppHeader headerModel ->
            Api.header headerModel
                |> Html.map AppHeaderMsg


executeContentPart : Struct.ContentPart -> Html Msg
executeContentPart contentPart =
    case contentPart of
        Struct.ProjectDescription projDescModel ->
            Api.projectDescription projDescModel
                |> Html.map ProjectDescriptionMsg

        Struct.ProjectFocus focusModel ->
            Api.focus focusModel
                |> Html.map ProjectFocusMsg


executeFooterPart : Struct.FooterPart -> Html Msg
executeFooterPart footerPart =
    case footerPart of
        Struct.AppFooter footerModel ->
            Api.footer footerModel


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
        Struct.PageHeader (Struct.Header headerParts) ->
            Struct.PageHeader (Struct.Header (map (updateHeaderPart msg) headerParts))

        Struct.PageContent (Struct.Content contentParts) ->
            Struct.PageContent (Struct.Content (map (updateContentPart msg) contentParts))

        Struct.PageFooter (Struct.Footer footerParts) ->
            Struct.PageFooter (Struct.Footer (map (updateFooterPart msg) footerParts))


updateHeaderPart : Msg -> Struct.HeaderPart -> Struct.HeaderPart
updateHeaderPart msg header =
    case header of
        Struct.AppHeader headerModel ->
            case msg of
                AppHeaderMsg headerMsg ->
                    Struct.AppHeader (NavigationHeader.update headerMsg headerModel)

                _ ->
                    header


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


updateFooterPart : Msg -> Struct.FooterPart -> Struct.FooterPart
updateFooterPart msg footer =
    case footer of
        Struct.AppFooter footerModel ->
            case msg of
                -- this currently doesn't do anything because nothing in the footer has an update function
                _ ->
                    footer
