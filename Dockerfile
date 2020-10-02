FROM node:alpine

RUN mkdir app
WORKDIR /app

RUN apk update && \
    apk add git && \
    apk add --no-cache curl && \
    curl -o- -L https://yarnpkg.com/install.sh | sh

ENV PATH PATH $HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH
RUN yarn global add @vue/cli

COPY ./app/package.json ./package.json
COPY ./app/yarn.lock ./yarn.lock

RUN yarn install


CMD ["yarn", "serve"]
