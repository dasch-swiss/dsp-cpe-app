module Tiles.ImageTile exposing (..)

import CustomCss.DaschTailwind as Dtw
import Html exposing (Html, a, button, div, img, li, p, span, text)
import Html.Attributes exposing (alt, class, href, src, type_)


type alias Model =
    { src : String
    , alt : String
    , buttonAlt : String
    , title : String
    , subtitle : String
    , url : String
    }


imageTileClasses : String
imageTileClasses =
    Dtw.classList
        [ Dtw.group
        , Dtw.block
        , Dtw.w_full
        , Dtw.rounded_lg
        , Dtw.bg_gray_100
        , Dtw.overflow_hidden
        , Dtw.focusWithin Dtw.ring_2
        , Dtw.focusWithin Dtw.ring_offset_2
        , Dtw.focusWithin Dtw.ring_indigo_500
        , Dtw.focusWithin Dtw.ring_offset_gray_100
        ]


view : Model -> Html msg
view model =
    a [ href model.url ]
        [ li [ class Dtw.relative ]
            [ div
                [ class imageTileClasses
                ]
                [ img
                    [ alt model.alt
                    , src model.src
                    , class
                        (Dtw.classList
                            [ Dtw.object_cover
                            , Dtw.pointer_events_none
                            , Dtw.groupHover Dtw.opacity_75
                            , Dtw.aspect_arbitrary 10 7
                            ]
                        )
                    ]
                    []
                , button
                    [ type_ "button"
                    , class
                        (Dtw.classList
                            [ Dtw.absolute
                            , Dtw.inset_0
                            , Dtw.focus Dtw.outline_none
                            ]
                        )
                    ]
                    [ span [ class Dtw.sr_only ] [ text model.buttonAlt ] ]
                ]
            , p
                [ class
                    (Dtw.classList
                        [ Dtw.mt_2
                        , Dtw.block
                        , Dtw.text_sm
                        , Dtw.font_medium
                        , Dtw.text_gray_900
                        , Dtw.truncate
                        , Dtw.pointer_events_none
                        ]
                    )
                ]
                [ text model.title ]
            , p
                [ class
                    (Dtw.classList
                        [ Dtw.block
                        , Dtw.text_sm
                        , Dtw.font_medium
                        , Dtw.text_gray_500
                        , Dtw.pointer_events_none
                        ]
                    )
                ]
                [ text model.subtitle ]
            ]
        ]
