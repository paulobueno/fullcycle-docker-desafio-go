FROM golang:latest AS builder

WORKDIR /go

COPY . .

RUN go build hello-world.go

FROM scratch

WORKDIR /go

COPY --from=builder /go/hello-world /go/hello-world

CMD ["./hello-world"]
