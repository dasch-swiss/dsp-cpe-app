module Avatars.Avatar exposing (..)

import Html exposing (Html)
import Avatars.CircularAvatar as CircularAvatar
import Avatars.CircularAvatar exposing (Size(..))

circular: (Size, String, String) -> Html msg
circular (size, img, alt) =
    CircularAvatar.view ({size = size, img = img, alt = alt})