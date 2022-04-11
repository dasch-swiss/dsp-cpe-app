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
    medium_blue_700


secondary : String
secondary =
    passiveGray



-- colors


medium_blue_700 : String
medium_blue_700 =
    "#1D4ED8"


medium_blue_500 : String
medium_blue_500 =
    "#1D4ED8"


white : String
white =
    "#FFFFFF"


passiveGray : String
passiveGray =
    "#D1D5DB"


activeGray : String
activeGray =
    "#6B7280"
