FROM alpine:3.16 as installer

WORKDIR /app
COPY package.json yarn.lock ./
RUN apk add --no-cache --update --virtual .build-deps git npm
RUN npm install -g yarn
RUN yarn install
RUN yarn cache clean --all
RUN npm uninstall -g yarn
RUN apk del .build-deps
RUN rm -rf $(find node_modules -maxdepth 2 | grep -i -E "^.*/readme.md|.*/tests?|.*/licence|.*/changelog.md$")


FROM alpine:3.16 as builder

WORKDIR /app
COPY . ./
COPY --from=installer /app/node_modules ./node_modules
RUN apk add --no-cache --update --virtual .build-deps npm
RUN npm install -g yarn

# Build
RUN npx prisma generate

RUN yarn cache clean --all
RUN npm uninstall -g yarn
RUN apk del .build-deps


FROM node:18-alpine3.16

ENV NODE_ENV production

WORKDIR /app
COPY --from=builder /app ./

CMD ["yarn", "start"]

