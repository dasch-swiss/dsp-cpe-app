module Projects.Project exposing (..)

import Json.Decode as Decode exposing (Decoder, int, list, string)
import Json.Decode.Pipeline exposing (required)
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