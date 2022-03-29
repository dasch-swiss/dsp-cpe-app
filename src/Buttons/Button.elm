module Buttons.Button exposing (..)

import Buttons.BasicButtons.BasicButton exposing (BasicButtonSize, Variant(..), basicButton)
import Buttons.CircularButton as CircularButton
import Buttons.DividerButton as DividerButton
import Buttons.LeadingIconButton as LeadingIconButton exposing (LeadingSize(..))
import Buttons.TrailingIconButton as TrailingIconButton exposing (TrailingSize(..))
import Html exposing (Html)
import Html.Styled exposing (Attribute, toUnstyled)
import Icon


primaryButton : List (Attribute msg) -> String -> BasicButtonSize -> Html.Styled.Html msg
primaryButton attrs txt size =
    basicButton attrs txt size Primary


primaryButtonUnStyled : List (Attribute msg) -> String -> BasicButtonSize -> Html msg
primaryButtonUnStyled attrs txt size =
    basicButton attrs txt size Primary
        |> toUnstyled


secondaryButton : List (Attribute msg) -> String -> BasicButtonSize -> Html.Styled.Html msg
secondaryButton attrs txt size =
    basicButton attrs txt size Secondary


secondaryButtonUnStyled : List (Attribute msg) -> String -> BasicButtonSize -> Html msg
secondaryButtonUnStyled attrs txt size =
    basicButton attrs txt size Secondary
        |> toUnstyled


whiteButton : List (Attribute msg) -> String -> BasicButtonSize -> Html.Styled.Html msg
whiteButton attrs txt size =
    basicButton attrs txt size White


whiteButtonUnstyled : List (Attribute msg) -> String -> BasicButtonSize -> Html msg
whiteButtonUnstyled attrs txt size =
    basicButton attrs txt size White
        |> toUnstyled


circularButton : List (Attribute msg) -> Icon.Icon -> CircularButton.CircularButtonSize -> Html.Styled.Html msg
circularButton attrs icon size =
    CircularButton.view { size = size, icon = icon, attrs = attrs }


circularButtonUnstyled : List (Attribute msg) -> Icon.Icon -> CircularButton.CircularButtonSize -> Html msg
circularButtonUnstyled attrs icon size =
    CircularButton.view { size = size, icon = icon, attrs = attrs }
        |> toUnstyled


leadingIconButton : List (Attribute msg) -> LeadingSize -> String -> Icon.Icon -> Html.Styled.Html msg
leadingIconButton attrs size text icon =
    LeadingIconButton.view { attrs = attrs, size = size, text = text, icon = icon }


leadingIconButtonUnstyled : List (Attribute msg) -> LeadingSize -> String -> Icon.Icon -> Html msg
leadingIconButtonUnstyled attrs size text icon =
    LeadingIconButton.view { attrs = attrs, size = size, text = text, icon = icon }
        |> toUnstyled


trailingIconButton : List (Attribute msg) -> TrailingSize -> String -> Icon.Icon -> Html.Styled.Html msg
trailingIconButton attrs size text icon =
    TrailingIconButton.view { attrs = attrs, size = size, text = text, icon = icon }


trailingIconUnstyled : List (Attribute msg) -> TrailingSize -> String -> Icon.Icon -> Html msg
trailingIconUnstyled attrs size text icon =
    TrailingIconButton.view { attrs = attrs, size = size, text = text, icon = icon }
        |> toUnstyled


dividerButton : List (Attribute msg) -> String -> Icon.Icon -> Html.Styled.Html msg
dividerButton attr text icon =
    DividerButton.view { attr = attr, text = text, icon = icon }
