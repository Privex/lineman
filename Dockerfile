FROM node:12

WORKDIR /app

VOLUME /app/config

COPY . .

RUN yarn install --non-interactive --frozen-lockfile

#RUN make ci-test
RUN make lib

# prune modules
RUN yarn install --non-interactive --frozen-lockfile --production

EXPOSE 8080

ENV PORT 8080
ENV NODE_ENV production

CMD [ "node", "lib/server.js" ]
