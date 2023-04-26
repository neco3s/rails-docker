FROM node:16.20.0-bullseye as node

FROM ruby:3.0

# Install NOde.js and Yarn
# ENV YARN_VERSION 1.16.0
# RUN mkdir -p /opt
COPY --from=node /opt/yarn-* /opt/yarn
COPY --from=node /usr/local/bin/node /usr/local/bin/
COPY --from=node /usr/local/lib/node_modules/ /usr/local/lib/node_modules/
RUN ln -fs /usr/local/lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npm \
  && ln -fs /usr/local/lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npx \
  && ln -fs /opt/yarn/bin/yarn /usr/local/bin/yarn \
  && ln -fs /opt/yarn/bin/yarnpkg /usr/local/bin/yarnpkg

RUN apt-get update && apt-get install -y \
  build-essential \
  libpq-dev \
  postgresql-client

WORKDIR /myapp
COPY . /myapp/
RUN bundle install && yarn install
