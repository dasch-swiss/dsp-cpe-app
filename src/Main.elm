module Main exposing (..)

import Browser exposing (Document, UrlRequest)
import Browser.Navigation as Nav
import Html exposing (Html, h3, text)
import Modules.Projects.ListProjects as ListProjects exposing (..)
import Modules.Projects.TailwindPlayground as Playground exposing (view)
import Modules.Projects.ViewProject as ViewProject exposing (view)
import Url exposing (Url)
import Util.Route exposing (Route(..))


type alias Model =
    { route : Route -- current route
    , page : Page -- current page
    , navKey : Nav.Key -- provided by elm at runtime, needed for navigation
    }


type Page
    = NotFoundPage
    | ListProjectsPage ListProjects.Model
    | ViewProjectPage ViewProject.Model
    | PlaygroundPage Playground.Model



-- each page in the app has it's own Msg type
-- Main doesn't handle any page specific messages, it simply forwards them to the correct page module


type Msg
    = ListProjectsPageMsg ListProjects.Msg
    | ViewProjectPageMsg ViewProject.Msg
    | PlaygroundPageMsg Playground.Msg
    | LinkClicked UrlRequest
    | UrlChanged Url



-- init main model and current page


init : () -> Url -> Nav.Key -> ( Model, Cmd Msg )
init _ url navKey =
    let
        model =
            { route = Util.Route.parseUrl url
            , page = NotFoundPage
            , navKey = navKey
            }
    in
    initCurrentPage ( model, Cmd.none )



-- init the current page based upon the current route


initCurrentPage : ( Model, Cmd Msg ) -> ( Model, Cmd Msg )
initCurrentPage ( model, existingCmds ) =
    let
        ( currentPage, mappedPageCmds ) =
            case model.route of
                NotFound ->
                    ( NotFoundPage, Cmd.none )

                Projects ->
                    let
                        ( pageModel, pageCmds ) =
                            ListProjects.init model.navKey
                    in
                    ( ListProjectsPage pageModel, Cmd.map ListProjectsPageMsg pageCmds )

                Project projectId ->
                    let
                        ( pageModel, pageCmds ) =
                            ViewProject.init projectId model.navKey
                    in
                    ( ViewProjectPage pageModel, Cmd.map ViewProjectPageMsg pageCmds )

                Playground ->
                    let
                        ( pageModel, pageCmds ) =
                            Playground.init
                    in
                    ( PlaygroundPage pageModel, Cmd.map PlaygroundPageMsg pageCmds )
    in
    ( { model | page = currentPage }
    , Cmd.batch [ existingCmds, mappedPageCmds ]
      -- take a list of commands and batch them together so that we can hand them all to the runtime at the same time. The runtime then executes them in an arbitrary order.
    )


view : Model -> Document Msg
view model =
    { title = "Projects App"
    , body = [ currentView model ]
    }



-- change view depending on the current page stored in the model


currentView : Model -> Html Msg
currentView model =
    case model.page of
        NotFoundPage ->
            notFoundView

        ListProjectsPage pageModel ->
            ListProjects.view pageModel
                |> Html.map ListProjectsPageMsg

        ViewProjectPage pageModel ->
            ViewProject.view pageModel
                |> Html.map ViewProjectPageMsg

        PlaygroundPage pageModel ->
            Playground.view pageModel
                |> Html.map PlaygroundPageMsg


notFoundView : Html msg
notFoundView =
    h3 [] [ text "Page not found" ]



-- call the current pages update method with the forwarded Msg
-- also handles Msg from Main, namely LinkClicked and UrlChanged


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case ( msg, model.page ) of
        ( ListProjectsPageMsg subMsg, ListProjectsPage pageModel ) ->
            let
                ( updatedPageModel, updatedCmd ) =
                    ListProjects.update subMsg pageModel
            in
            ( { model | page = ListProjectsPage updatedPageModel }
            , Cmd.map ListProjectsPageMsg updatedCmd
            )

        ( ViewProjectPageMsg subMsg, ViewProjectPage pageModel ) ->
            let
                ( updatedPageModel, updatedCmd ) =
                    ViewProject.update subMsg pageModel
            in
            ( { model | page = ViewProjectPage updatedPageModel }
            , Cmd.map ViewProjectPageMsg updatedCmd
            )

        ( PlaygroundPageMsg subMsg, PlaygroundPage pageModel ) ->
            let
                ( updatedPageModel, updatedCmd ) =
                    Playground.update subMsg pageModel
            in
            ( { model | page = PlaygroundPage updatedPageModel }
            , Cmd.map PlaygroundPageMsg updatedCmd
            )

        ( LinkClicked urlRequest, _ ) ->
            case urlRequest of
                Browser.Internal url ->
                    ( model
                    , Nav.pushUrl model.navKey (Url.toString url)
                    )

                Browser.External url ->
                    ( model
                    , Nav.load url
                    )

        ( UrlChanged url, _ ) ->
            let
                newRoute =
                    Util.Route.parseUrl url
            in
            ( { model | route = newRoute }, Cmd.none )
                |> initCurrentPage

        ( _, _ ) ->
            ( model, Cmd.none )


main : Program () Model Msg
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        , onUrlRequest = LinkClicked
        , onUrlChange = UrlChanged
        }
