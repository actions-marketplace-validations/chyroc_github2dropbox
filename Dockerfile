FROM golang:1.17.7-alpine3.15
RUN apk add git

COPY . /home/src
WORKDIR /home/src
RUN go build -o /bin/action ./
RUN go install github.com/chyroc/dropbox-cli@d61a67f && mv $(which dropbox-cli) /bin/dropbox-cli

ENTRYPOINT [ "/bin/action" ]