name=$(grep -o '"configName": "[^"]*"*' $1 | awk -F '"' '{print $4}') 
proj=$(grep -o '"projectsFileUrl": "[^"]*"*' $1 | awk -F '"' '{print $4}')
OUTPUT="module Config exposing (..)\n\n\nconfigName : String\nconfigName =\n    \"$name\"\n\n\nprojectsFileUrl : String\nprojectsFileUrl =\n    \"$proj\""
printf "$OUTPUT" > "src/Config.elm"