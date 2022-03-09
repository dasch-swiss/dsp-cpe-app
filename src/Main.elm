module Main exposing (..)

import Browser exposing (Document, UrlRequest)
import Browser.Navigation as Nav
import Html exposing (Html, div, h3, text)
import Html.Attributes exposing (class)
import Projects.ListProjects as ListProjects exposing (..)
import Projects.TailwindPlayground as Playground exposing (view)
import Projects.Beol as Beol exposing (view)
import Projects.ViewProject as ViewProject exposing (view)
import Route exposing (Route)
import Url exposing (Url)


type alias Model =
    { route : Route
    , page : Page
    , navKey : Nav.Key
    }


type Page
    = NotFoundPage
    | ListPage ListProjects.Model
    | PlaygroundPage Playground.Model
    | BeolPage Beol.Model
    | ViewProjectPage ViewProject.Model


type Msg
    = ListPageMsg ListProjects.Msg
    | PlaygroundPageMsg Playground.Msg
    | BeolPageMsg Beol.Msg
    | ViewProjectPageMsg ViewProject.Msg
    | LinkClicked UrlRequest
    | UrlChanged Url


init : () -> Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url navKey =
    let
        model =
            { route = Route.parseUrl url
            , page = NotFoundPage
            , navKey = navKey
            }
    in
    initCurrentPage ( model, Cmd.none )


initCurrentPage : ( Model, Cmd Msg ) -> ( Model, Cmd Msg )
initCurrentPage ( model, existingCmds ) =
    let
        ( currentPage, mappedPageCmds ) =
            case model.route of
                Route.NotFound ->
                    ( NotFoundPage, Cmd.none )

                Route.Projects ->
                    let
                        ( pageModel, pageCmds ) =
                            ListProjects.init model.navKey
                    in
                    ( ListPage pageModel, Cmd.map ListPageMsg pageCmds )

                Route.Playground ->
                    let
                        ( pageModel, pageCmds ) =
                            Playground.init
                    in
                    ( PlaygroundPage pageModel, Cmd.map PlaygroundPageMsg pageCmds )

                Route.Beol ->
                    let
                        ( pageModel, pageCmds ) =
                            Beol.init
                    in
                    ( BeolPage pageModel, Cmd.map BeolPageMsg pageCmds )

                Route.Project projectId ->
                    let
                        ( pageModel, pageCmds ) =
                            ViewProject.init projectId model.navKey
                    in
                    ( ViewProjectPage pageModel, Cmd.map ViewProjectPageMsg pageCmds )
    in
    ( { model | page = currentPage }
    , Cmd.batch [ existingCmds, mappedPageCmds ]
    )


view : Model -> Document Msg
view model =
    { title = "Projects App"
    , body = [ currentView model ]
    }


currentView : Model -> Html Msg
currentView model =
    case model.page of
        NotFoundPage ->
            notFoundView

        ListPage pageModel ->
            ListProjects.view pageModel
                |> Html.map ListPageMsg

        PlaygroundPage pageModel ->
            Playground.view pageModel
                |> Html.map PlaygroundPageMsg

        BeolPage pageModel ->
            Beol.view pageModel
                |> Html.map BeolPageMsg

        ViewProjectPage pageModel ->
            ViewProject.view pageModel
                |> Html.map ViewProjectPageMsg


notFoundView : Html msg
notFoundView =
    h3 [] [ text "Page not found" ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case ( msg, model.page ) of
        ( ListPageMsg subMsg, ListPage pageModel ) ->
            let
                ( updatedPageModel, updatedCmd ) =
                    ListProjects.update subMsg pageModel
            in
            ( { model | page = ListPage updatedPageModel }
            , Cmd.map ListPageMsg updatedCmd
            )
        
        ( PlaygroundPageMsg subMsg, PlaygroundPage pageModel ) ->
            let
                ( updatedPageModel, updatedCmd ) =
                    Playground.update subMsg pageModel
            in
            ( { model | page = PlaygroundPage updatedPageModel }
            , Cmd.map PlaygroundPageMsg updatedCmd
            )

        ( BeolPageMsg subMsg, BeolPage pageModel ) ->
            let
                ( updatedPageModel, updatedCmd ) =
                    Beol.update subMsg pageModel
            in
            ( { model | page = BeolPage updatedPageModel }
            , Cmd.map BeolPageMsg updatedCmd
            )

        ( ViewProjectPageMsg subMsg, ViewProjectPage pageModel ) ->
            let
                ( updatedPageModel, updatedCmd ) =
                    ViewProject.update subMsg pageModel
            in
            ( { model | page = ViewProjectPage updatedPageModel }
            , Cmd.map ViewProjectPageMsg updatedCmd
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
                    Route.parseUrl url
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
