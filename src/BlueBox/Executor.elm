module BlueBox.Executor exposing (..)

import BlueBox.ProjectInterfaceStructureModel as Struct
import DspCpeApi as Api
import Html exposing (div, text)
import List exposing (map)


excecute : Struct.Model msg -> Html.Html msg
excecute model =
    div []
        [ excecuteHeader model.header
        ]


excecuteHeader : Struct.Header msg -> Html.Html msg
excecuteHeader header =
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
    in
    div [] circularAvatars
