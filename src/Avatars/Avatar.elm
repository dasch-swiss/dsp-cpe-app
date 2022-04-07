module Avatars.Avatar exposing (..)

import Avatars.CircularAvatar as CircularAvatar exposing (CircularAvatarSize(..))
import Html exposing (Attribute, Html)


circular : CircularAvatarSize -> String -> String -> List (Attribute msg) -> Html msg
circular size img alt attrs =
    CircularAvatar.view { size = size, img = img, alt = alt, attrs = attrs }
