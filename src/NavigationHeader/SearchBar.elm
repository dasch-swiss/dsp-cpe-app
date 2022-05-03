module NavigationHeader.SearchBar exposing (..)

import Buttons.CircularButton exposing (CircularButtonSize(..))
import CustomCss.CssColors exposing (CustomColor(..))
import CustomCss.DaschTailwind as Dtw exposing (classList)
import Html exposing (Html, div, input)
import Html.Attributes as Attr exposing (class, id)


type alias Model =
    { searchString : String
    , showSB : Bool
    }


searchString : String
searchString =
    ""


searchBar : Html msg
searchBar =
    div [ id "outer-search-ct", class outerSearchCtStyle ]
        [ input [ Attr.type_ "Text", Attr.placeholder "Search", class searchBarStyle ] [] ]



-- styles


outerSearchCtStyle : String
outerSearchCtStyle =
    [ Dtw.flex
    , Dtw.justify_between
    , Dtw.items_center
    ]
        |> classList


outerSearchCtStyle_old : String
outerSearchCtStyle_old =
    [ Dtw.max_w_lg
    , Dtw.w_full
    , Dtw.flex
    , Dtw.items_center
    , Dtw.lg [ Dtw.max_w_xs ]
    ]
        |> classList


searchBarStyle : String
searchBarStyle =
    [ Dtw.block
    , Dtw.w_full
    , Dtw.max_w_lg
    , Dtw.pl_10
    , Dtw.pr_3
    , Dtw.py_2
    , Dtw.border
    , Dtw.leading_5
    , Dtw.text_gray_300
    , Dtw.placeholder_gray_400
    , Dtw.outline_none
    , Dtw.md [ Dtw.rounded ]
    , Dtw.lg [ Dtw.max_w_xs ]
    , Dtw.onFocus [ Dtw.outline_none, Dtw.ring_white, Dtw.text_gray_900 ]
    , Dtw.sm [ Dtw.text_sm ]
    , Dtw.custom_bg White
    ]
        |> classList
