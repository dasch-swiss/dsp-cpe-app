module CustomCss.CssColors exposing (..)


type CustomColor
    = White
    | Primary
    | Secondary


getColor : CustomColor -> String
getColor customType =
    case customType of
        White ->
            white

        Primary ->
            primary

        Secondary ->
            secondary



-- color palette


primary : String
primary =
    medium_blue


secondary : String
secondary =
    midnight_blue



-- colors


medium_blue : String
medium_blue =
    "#1D4ED8"


midnight_blue : String
midnight_blue =
    "#130075"


white : String
white =
    "#FFFFFF"


passiveGray : String
passiveGray =
    "#D1D5DB"


activeGray : String
activeGray =
    "#6B7280"
