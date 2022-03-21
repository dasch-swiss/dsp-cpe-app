FROM daschswiss/json-server:1.0.2

ARG FILENAME="config.dev.json"
COPY FILENAME /data/db/ + FILENAME

CMD ["--watch", "/data/db/" + FILENAME, "--static", "/data/public"]
