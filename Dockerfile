FROM golang:1.18-alpine AS builder 

WORKDIR /usr/src/app

RUN go mod init challenge-helloworld

COPY . .

RUN go build -o challenge-helloworld .

FROM scratch 

WORKDIR /usr/src/app

COPY --from=builder /usr/src/app . 

CMD [ "./challenge-helloworld" ]

