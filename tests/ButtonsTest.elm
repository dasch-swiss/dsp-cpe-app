module ButtonsTest exposing (..)

import Expect
import Test exposing (..)
import Test.Html.Query as Query
import Buttons.PrimaryButton
import Test.Html.Selector exposing (tag, text)

buttonCreated : Test
buttonCreated =
    test "One 'Normal' sized button should be created via the initialModel." <|
        \_ ->
            Buttons.PrimaryButton.initialModel
                |> Buttons.PrimaryButton.view
                |> Query.fromHtml
                |> Query.findAll [ text "Button text"]
                |> Query.count (Expect.equal 1)