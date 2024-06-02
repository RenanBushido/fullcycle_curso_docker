FROM golang:1.22-alpine3.20 as builder

WORKDIR /usr/src

RUN go mod init fullcycle/saudacao

COPY ./src/saudacao.go /usr/src/

RUN mkdir /usr/app

RUN go build -o saudacao .

RUN cp saudacao /usr/app

FROM scratch

WORKDIR /usr/app

COPY --from=builder /usr/app/saudacao /usr/app/

CMD [ "./saudacao" ]