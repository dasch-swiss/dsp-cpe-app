name=$(grep -o '"configName": "[^"]*"*' $1 | awk -F '"' '{print $4}') 
proj=$(grep -o '"projectsFileUrl": "[^"]*"*' $1 | awk -F '"' '{print $4}')
OUTPUT="module Config exposing (..)\n\n\nconfigName : String\n\nconfigName =\n    \"$name\"\n\n\nprojectsFileUrl : String\nprojectsFileUrl =\n    \"$proj\""
echo "$OUTPUT" > "src/Config.elm"