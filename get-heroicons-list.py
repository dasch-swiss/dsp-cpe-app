import requests

r = requests.get('https://raw.githubusercontent.com/jasonliang-dev/elm-heroicons/master/src/Heroicons/Solid.elm')
arr = r.text.split('\n')
icons = []
for line in arr :
    if not line.find("->") == -1 and not line.find('Html msg') == -1:
        icons.append(line[0:line.find(' ')])
to_write = "module Buttons.Icon exposing (..)\nimport Heroicons.Solid\nimport Html exposing (Html)\n\ntype Icon\n    = "
for icon in icons:
    to_write += icon.capitalize() + '\n    | '
to_write = to_write[0:-6] + '\n\ngetHtml: Icon -> Html msg\ngetHtml icon =\n    case icon of\n'
for icon in icons:
    to_write += '        ' + icon.capitalize() + ' ->\n            Heroicons.Solid.' + icon + ' []\n'
f = open("src/Icon.elm", 'w')
f.write(to_write)