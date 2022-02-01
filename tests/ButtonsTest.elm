module ButtonsTest exposing (..)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Test exposing (..)
import Test.Html.Query as Query
import Buttons.PrimaryButton
import Http exposing (Expect)
import Test.Html.Selector exposing (attribute, tag, text)

buttonCreated : Test
buttonCreated =
    test "One 'Normal' sized button should be created via the initialModel." <|
        \_ ->
            Buttons.PrimaryButton.initialModel
                |> Buttons.PrimaryButton.view
                |> Query.fromHtml
                |> Query.findAll [ tag "button"]
                |> Query.count (Expect.equal 1)