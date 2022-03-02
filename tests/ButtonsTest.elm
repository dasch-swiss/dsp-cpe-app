module ButtonsTest exposing (..)

import Expect
import Test exposing (..)
import Test.Html.Query as Query
import Buttons.Button as Button
import Buttons.Button exposing (primaryButton, secondaryButton)
import Buttons.Shared exposing (ButtonSize(..))
import Html exposing (Html)
import Test.Html.Selector
import Heroicons.Solid
import Buttons.Button exposing (whiteButton)


primary : Html msg
primary  = primaryButton [] "Primary Button" ExtraSmall
primaryCreated : Test
primaryCreated =
    test "One 'Normal' sized primary button should be created via the initialModel." <|
        \_ ->
            primary
                |> Query.fromHtml
                |> Query.findAll [ Test.Html.Selector.text "Primary Button"]
                |> Query.count (Expect.equal 1)

secondary : Html msg
secondary  = secondaryButton [] "Secondary Button" ExtraSmall
secondaryCreated : Test
secondaryCreated =
    test "One 'ExtraSmall' sized secondary button should be created via the initialModel." <|
        \_ ->
            secondary
                |> Query.fromHtml
                |> Query.findAll [ Test.Html.Selector.text "Secondary Button"]
                |> Query.count (Expect.equal 1)

white : Html msg
white  = whiteButton[] "White Button" ExtraSmall
whiteCreated : Test
whiteCreated =
    test "One 'ExtraLarge' sized white button should be created via the initialModel." <|
        \_ ->
            white
                |> Query.fromHtml
                |> Query.findAll [ Test.Html.Selector.text "White Button"]
                |> Query.count (Expect.equal 1)

circular : Html msg
circular  = Button.circular (Large, Heroicons.Solid.academicCap [])
circularCreated : Test
circularCreated =
    test "One 'Large' sized circular button should be created via the initialModel." <|
        \_ ->
            circular
                |> Query.fromHtml
                |> Query.has [ Test.Html.Selector.class "circular-button" ]