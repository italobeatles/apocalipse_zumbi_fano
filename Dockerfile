FROM debian:12

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      fp-compiler make \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . /app

RUN fpc tests/unit/ApiControllersTest.pas -Fu./src/controllers -Fu./src/models

CMD ["./tests/unit/ApiControllersTest"]