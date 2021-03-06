module ButtonsTest exposing (..)

import DspCpeApi as Api exposing (primaryButton, secondaryButton, whiteButton)
import Expect
import Html exposing (Html)
import Shared.SharedTypes exposing (BasicButtonSize(..), CircularButtonSize(..))
import Test exposing (..)
import Test.Html.Query as Query
import Test.Html.Selector
import Util.Icon as Icon


primary : Html msg
primary =
    primaryButton { attrs = [], text = "Primary Button", size = BasicExtraSmall }


primaryCreated : Test
primaryCreated =
    test "One 'Normal' sized primary button should be created via the initialModel." <|
        \_ ->
            primary
                |> Query.fromHtml
                |> Query.findAll [ Test.Html.Selector.text "Primary Button" ]
                |> Query.count (Expect.equal 1)


secondary : Html msg
secondary =
    secondaryButton { attrs = [], text = "Secondary Button", size = BasicExtraSmall }


secondaryCreated : Test
secondaryCreated =
    test "One 'ExtraSmall' sized secondary button should be created via the initialModel." <|
        \_ ->
            secondary
                |> Query.fromHtml
                |> Query.findAll [ Test.Html.Selector.text "Secondary Button" ]
                |> Query.count (Expect.equal 1)


white : Html msg
white =
    whiteButton { attrs = [], text = "White Button", size = BasicExtraSmall }


whiteCreated : Test
whiteCreated =
    test "One 'ExtraLarge' sized white button should be created via the initialModel." <|
        \_ ->
            white
                |> Query.fromHtml
                |> Query.findAll [ Test.Html.Selector.text "White Button" ]
                |> Query.count (Expect.equal 1)


circular : Html msg
circular =
    Api.circularButton { size = CircularLarge, icon = Icon.AcademicCap, attrs = [] }


circularCreated : Test
circularCreated =
    test "One 'Large' sized circular button should be created via the initialModel." <|
        \_ ->
            circular
                |> Query.fromHtml
                |> Query.has [ Test.Html.Selector.class "circular-button" ]
