# syntax = docker/dockerfile:1-experimental

FROM golang:alpine AS base
#FROM golang:1.15.2-alpine AS base
WORKDIR /go/src/github.com/wade-liwei/idxBatchTx
ENV CGO_ENABLED=0

# Set up dependencies
ENV PACKAGES git build-base
# Install dependencies
RUN apk add --update $PACKAGES
# Add source files
COPY ./ ./
RUN --mount=type=cache,target=/go/pkg/mod \
 go  mod download


FROM base AS build

RUN --mount=target=. \
    --mount=type=cache,target=/go/pkg/mod \
    --mount=type=cache,target=/root/.cache/go-build \
         make build-docker-ouput

# Final image
FROM alpine

WORKDIR /root

# Install ca-certificates
RUN apk add --no-cache --update   supervisor


COPY --from=build /nameserviced /usr/bin/nameserviced
# COPY --from=build /go/src/github.com/wade-liwei/idxBatchTx/scripts/start.sh /usr/bin/start.sh

RUN mkdir -p /etc/supervisor/conf.d/
COPY --from=build /go/src/github.com/wade-liwei/idxBatchTx/scripts/supervisor/supervisord.conf /etc/supervisor/supervisord.conf
COPY --from=build /go/src/github.com/wade-liwei/idxBatchTx/scripts/supervisor/conf.d/* /etc/supervisor/conf.d/

EXPOSE 26656 26657 1317 8545 8546

# Add supervisor configuration files
COPY --from=build /go/src/github.com/wade-liwei/idxBatchTx/scripts/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod u+x /usr/local/bin/entrypoint.sh

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
#ENTRYPOINT [ "supervisord --nodaemon --configuration /etc/supervisor/supervisord.conf" ]
STOPSIGNAL SIGINT
