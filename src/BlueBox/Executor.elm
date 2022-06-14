module BlueBox.Executor exposing (..)

import BestPageEver
import BlueBox.ProjectInterfaceStructureModel as Struct
import Browser.Navigation as Nav
import DspCpeApi as Api exposing (iconButtonDivider, projectDescription)
import Html exposing (div)
import List exposing (map)
import Modules.Buttons.BackButton as BackButton
import Modules.NavigationHeader.NavigationHeader as NavigationHeader
import Modules.Projects.Focus.Focus as Focus
import Modules.Projects.TailwindPlayground exposing (Msg(..))
import Modules.Text.Accordion as Accordion
import Modules.Text.ProjectDescription as ProjectDescription


type Msg
    = NavigationHeaderMsg NavigationHeader.Msg
    | ProjectDescriptionMsg ProjectDescription.Msg
    | AccordionMsg Accordion.Msg
    | FocusMsg Focus.Msg
    | BackButtonMsg BackButton.Msg


execute : Struct.Model Msg -> Html.Html Msg
execute model =
    div []
        [ executeHeader model.header
        , executeBody model.body
        , executeFooter model.footer
        ]


initTest : Struct.Model msg
initTest =
    BestPageEver.bestPage


executeHeader : Struct.Header Msg -> Html.Html Msg
executeHeader header =
    let
        circularAvatars =
            case header.circularAvatars of
                Just avatars ->
                    map Api.circularAvatar avatars

                Nothing ->
                    []

        primaryBtns =
            case header.primaryButtons of
                Just buttons ->
                    map Api.primaryButton buttons

                Nothing ->
                    []

        secondaryBtns =
            case header.secondaryButtons of
                Just buttons ->
                    map Api.secondaryButton buttons

                Nothing ->
                    []

        whiteBtns =
            case header.whiteButtons of
                Just buttons ->
                    map Api.whiteButton buttons

                Nothing ->
                    []

        circularBtns =
            case header.circularButtons of
                Just buttons ->
                    map Api.circularButton buttons

                Nothing ->
                    []

        leadingIconBtns =
            case header.leadingIconButtons of
                Just buttons ->
                    map Api.leadingIconButton buttons

                Nothing ->
                    []

        trailingIconBtns =
            case header.trailingIconButtons of
                Just buttons ->
                    map Api.trailingIconButton buttons

                Nothing ->
                    []

        headerHtml =
            case header.header of
                Just h ->
                    [ Api.header h |> Html.map NavigationHeaderMsg ]

                Nothing ->
                    []
    in
    div [] (circularAvatars ++ primaryBtns ++ secondaryBtns ++ whiteBtns ++ circularBtns ++ leadingIconBtns ++ trailingIconBtns ++ headerHtml)


executeBody : Struct.Body Msg -> Html.Html Msg
executeBody body =
    let
        circularAvatars =
            case body.circularAvatars of
                Just avatars ->
                    map Api.circularAvatar avatars

                Nothing ->
                    []

        primaryBtns =
            case body.primaryButtons of
                Just buttons ->
                    map Api.primaryButton buttons

                Nothing ->
                    []

        secondaryBtns =
            case body.secondaryButtons of
                Just buttons ->
                    map Api.secondaryButton buttons

                Nothing ->
                    []

        whiteBtns =
            case body.whiteButtons of
                Just buttons ->
                    map Api.whiteButton buttons

                Nothing ->
                    []

        circularBtns =
            case body.circularButtons of
                Just buttons ->
                    map Api.circularButton buttons

                Nothing ->
                    []

        leadingIconBtns =
            case body.leadingIconButtons of
                Just buttons ->
                    map Api.leadingIconButton buttons

                Nothing ->
                    []

        trailingIconBtns =
            case body.trailingIconButtons of
                Just buttons ->
                    map Api.trailingIconButton buttons

                Nothing ->
                    []

        iconButtonDividers =
            case body.iconButtonDividers of
                Just divider ->
                    map Api.iconButtonDivider divider

                Nothing ->
                    []

        projectDescriptions =
            case body.projectDescriptions of
                Just projDescs ->
                    map Api.projectDescription projDescs |> map (Html.map ProjectDescriptionMsg)

                Nothing ->
                    []

        accordions =
            case body.accordions of
                Just accs ->
                    map Api.accordion accs |> map (Html.map AccordionMsg)

                Nothing ->
                    []

        imgTileGrids =
            case body.imageTileGrids of
                Just itg ->
                    map Api.imageTileGrid itg

                Nothing ->
                    []

        focuses =
            case body.focuses of
                Just f ->
                    map Api.focus f |> map (Html.map FocusMsg)

                Nothing ->
                    []

        back =
            case body.back of
                Just _ ->
                    [ Api.back |> Html.map BackButtonMsg ]

                Nothing ->
                    []
    in
    div []
        (circularAvatars
            ++ primaryBtns
            ++ secondaryBtns
            ++ whiteBtns
            ++ circularBtns
            ++ leadingIconBtns
            ++ trailingIconBtns
            ++ iconButtonDividers
            ++ projectDescriptions
            ++ accordions
            ++ imgTileGrids
            ++ focuses
            ++ back
        )


executeFooter : Struct.Footer Msg -> Html.Html Msg
executeFooter footer =
    let
        circularAvatars =
            case footer.circularAvatars of
                Just avatars ->
                    map Api.circularAvatar avatars

                Nothing ->
                    []

        primaryBtns =
            case footer.primaryButtons of
                Just buttons ->
                    map Api.primaryButton buttons

                Nothing ->
                    []

        secondaryBtns =
            case footer.secondaryButtons of
                Just buttons ->
                    map Api.secondaryButton buttons

                Nothing ->
                    []

        whiteBtns =
            case footer.whiteButtons of
                Just buttons ->
                    map Api.whiteButton buttons

                Nothing ->
                    []

        circularBtns =
            case footer.circularButtons of
                Just buttons ->
                    map Api.circularButton buttons

                Nothing ->
                    []

        leadingIconBtns =
            case footer.leadingIconButtons of
                Just buttons ->
                    map Api.leadingIconButton buttons

                Nothing ->
                    []

        trailingIconBtns =
            case footer.trailingIconButtons of
                Just buttons ->
                    map Api.trailingIconButton buttons

                Nothing ->
                    []

        footerHtml =
            case footer.footer of
                Just f ->
                    [ Api.footer f ]

                Nothing ->
                    []
    in
    div [] (circularAvatars ++ primaryBtns ++ secondaryBtns ++ whiteBtns ++ circularBtns ++ leadingIconBtns ++ trailingIconBtns ++ footerHtml)


update : Msg -> Struct.Model Msg -> Nav.Key -> ( Struct.Model Msg, Cmd Msg )
update msg model key =
    case msg of
        NavigationHeaderMsg headerMsg ->
            case model.header.header of
                Just a ->
                    let
                        oldHeader =
                            model.header

                        newHeader =
                            { oldHeader | header = Just (NavigationHeader.update headerMsg a) }
                    in
                    ( { model
                        | header = newHeader
                      }
                    , Cmd.none
                    )

                Nothing ->
                    ( model, Cmd.none )

        AccordionMsg accMsg ->
            case model.body.accordions of
                Just a ->
                    let
                        oldBody =
                            model.body

                        newBody =
                            { oldBody | accordions = Just (map (\acc -> Accordion.update accMsg acc) a) }
                    in
                    ( { model | body = newBody }, Cmd.none )

                Nothing ->
                    ( model, Cmd.none )

        ProjectDescriptionMsg projDesMsg ->
            case model.body.projectDescriptions of
                Just a ->
                    let
                        oldBody =
                            model.body

                        newBody =
                            { oldBody | projectDescriptions = Just (map (\proj -> ProjectDescription.update projDesMsg proj) a) }
                    in
                    ( { model | body = newBody }, Cmd.none )

                Nothing ->
                    ( model, Cmd.none )

        FocusMsg focusMsg ->
            case model.body.focuses of
                Just a ->
                    let
                        oldBody =
                            model.body

                        newBody =
                            { oldBody | focuses = Just (map (\foc -> Focus.update focusMsg foc) a) }
                    in
                    ( { model | body = newBody }, Cmd.none )

                Nothing ->
                    ( model, Cmd.none )

        BackButtonMsg backMsg ->
            case model.body.back of
                Just _ ->
                    ( model, BackButton.update backMsg key )

                Nothing ->
                    ( model, Cmd.none )
