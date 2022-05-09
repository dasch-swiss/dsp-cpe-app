module Modules.NavigationHeader.SearchBar exposing (..)

import Html exposing (Html, div, input)
import Html.Attributes as Attr exposing (class, id)
import Modules.Buttons.CircularButton as CircularButton
import Shared.SharedTypes exposing (CircularButtonSize(..))
import Util.CustomCss.CssColors exposing (CustomColor(..))
import Util.CustomCss.DaschTailwind as Dtw exposing (classList)
import Util.Icon as Icon


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
        [ CircularButton.view { size = CircularNormal, icon = Icon.ChevronRight, attrs = [] } -- Do not use API to avoid circularity
        , div []
            [ input [ Attr.type_ "Text", Attr.placeholder "Search", class searchBarStyle ] []
            ]
        , CircularButton.view { size = CircularNormal, icon = Icon.Search, attrs = [] } -- Do not use API to avoid circularity
        ]



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
