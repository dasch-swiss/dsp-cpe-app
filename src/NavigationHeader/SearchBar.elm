module NavigationHeader.SearchBar exposing (..)

import Css
import Html.Styled as HtmlStyled exposing (Attribute, Html)
import Html.Styled.Attributes as Attr exposing (attribute, css, id)
import NavigationHeader.CssColors exposing (activeGray, passiveGray, white)
import Tailwind.Breakpoints as Bp
import Tailwind.Utilities as Tw


searchString : String
searchString =
    ""


searchBar : Html msg
searchBar =
    HtmlStyled.div outerSearchCt
        [ HtmlStyled.div []
            [ HtmlStyled.input [ Attr.type_ "Text", Attr.placeholder "Search", searchBarStyle ] []
            ]
        ]



-- styles


outerSearchCt : List (Attribute msg)
outerSearchCt =
    [ id "outer-search-ct", attribute "data-tw-class" "max-w-lg w-full lg:max-w-xs", outerSearchCtStyle ]


outerSearchCtStyle : Attribute msg
outerSearchCtStyle =
    [ Tw.max_w_lg
    , Tw.w_full
    , Tw.flex
    , Tw.items_center
    , Bp.lg [ Tw.max_w_xs ]
    ]
        |> css



-- class="block w-full pl-10 pr-3 py-2 border border-transparent rounded-md leading-5 bg-gray-700 text-gray-300 placeholder-gray-400 focus:outline-none focus:bg-white
--focus:border-white focus:ring-white focus:text-gray-900 sm:text-sm" placeholder="Search" type="search">


searchBarStyle : Attribute msg
searchBarStyle =
    --"max-w-lg w-full lg:max-w-xs"
    [ Tw.block
    , Tw.w_full
    , Tw.pl_10
    , Tw.pr_3
    , Tw.py_2
    , Tw.border
    , Css.borderColor passiveGray
    , Bp.md [ Tw.rounded ]
    , Tw.leading_5
    , Tw.text_gray_300 -- todo: Check
    , Tw.placeholder_gray_400
    , Tw.outline_none
    , Css.focus [ Tw.outline_none, Css.backgroundColor white, Tw.ring_white, Tw.text_gray_900, Css.borderColor activeGray ]
    , Bp.sm [ Tw.text_sm ]
    ]
        |> css
