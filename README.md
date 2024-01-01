# :package: `mindustry-image`
Automatically build container images for Mindustry server.

*powered by Github Actions.

## Quick preview
Simply,
```sh
docker run -itp 6567:6567 -v .:/app ghcr.io/pmh-only/mindustry
```

jvm memory limit:
```sh
docker run -itp 6567:6567 -v .:/app ghcr.io/pmh-only/mindustry -Xms1G -Xmx1G
```

## docker-compose
```yml
version: '3'

services:
  mindustry:
    image: ghcr.io/pmh-only/mindustry
    command: -Xms1G -Xmx1G
    restart: always
    user: 1000:1000
    tty: true
    stdin_open: true
    volumes:
      - .:/app:rw
    ports:
      - '6567:6567'
```

wanna update your mindustry server? just type:
```sh
docker compose pull
docker compose up -d
```
