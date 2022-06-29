module Util.Route exposing (Route(..), parseUrl)

import Modules.Projects.Project exposing (ProjectId, idParser)
import Url exposing (Url)
import Url.Parser exposing (..)


type Route
    = NotFound
    | Projects
    | Project ProjectId
    | Playground
    | Beol
    | Executor


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
        , map Playground (s "playground") -- /playground
        , map Beol (s "beol") -- /beol
        , map Executor (s "executor") -- /executor
        ]
