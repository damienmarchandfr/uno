FROM node:16

WORKDIR /app

RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install curl zip libvips-dev libvips-tools -y \
    && rm -rf /var/lib/apt

COPY . /app
RUN npm install

CMD npm run dev

