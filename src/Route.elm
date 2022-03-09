module Route exposing (Route(..), parseUrl)

import Url exposing (Url)
import Url.Parser exposing (..)
import Projects.Project exposing (ProjectId, idParser)

type Route
    = NotFound
    | Projects
    | Playground
    | Project ProjectId

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
    , map Playground (s "project" </> s "playground") -- /project/playground
    , map Project (s "project" </> idParser) --/project/1
    ]