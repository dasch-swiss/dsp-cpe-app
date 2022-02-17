module ButtonsTest exposing (..)

import Expect
import Test exposing (..)
import Test.Html.Query as Query
import Buttons.Button as Button
import Buttons.Shared exposing (Size(..))
import Html exposing (Html)
import Test.Html.Selector
import Icon


primary : Html msg
primary  = Button.primary (Normal, "Primary Button")
primaryCreated : Test
primaryCreated =
    test "One 'Normal' sized primary button should be created via the initialModel." <|
        \_ ->
            primary
                |> Query.fromHtml
                |> Query.findAll [ Test.Html.Selector.text "Primary Button"]
                |> Query.count (Expect.equal 1)

secondary : Html msg
secondary  = Button.secondary (ExtraSmall, "Secondary Button")
secondaryCreated : Test
secondaryCreated =
    test "One 'ExtraSmall' sized secondary button should be created via the initialModel." <|
        \_ ->
            secondary
                |> Query.fromHtml
                |> Query.findAll [ Test.Html.Selector.text "Secondary Button"]
                |> Query.count (Expect.equal 1)

white : Html msg
white  = Button.white (ExtraLarge, "White Button")
whiteCreated : Test
whiteCreated =
    test "One 'ExtraLarge' sized white button should be created via the initialModel." <|
        \_ ->
            white
                |> Query.fromHtml
                |> Query.findAll [ Test.Html.Selector.text "White Button"]
                |> Query.count (Expect.equal 1)

circular : Html msg
circular  = Button.circular (Large, Icon.Academiccap)
circularCreated : Test
circularCreated =
    test "One 'Large' sized circular button should be created via the initialModel." <|
        \_ ->
            circular
                |> Query.fromHtml
                |> Query.has [ Test.Html.Selector.class "circular-button" ]