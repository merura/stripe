FROM alpine:3.23.0 AS build
RUN apk add --no-cache gcc musl-dev
WORKDIR /app
COPY . /app
RUN gcc -O3 -static -s -o stripe stripe.c

FROM alpine:3.23.0
WORKDIR /app
COPY --from=build /app/stripe /usr/local/bin/stripe

ENTRYPOINT ["stripe"]
