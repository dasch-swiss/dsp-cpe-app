module BlueBoxes.NewExecutor exposing (..)

import BlueBoxes.NewPageStructureModel as Struct
import DspCpeApi as Api
import Html exposing (Html, div, footer, header, main_)
import Html.Attributes exposing (class)
import List exposing (map)
import Modules.Projects.NewTestPage as NewTest
import Modules.Text.ProjectDescription as ProjectDescription
import Shared.SharedTypes exposing (WidgetInstanceId(..))


type alias Model =
    { page : Struct.Page }


type Msg =
    ProjDescMsg ProjectDescription.Msg

init : ( Model, Cmd msg )
init =
    ( { page = NewTest.testPage }, Cmd.none )


execute : Struct.Page -> Html Msg
execute (Struct.Page pageParts) =
    div [] (map executePagePart pageParts)


executePagePart : Struct.PagePart -> Html Msg
executePagePart pagePart =
    case pagePart of

        Struct.PageContent (Struct.Content contentPart) ->
            main_
                []
                (map executeContentPart contentPart)



executeContentPart : Struct.ContentPart -> Html Msg
executeContentPart contentPart =
    case contentPart of
        Struct.ProjectDescription wid ->
            div [] []


executeNewProjectDescription : WidgetInstanceId -> (ProjectDescription.Model, Cmd ProjectDescription.Msg)
executeNewProjectDescription wid =
    Api.newProjectDescription wid

fakeProjectDescription : WidgetInstanceId -> { isOpen : Bool, id : WidgetInstanceId }
fakeProjectDescription wid = { isOpen = False, id = wid }


view : Model -> Html Msg
view model =
    execute model.page