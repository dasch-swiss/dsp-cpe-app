FROM daschswiss/json-server:1.0.2

COPY db.json /data/db/db.json

CMD ["--watch", "/data/db/db.json", "--static", "/data/public"]
