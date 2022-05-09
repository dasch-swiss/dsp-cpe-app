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
    primaryButton [] "Primary Button" BasicExtraSmall


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
    secondaryButton [] "Secondary Button" BasicExtraSmall


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
    whiteButton [] "White Button" BasicExtraSmall


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
    Api.circularButton CircularLarge Icon.AcademicCap []


circularCreated : Test
circularCreated =
    test "One 'Large' sized circular button should be created via the initialModel." <|
        \_ ->
            circular
                |> Query.fromHtml
                |> Query.has [ Test.Html.Selector.class "circular-button" ]
