FROM node:lts as dependencies
WORKDIR /rumahsyariah
COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile

FROM node:lts as builder
WORKDIR /rumahsyariah
COPY . .
COPY --from=dependencies /rumahsyariah/node_modules ./node_modules
RUN yarn build

FROM node:lts as runner
WORKDIR /rumahsyariah
ENV NODE_ENV production
# If you are using a custom next.config.js file, uncomment this line.
# COPY --from=builder /rumahsyariah/next.config.js ./
COPY --from=builder /rumahsyariah/public ./public
COPY --from=builder /rumahsyariah/.next ./.next
COPY --from=builder /rumahsyariah/node_modules ./node_modules
COPY --from=builder /rumahsyariah/package.json ./package.json

EXPOSE 3000
CMD ["yarn", "start"]
