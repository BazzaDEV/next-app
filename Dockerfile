FROM node:18-alpine as base

FROM base as build-deps

WORKDIR /src/app

COPY package.json pnpm-lock.yaml ./
RUN yarn global add pnpm && \
    pnpm i --frozen-lockfile

FROM scratch as deps

WORKDIR /src/app

COPY --from=build-deps /src/app/node_modules ./node_modules

FROM base as build

# ARG TEST
# ENV NEXT_PUBLIC_TEST=${TEST}

ENV NODE_ENV production

WORKDIR /src/app

COPY --from=deps /src/app/node_modules node_modules
COPY . .
RUN yarn build

FROM base as run

WORKDIR /app

COPY --from=build /src/app/public ./public

COPY --from=build /src/app/.next/standalone ./
COPY --from=build /src/app/.next/static ./.next/static

EXPOSE 3000

ENV PORT 3000
# set hostname to localhost
ENV HOSTNAME "0.0.0.0"

CMD ["node", "server.js"]
