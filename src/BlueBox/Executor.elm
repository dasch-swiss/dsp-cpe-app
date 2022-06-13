module BlueBox.Executor exposing (..)

import BestPageEver
import BlueBox.ProjectInterfaceStructureModel as Struct
import DspCpeApi as Api
import Html exposing (div)
import List exposing (map)
import Modules.NavigationHeader.NavigationHeader as NavigationHeader


type Msg
    = NavigationHeaderMsg NavigationHeader.Msg


execute : Struct.Model Msg -> Html.Html Msg
execute model =
    div []
        [ executeHeader model.header
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


update : Msg -> Struct.Model Msg -> ( Struct.Model Msg, Cmd Msg )
update msg model =
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
