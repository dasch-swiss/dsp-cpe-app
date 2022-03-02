module Route exposing (Route(..), parseUrl)

import Url exposing (Url)
import Url.Parser exposing (..)

type Route
    = NotFound
    | Projects

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
    [ map Projects top
    , map Projects (s "projects")
    ]