FROM kong:latest

USER nginx

ENV KONG_DATABASE=off
ENV KONG_DECLARATIVE_CONFIG=kong.yml
ENV KONG_ADMIN_LISTEN="0.0.0.0:8001, 0.0.0.0:8444 ssl"

COPY go-plugin-test /usr/local/bin/go-plugin-test
COPY kong.yml /
COPY kong.conf /etc/kong/kong.conf

EXPOSE 8000
EXPOSE 8001

# ENTRYPOINT [ "/docker-entrypoint.sh" ]
# CMD [ "kong", "docker-start" ]