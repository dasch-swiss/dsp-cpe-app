# dsp-cpe-app
DSP CPE (Configurable Presentation Environment) App

## running the app
To run the project, make sure you have Elm installed first and then run:

`make build`

`npx tailwindcss -i ./main.css -o ./dist/output.css`

`elm reactor`

Then visit [http://localhost:8000/index.html](http://localhost:8000/index.html) to view the project.

It's helpful to keep one terminal tab open with `elm reactor` running and then another tab to re-run the `make build` command. That way you don't need to constantly kill the application every time you want to recompile the generated Javascript.

### TailwindCss
If changes to the TailwindCss are required (for example, if you added TailwindCss classes that you haven't used before) then you first need to recompile the javascript with the `make build` command above and then rebuild the css with the command:

`npx tailwindcss -i ./main.css -o ./dist/output.css`

Then when you run the project with `elm reactor`, you should see the styles being applied correctly.
