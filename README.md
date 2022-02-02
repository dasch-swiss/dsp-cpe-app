# dsp-cpe-app
DSP CPE (Configurable Presentation Environment) App

## running the app
To run the project, make sure you have Elm installed first and then run:

`make build`

`elm reactor`

Then visit [http://localhost:8000/dist/index.html](http://localhost:8000/index.html) to view the project.

It's helpful to keep one terminal tab open with `elm reactor` running and then another tab to re-run the `make build` command. That way you don't need to constantly kill the application every time you want to recompile the generated Javascript.
