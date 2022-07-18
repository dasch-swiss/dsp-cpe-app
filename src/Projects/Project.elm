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



-- custom type to ensure a project id is provided and not some other int
-- ProjectId is an opaque type


type ProjectId
    = ProjectId Int



-- decoder to translate JSON into elm values


projectsDecoder : Decoder (List Project)
projectsDecoder =
    -- create a decoder that knows how to translate a JSON array into a list of the type Project
    list projectDecoder


projectDecoder : Decoder Project
projectDecoder =
    Decode.succeed Project
        |> required "id" idDecoder
        |> required "title" string
        |> required "description" string
        |> required "projectUrl" string



-- custom decoder for the project id because it is not an int or string


idDecoder : Decoder ProjectId
idDecoder =
    Decode.map ProjectId int



-- convert ProjectId to string to use in html


idToString : ProjectId -> String
idToString (ProjectId id) =
    String.fromInt id



-- convert string to the type PostId
-- used when parsing a url


idParser : Parser (ProjectId -> a) a
idParser =
    custom "PROJECTID" <|
        \projectId ->
            Maybe.map ProjectId (String.toInt projectId)
