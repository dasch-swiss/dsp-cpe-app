# dsp-cpe-app
DSP CPE (Configurable Presentation Environment) App

## Dependencies
To run the project, you will need the following:

Elm: [https://guide.elm-lang.org/install/elm.html](https://guide.elm-lang.org/install/elm.html)

elm-go: `npm intsall -g elm-go`

json-server: `npm install -g json-server`

## Running the app

Then run: `json-server --watch db.json -p 2022` to start the local dev server. 

Then run `make build-dev` to start the app.

Then visit [http://localhost:8000](http://localhost:8000) to view the project.

Elm-go provides live-reloading so any changes to `.elm` files you save will be reflected immediately in the browser. Changes made to other files, specifically `html` and `css` files require a manual page refresh to see the changes.
