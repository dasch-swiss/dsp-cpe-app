module NavigationHeader.SearchBar exposing (..)

import Buttons.Button exposing (circularButton)
import Buttons.CircularButton exposing (CircularButtonSize(..))
import CustomCss.CssColors exposing (CustomColor(..), activeGray, passiveGray, white)
import CustomCss.DaschTailwind as Dtw exposing (dtwClass)
import Html exposing (Attribute, Html, div, input)
import Html.Attributes as Attr exposing (attribute, id)
import Icon


type alias Model =
    { searchString : String
    , showSB : Bool
    }


searchString : String
searchString =
    ""


searchBar : Html msg
searchBar =
    div [ id "outer-search-ct", outerSearchCtStyle ]
        [ circularButton CircularNormal Icon.ChevronRight []
        , div []
            [ input [ Attr.type_ "Text", Attr.placeholder "Search", searchBarStyle ] []
            ]
        , circularButton CircularNormal Icon.Search []
        ]



-- styles


outerSearchCtStyle : Attribute msg
outerSearchCtStyle =
    [ Dtw.flex
    , Dtw.justify_between
    , Dtw.items_center
    ]
        |> dtwClass


outerSearchCtStyle_old : Attribute msg
outerSearchCtStyle_old =
    [ Dtw.max_w_lg
    , Dtw.w_full
    , Dtw.flex
    , Dtw.items_center
    , Dtw.lg [ Dtw.max_w_xs ]
    ]
        |> dtwClass


searchBarStyle : Attribute msg
searchBarStyle =
    [ Dtw.block
    , Dtw.w_full
    , Dtw.max_w_lg
    , Dtw.pl_10
    , Dtw.pr_3
    , Dtw.py_2
    , Dtw.border
    , Dtw.leading_5
    , Dtw.text_gray_300 -- todo: Check
    , Dtw.placeholder_gray_400
    , Dtw.outline_none
    , Dtw.md [ Dtw.rounded ]
    , Dtw.lg [ Dtw.max_w_xs ]
    , Dtw.onFocus [ Dtw.outline_none, Dtw.ring_white, Dtw.text_gray_900 ] --Dtw.backgroundColor white, Css.borderColor activeGray
    , Dtw.sm [ Dtw.text_sm ]
    , Dtw.custom_bg White
    ]
        |> dtwClass



--    , Css.borderColor passiveGray
