# dsp-cpe-app
DSP CPE (Configurable Presentation Environment) App

## Dependencies
To run the project, you will need the following:

Elm: [https://guide.elm-lang.org/install/elm.html](https://guide.elm-lang.org/install/elm.html)

elm-go (installed globally): `npm intsall -g elm-go`

json-server (installed globally): `npm install -g json-server`

## Running the app

Run: `start-dev-server` to start the local dev server.

If you'd rather host the database via docker, you can run `make start-mock-api`.

Then run: `make build-dev` to start the app.

Then visit [http://localhost:8000](http://localhost:8000) to view the project.

Elm-go provides live-reloading so any changes to `.elm` files you save will be reflected immediately in the browser. Changes made to other files, specifically `html` and `css` files require a manual page refresh to see the changes.

Json-server also provides live-reloading to any changes made to the `.json` file that you're hosting but you will need to manually refresh the page to reload the contents of the JSON file or provide a "reload data" button to refresh the data.
