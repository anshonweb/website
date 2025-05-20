FROM klakegg/hugo:latest AS hugo

WORKDIR /app

COPY . .

RUN hugo