FROM node:alpine

RUN mkdir app
WORKDIR /app

RUN apk update && \
    apk add git && \
    apk add --no-cache curl && \
    curl -o- -L https://yarnpkg.com/install.sh | sh

ENV PATH PATH $HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH
# Node gyp実行に必要なファイル
RUN apk add --no-cache --virtual .gyp python make g++ && \
    apk --no-cache add avahi-dev && \
    yarn global add mdns

RUN yarn global add @vue/cli @vue/cli-service


COPY ./app/package.json ./package.json
COPY ./app/yarn.lock ./yarn.lock

RUN yarn install

# 不要なパッケージを最後に削除
RUN apk del .gyp

CMD ["yarn", "serve"]
