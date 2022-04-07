module CustomCss.DaschTailwind exposing (..)

import CustomCss.CssColors exposing (CustomColor, getColor)
import Html exposing (Attribute)
import Html.Attributes exposing (class)
import String exposing (concat, join)



-- Helper functions
-- builds a single string containing all of the given tailwindcss classes


classList : List String -> String
classList classes =
    join " " classes



-- builds an Attribute msg from the given tailwind css classes


dtwClass : List String -> Attribute msg
dtwClass classes =
    join " " classes
        |> class



-- prepends the "focus" pseudo-class to the given tailwindcss class


onFocus : List String -> String
onFocus twClasses =
    toEventClass twClasses "focus"



-- prepends the "hover" pseudo-class to the given tailwindcss classes


onHover : List String -> String
onHover twClasses =
    toEventClass twClasses "hover"



--- break points


sm : List String -> String
sm twClasses =
    toEventClass twClasses "sm"


md : List String -> String
md twClasses =
    toEventClass twClasses "md"


lg : List String -> String
lg twClasses =
    toEventClass twClasses "lg"


xl : List String -> String
xl twClasses =
    toEventClass twClasses "xl"


xxl : List String -> String
xxl twClasses =
    toEventClass twClasses "xxl"



-- adds the passed event as prefix to every class string and concatenates all to one class string


toEventClass : List String -> String -> String
toEventClass twClasses event =
    List.map (\c -> event ++ ":" ++ c ++ " ") twClasses
        |> concat



-- Custom Tailwind colors with arbitrary values


custom_bg : CustomColor -> String
custom_bg customColor =
    "bg-[" ++ getColor customColor ++ "]"


custom_border : CustomColor -> String
custom_border customColor =
    "border-[" ++ getColor customColor ++ "]"


custom_ring : CustomColor -> String
custom_ring customColor =
    "ring-[" ++ getColor customColor ++ "]"



-- Tailwind classes


absolute : String
absolute =
    "absolute"


bg_gray_50 : String
bg_gray_50 =
    "bg-gray-50"


bg_indigo_100 : String
bg_indigo_100 =
    "bg-indigo-100"


bg_indigo_200 : String
bg_indigo_200 =
    "bg-indigo-200"


bg_indigo_600 : String
bg_indigo_600 =
    "bg-indigo-600"


bg_indigo_700 : String
bg_indigo_700 =
    "bg-indigo-700"


bg_medium_blue_700 : String
bg_medium_blue_700 =
    "bg-blue-700"


bg_white : String
bg_white =
    "bg-white"


block : String
block =
    "block"


border : String
border =
    "border"


border_gray_300 : String
border_gray_300 =
    "border-gray-300"


border_b_2 : String
border_b_2 =
    "border-b-2"


border_indigo_500 : String
border_indigo_500 =
    "border-indigo-500"


border_t : String
border_t =
    "border-t"


border_transparent : String
border_transparent =
    "border-transparent"


flex : String
flex =
    "flex"


flex_1 : String
flex_1 =
    "flex-1"


flex_shrink_0 : String
flex_shrink_0 =
    "flex-shrink-0"


font_medium : String
font_medium =
    "font-medium"


h_3_dot_5 : String
h_3_dot_5 =
    "h-3.5"


h_4 : String
h_4 =
    "h-4"


h_5 : String
h_5 =
    "h-5"


h_6 : String
h_6 =
    "h-6"


h_8 : String
h_8 =
    "h-8"


h_10 : String
h_10 =
    "h-10"


h_12 : String
h_12 =
    "h-12"


h_14 : String
h_14 =
    "h-14"


h_16 : String
h_16 =
    "h-16"


hidden : String
hidden =
    "hidden"


inline_block : String
inline_block =
    "inline-block"


inline_flex : String
inline_flex =
    "inline-flex"


inset_0 : String
inset_0 =
    "inset-0"


justify_between : String
justify_between =
    "justify-between"


items_center : String
items_center =
    "items-center"


justify_center : String
justify_center =
    "justify-center"


justify_end : String
justify_end =
    "justify-end"


leading_4 : String
leading_4 =
    "leading-4"


leading_5 : String
leading_5 =
    "leading-5"


max_h_12 : String
max_h_12 =
    "max-h-12"


max_w_7xl : String
max_w_7xl =
    "max-w-7xl"


max_w_lg : String
max_w_lg =
    "max-w-lg"


max_w_prose : String
max_w_prose =
    "max-w-prose"


max_w_xs : String
max_w_xs =
    "max-w-xs"


ml_2 : String
ml_2 =
    "ml-2"


ml_3 : String
ml_3 =
    "ml-3"


ml_6 : String
ml_6 =
    "ml-6"


mr_1 : String
mr_1 =
    "mr-1"


mr_2 : String
mr_2 =
    "mr-2"


mr_3 : String
mr_3 =
    "mr-3"


mt_6 : String
mt_6 =
    "mt-6"


mx_auto : String
mx_auto =
    "mx-auto"


neg_ml_1 : String
neg_ml_1 =
    "neg-ml-1"


neg_ml_2 : String
neg_ml_2 =
    "neg-ml-2"


neg_ml_1_dot_5 : String
neg_ml_1_dot_5 =
    "neg-mr-0.5"


neg_mr_0_dot_5 : String
neg_mr_0_dot_5 =
    "neg-mr-0.5"


neg_mr_1 : String
neg_mr_1 =
    "neg-mr-1"


outline_none : String
outline_none =
    "outline-none"


p_1 : String
p_1 =
    "p-1"


p_1_dot_5 : String
p_1_dot_5 =
    "p-1.5"


p_2 : String
p_2 =
    "p-2"


p_3 : String
p_3 =
    "p-3"


pl_10 : String
pl_10 =
    "pl-10"


placeholder_gray_400 : String
placeholder_gray_400 =
    "placeholder-gray-400"


pr_3 : String
pr_3 =
    "pr_3"


prose : String
prose =
    "prose"


prose_indigo : String
prose_indigo =
    "prose_indigo"


prose_lg : String
prose_lg =
    "prose_lg"


pt_1 : String
pt_1 =
    "pt-1"


px_1 : String
px_1 =
    "px-1"


px_2 : String
px_2 =
    "px-2"


px_2_dot_5 : String
px_2_dot_5 =
    "px-2.5"


px_3 : String
px_3 =
    "px-3"


px_4 : String
px_4 =
    "px-4"


px_6 : String
px_6 =
    "px-6"


py_1_dot_5 : String
py_1_dot_5 =
    "py-1.5"


py_2 : String
py_2 =
    "py-2"


py_3 : String
py_3 =
    "py-3"


relative : String
relative =
    "relative"


ring_2 : String
ring_2 =
    "ring-2"


ring_inset : String
ring_inset =
    "ring-inset"


ring_offset_2 : String
ring_offset_2 =
    "ring-offset-2"


ring_indigo_500 : String
ring_indigo_500 =
    "ring-indigo-500"


ring_white : String
ring_white =
    "ring-white"


rounded : String
rounded =
    "rounded"


rounded_full : String
rounded_full =
    "rounded-full"


self_center : String
self_center =
    "self-center"


shadow : String
shadow =
    "shadow"


shadow_sm : String
shadow_sm =
    "shadow-sm"


space_x_4 : String
space_x_4 =
    "space-x-4"


space_x_8 : String
space_x_8 =
    "space-x-8"


text_base : String
text_base =
    "text-base"


text_gray_300 : String
text_gray_300 =
    "text-gray-300"


text_gray_500 : String
text_gray_500 =
    "text-gray-500"


text_gray_400 : String
text_gray_400 =
    "text-gray-400"


text_gray_700 : String
text_gray_700 =
    "text-gray-700"


text_gray_900 : String
text_gray_900 =
    "text-gray-900"


text_indigo_700 : String
text_indigo_700 =
    "text-indigo-700"


text_sm : String
text_sm =
    "text-sm"


text_white : String
text_white =
    "text-white"


text_xs : String
text_xs =
    "text-xs"


w_4 : String
w_4 =
    "w-4"


w_5 : String
w_5 =
    "w-5"


w_6 : String
w_6 =
    "w-6"


w_8 : String
w_8 =
    "w-8"


w_10 : String
w_10 =
    "w-10"


w_12 : String
w_12 =
    "w-12"


w_14 : String
w_14 =
    "w-14"


w_full : String
w_full =
    "w-full"
