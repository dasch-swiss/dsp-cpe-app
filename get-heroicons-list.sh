#!/bin/bash

#get the file from github
GH=$(curl https://raw.githubusercontent.com/jasonliang-dev/elm-heroicons/master/src/Heroicons/Solid.elm)

#get the list of icons, assumes that the file continues to start with the exposing list and doesn't use "(" or ")" before that.
NGH=$(awk -F '(' '{print $2}' <<< $GH)
NNGH=$(awk -F ')' '{print $1}' <<< $NGH)
icons=$(echo $NNGH | tr ", " "\n")

#build string
OUTPUT="module Icon exposing (..)\nimport Heroicons.Solid\nimport Html exposing (Html)\n\ntype Icon\n    = "
for icon in $icons
do
    OUTPUT+="$(tr '[:lower:]' '[:upper:]' <<< ${icon:0:1})${icon:1} \n    | "
done
OUTPUT="${OUTPUT%??????}"
OUTPUT+="\n\ngetHtml: Icon -> Html msg\ngetHtml icon =\n    case icon of\n"
for icon in $icons
do
    OUTPUT+="        $(tr '[:lower:]' '[:upper:]' <<< ${icon:0:1})${icon:1} ->\n            Heroicons.Solid.$icon []\n"
done
echo -e "$OUTPUT" > "src/Icon.elm"