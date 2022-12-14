FROM alpine:latest
RUN apk add --no-cache inotify-tools rsync

COPY watcher.sh /

CMD /watcher.sh
