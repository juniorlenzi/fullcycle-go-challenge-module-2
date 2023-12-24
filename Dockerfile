FROM golang:1.21 as builder

WORKDIR /usr/src/app

COPY . .

RUN go build main.go

FROM scratch

WORKDIR /app

COPY --from=builder /usr/src/app/main .

CMD ["./main"]