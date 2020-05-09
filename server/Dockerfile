FROM golang:alpine AS build-env
WORKDIR /app
ADD . .
RUN go build -o ./bin/scripts ./...

FROM alpine
WORKDIR /app
COPY --from=build-env /app/bin/scripts/ .
COPY --from=build-env /app/assets/ ./assets
EXPOSE 1111
ENTRYPOINT [ "./cqq" ]