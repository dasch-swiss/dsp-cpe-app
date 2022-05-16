module Util.CustomCss.DaschTailwind exposing (..)

import String exposing (concat, join)
import Util.CustomCss.CssColors exposing (CustomColor, getColor)



-- Helper functions
-- builds a single string containing all of the given tailwindcss classes


classList : List String -> String
classList classes =
    join " " classes



-- prepends the "focus-within" pseudo-class to the given tailwindcss class


onFocusWithin : List String -> String
onFocusWithin twClasses =
    toEventClass twClasses "focus-within"



-- prepends the "group-hover" pseudo-class to the given tailwindcss class


onGroupHover : List String -> String
onGroupHover twClasses =
    toEventClass twClasses "group-hover:"


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


custom_text : CustomColor -> String
custom_text customColor =
    "text-[" ++ getColor customColor ++ "]"


custom_height_px : Int -> String
custom_height_px px =
    "h-[" ++ String.fromInt px ++ "px]"



-- Tailwind classes


absolute : String
absolute =
    "absolute"


align_middle : String
align_middle =
    "align-middle"


aspect_none : String
aspect_none =
    "aspect-none"


aspect_h_7 : String
aspect_h_7 =
    "aspect-h-7"


aspect_w_10 : String
aspect_w_10 =
    "aspect-w-10"


aspect_w_12 : String
aspect_w_12 =
    "aspect-w-12"


bg_gray_50 : String
bg_gray_50 =
    "bg-gray-50"


bg_gray_100 : String
bg_gray_100 =
    "bg-gray-100"


bg_gray_500 : String
bg_gray_500 =
    "bg-gray-500"


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


bg_blue_700 : String
bg_blue_700 =
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


border_2 : String
border_2 =
    "border-2"


border_b_2 : String
border_b_2 =
    "border-b-2"


border_blue_700 : String
border_blue_700 =
    "border-blue-700"


border_gray_300 : String
border_gray_300 =
    "border-gray-300"


border_indigo_500 : String
border_indigo_500 =
    "border-indigo-500"


border_t : String
border_t =
    "border-t"


border_transparent : String
border_transparent =
    "border-transparent"


bottom_0 : String
bottom_0 =
    "bottom-0"


col_start_1 : String
col_start_1 =
    "col-start-1"


col_start_2 : String
col_start_2 =
    "col-start-2"


cursor_pointer : String
cursor_pointer =
    "cursor-pointer"


ease_in_out : String
ease_in_out =
    "ease-in-out"


fill_inherit : String
fill_inherit =
    "fill-inherit"


fill_white : String
fill_white =
    "fill-white"


flex : String
flex =
    "flex"


flex_1 : String
flex_1 =
    "flex-1"


flex_auto : String
flex_auto =
    "flex-auto"


flex_none : String
flex_none =
    "flex-none"


flex_shrink_0 : String
flex_shrink_0 =
    "flex-shrink-0"


font_extrabold : String
font_extrabold =
    "font-extrabold"


font_medium : String
font_medium =
    "font-medium"


font_semibold : String
font_semibold =
    "font-semibold"


font_serif : String
font_serif =
    "font-serif"


gap_8 : String
gap_8 =
    "gap-8"


gap_x_4 : String
gap_x_4 =
    "gap-x-4"


gap_x_6 : String
gap_x_6 =
    "gap-x-6"


gap_x_8 : String
gap_x_8 =
    "gap-x-8"


gap_y_8 : String
gap_y_8 =
    "gap-y-8"


grid : String
grid =
    "grid"


grid_cols_2 : String
grid_cols_2 =
    "grid-cols-2"


grid_cols_3 : String
grid_cols_3 =
    "grid-cols-3"


grid_cols_4 : String
grid_cols_4 =
    "grid-cols-4"


group : String
group =
    "group"


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


items_center : String
items_center =
    "items-center"


justify_between : String
justify_between =
    "justify-between"


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


leading_6 : String
leading_6 =
    "leading-6"


leading_8 : String
leading_8 =
    "leading-8"


left_3_slash_4 : String
left_3_slash_4 =
    "left-3/4"


line_clamp_6 : String
line_clamp_6 =
    "line-clamp-6"


line_clamp_10 : String
line_clamp_10 =
    "line-clamp-10"


line_clamp_12 : String
line_clamp_12 =
    "line-clamp-12"


m_4 : String
m_4 =
    "m-4"


max_h_12 : String
max_h_12 =
    "max-h-12"


max_h_96 : String
max_h_96 =
    "max-h-96"


max_w_lg : String
max_w_lg =
    "max-w-lg"


max_w_none : String
max_w_none =
    "max-w-none"


max_w_prose : String
max_w_prose =
    "max-w-prose"


max_w_xs : String
max_w_xs =
    "max-w-xs"


max_w_7xl : String
max_w_7xl =
    "max-w-7xl"


mb_0 : String
mb_0 =
    "mb-0"


mb_8 : String
mb_8 =
    "mb-8"


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


mt_0 : String
mt_0 =
    "mt-0"


mt_2 : String
mt_2 =
    "mt-2"


mt_3 : String
mt_3 =
    "mt-3"


mt_5 : String
mt_5 =
    "mt-5"


mt_6 : String
mt_6 =
    "mt-6"


mt_8 : String
mt_8 =
    "mt-8"


mx_3 : String
mx_3 =
    "mx-3"


mx_auto : String
mx_auto =
    "mx-auto"


my_8 : String
my_8 =
    "my-8"


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


neg_mr_20 : String
neg_mr_20 =
    "neg-mr-20"


neg_mt_20 : String
neg_mt_20 =
    "-mt-20"


object_center : String
object_center =
    "object-center"


object_cover : String
object_cover =
    "object-cover"


opacity_0 : String
opacity_0 =
    "opacity-0"


opacity_75 : String
opacity_75 =
    "opacity-75"


opacity_100 : String
opacity_100 =
    "opacity-100"


order_1 : String
order_1 =
    "order-1"


order_2 : String
order_2 =
    "order-2"


outline_none : String
outline_none =
    "outline-none"


overflow_hidden : String
overflow_hidden =
    "overflow-hidden"


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


p_6 : String
p_6 =
    "p-6"


pb_0 : String
pb_0 =
    "pb-0"


pb_2 : String
pb_2 =
    "pb-2"


pb_3 : String
pb_3 =
    "pb-3"


pb_96 : String
pb_96 =
    "pb-96"


pointer_events_none : String
pointer_events_none =
    "pointer-events-none"


pl_1 : String
pl_1 =
    "pl-1"


pl_3 : String
pl_3 =
    "pl-3"


pl_5 : String
pl_5 =
    "pl-5"


pl_10 : String
pl_10 =
    "pl-10"


placeholder_gray_400 : String
placeholder_gray_400 =
    "placeholder-gray-400"


pr_1 : String
pr_1 =
    "pr-1"


pr_1_dot_5 : String
pr_1_dot_5 =
    "pr-1.5"


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


pt_2 : String
pt_2 =
    "pt-2"


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


px_8 : String
px_8 =
    "px-8"


py_1_dot_5 : String
py_1_dot_5 =
    "py-1.5"


py_2 : String
py_2 =
    "py-2"


py_3 : String
py_3 =
    "py-3"


py_8 : String
py_8 =
    "py-8"


py_12 : String
py_12 =
    "py-12"


py_16 : String
py_16 =
    "py-16"


relative : String
relative =
    "relative"


right_0 : String
right_0 =
    "right-0"


ring_2 : String
ring_2 =
    "ring-2"


ring_inset : String
ring_inset =
    "ring-inset"


ring_offset_2 : String
ring_offset_2 =
    "ring-offset-2"


ring_offset_gray_100 : String
ring_offset_gray_100 =
    "ring-offset-gray-100"


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


rounded_md : String
rounded_md =
    "rounded-md"


rounded_lg : String
rounded_lg =
    "rounded-lg"


row_start_1 : String
row_start_1 =
    "row-start-1"


self_center : String
self_center =
    "self-center"


shadow : String
shadow =
    "shadow"


shadow_lg : String
shadow_lg =
    "shadow-lg"


shadow_sm : String
shadow_sm =
    "shadow-sm"


sm_hidden : String
sm_hidden =
    "sm-hidden"


sr_only : String
sr_only =
    "sr-only"


space_x_4 : String
space_x_4 =
    "space-x-4"


space_x_6 : String
space_x_6 =
    "space-x-6"


space_x_8 : String
space_x_8 =
    "space-x-8"


space_y_1 : String
space_y_1 =
    "space-y-1"


static : String
static =
    "static"


text_3xl : String
text_3xl =
    "text-3xl"


text_4xl : String
text_4xl =
    "text-4xl"


text_base : String
text_base =
    "text-base"


text_blue_500 : String
text_blue_500 =
    "text-blue-500"


text_blue_700 : String
text_blue_700 =
    "text-blue-700"


text_gray_200 : String
text_gray_200 =
    "text-gray-200"


text_gray_300 : String
text_gray_300 =
    "text-gray-300"


text_gray_400 : String
text_gray_400 =
    "text-gray-400"


text_gray_500 : String
text_gray_500 =
    "text-gray-500"


text_gray_600 : String
text_gray_600 =
    "text-gray-600"


text_gray_700 : String
text_gray_700 =
    "text-gray-700"


text_gray_900 : String
text_gray_900 =
    "text-gray-900"


text_indigo_600 : String
text_indigo_600 =
    "text-indigo-600"


text_indigo_700 : String
text_indigo_700 =
    "text-indigo-700"


text_left : String
text_left =
    "text-left"


text_lg : String
text_lg =
    "text-lg"


text_sm : String
text_sm =
    "text-sm"


text_white : String
text_white =
    "text-white"


text_xs : String
text_xs =
    "text-xs"


top_0 : String
top_0 =
    "top-0"


tracking_tight : String
tracking_tight =
    "tracking-tight"


tracking_wide : String
tracking_wide =
    "tracking-wide"


transition : String
transition =
    "transition"


transition_all : String
transition_all =
    "transition-all"


truncate : String
truncate =
    "truncate"


uppercase : String
uppercase =
    "uppercase"


w_4 : String
w_4 =
    "w-4"


w_5 : String
w_5 =
    "w-5"


w_6 : String
w_6 =
    "w-6"


w_6_slash_12 : String
w_6_slash_12 =
    "w-6/12"


w_8 : String
w_8 =
    "w-8"


w_10 : String
w_10 =
    "w-10"


w_11_slash_12 : String
w_11_slash_12 =
    "w-11/12"


w_12 : String
w_12 =
    "w-12"


w_14 : String
w_14 =
    "w-14"


w_full : String
w_full =
    "w-full"


w_screen : String
w_screen =
    "w-screen"
