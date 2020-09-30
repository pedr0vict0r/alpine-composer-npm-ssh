FROM alpine

RUN apk update && apk upgrade
RUN apk add --update nodejs nodejs-npm
