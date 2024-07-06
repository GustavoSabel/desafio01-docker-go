FROM golang:1.22-alpine AS builder
WORKDIR /app
COPY go.mod ./
RUN go mod download
COPY . .
RUN go build -o app

FROM scratch AS production
COPY --from=builder /app/app /app
EXPOSE 8080
CMD ["./app"]