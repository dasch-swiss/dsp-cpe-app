module Route exposing (Route(..), parseUrl)

import Url exposing (Url)
import Url.Parser exposing (..)
import Projects.Project exposing (ProjectId, idParser)

type Route
    = NotFound
    | Projects
    | Project ProjectId
    | Playground

parseUrl : Url -> Route
parseUrl url =
    case parse matchRoute url of
        Just route ->
            route
        Nothing ->
            NotFound

matchRoute : Parser (Route -> a) a
matchRoute =
    oneOf
    [ map Projects top -- /
    , map Projects (s "projects") -- /projects
    , map Project (s "project" </> idParser) --/project/1
    , map Playground (s "playground") -- /project/playground
    ]