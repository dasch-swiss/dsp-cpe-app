module NavigationHeader.Update exposing (..)

import NavigationHeader.Model exposing (..)


update : Msg -> HeaderModel -> HeaderModel
update msg model =
    case msg of
        ToggleSearchBarMsg ->
            { model | showSearchBar = not model.showSearchBar }

        SignInRequestMsg ->
            { model | user = newUser }

        LogOutMsg ->
            { model | user = Nothing }

        SignUpRequestMsg ->
            { model | user = Nothing }


newUser : Maybe User
newUser =
    Just
        { uId = "someId"
        , uImg = "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
        }
