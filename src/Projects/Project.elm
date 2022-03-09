module Projects.Project exposing (..)

import Html exposing (Html, div, text)
import Json.Decode as Decode exposing (Decoder, int, list, string)
import Json.Decode.Pipeline exposing (required)
import Html exposing (a)
import Url.Parser exposing (Parser, custom)

type alias Project =
    { id : ProjectId
    , title : String
    , description : String
    , projectUrl : String
    }

type ProjectId =
    ProjectId Int

projectsDecoder : Decoder (List Project)
projectsDecoder =
    list projectDecoder

projectDecoder : Decoder Project
projectDecoder =
    Decode.succeed Project
        |> required "id" idDecoder
        |> required "title" string
        |> required "description" string
        |> required "projectUrl" string

idDecoder : Decoder ProjectId
idDecoder =
    Decode.map ProjectId int

idToString : ProjectId -> String
idToString (ProjectId id) =
    String.fromInt id

idParser : Parser (ProjectId -> a) a
idParser =
    custom "PROJECTID" <|
        \projectId ->
            Maybe.map ProjectId (String.toInt projectId)

-- viewProject : Project -> Html msg
-- viewProject project =
--     div []
--         [ text (idToString project.id)
--         , text project.title
--         , text project.description
--         , text project.projectUrl
--         ]