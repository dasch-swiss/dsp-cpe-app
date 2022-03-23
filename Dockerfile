### STAGE 1: Build ###

FROM alpine:3.10.3 as builder

LABEL maintainer="400790+subotic@users.noreply.github.com"

RUN wget -O - 'https://github.com/elm/compiler/releases/download/0.19.1/binary-for-linux-64-bit.gz' \
    | gunzip -c >/usr/local/bin/elm
RUN chmod +x /usr/local/bin/elm
RUN apk add --no-cache nodejs=10.24.1-r0
RUN apk add --update make

# Sets the path where the app is going to be installed
ENV NODE_ROOT /usr/app/

# Creates the directory and all the parents (if they don’t exist)
RUN mkdir -p $NODE_ROOT

# Sets the /usr/app as the active directory
WORKDIR $NODE_ROOT

# Copies all the content
COPY . .

RUN make build

### STAGE 2: Setup ###

FROM daschswiss/nginx-server:v1.1.1

LABEL maintainer="400790+subotic@users.noreply.github.com"

RUN rm -rf /public/*

COPY --from=builder /usr/app/dist /public