FROM ghost:1.22.5-alpine
LABEL maintainer="ibrahim SEN<ibrahim@promek.net>"

RUN apk add --no-cache paxctl && \ 
    paxctl -cm `which node`


