FROM openjdk:8-jre@sha256:a76d7c4b6b406fd45170df258f64153fa641b3a11e0a00c440eddfd464a996f4

ARG REFRESHED_AT
ENV REFRESHED_AT $REFRESHED_AT

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -qq --no-install-recommends \
  nodejs \
  yarn \
  xvfb libgtk2.0-0 libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 \
  && rm -rf /var/lib/apt/lists/*
