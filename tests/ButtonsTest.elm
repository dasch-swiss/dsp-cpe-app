module ButtonsTest exposing (..)

import Expect
import Test exposing (..)
import Test.Html.Query as Query
import Buttons.Button exposing (..)
import Html exposing (..)
import Test.Html.Selector


view : Html msg
view  = cpeButton (Primary, ExtraSmall, "I am a Button")
buttonCreated : Test
buttonCreated =
    test "One 'Normal' sized button should be created via the initialModel." <|
        \_ ->
            view
                |> Query.fromHtml
                |> Query.findAll [ Test.Html.Selector.text "I am a Button"]
                |> Query.count (Expect.equal 1)