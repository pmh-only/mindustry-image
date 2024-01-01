FROM alpine as builder

RUN apk add --no-cache wget

COPY ./start.sh /bin/start.sh

ARG VERSION

RUN wget wget https://github.com/Anuken/Mindustry/releases/download/${VERSION}/server-release.jar -O /bin/server.jar

RUN chmod a+rwx /bin/start.sh /bin/server.jar

FROM alpine as runner

RUN apk add --no-cache openjdk17-jre

WORKDIR /app

VOLUME ["/app"]

EXPOSE 6567

COPY --from=builder /bin/server.jar /bin/server.jar
COPY --from=builder /bin/start.sh /bin/start.sh

ENTRYPOINT ["/bin/start.sh"]
