FROM ruby:3.2

# 必要なパッケージをインストール
RUN apt-get update -qq && apt-get install -y postgresql-client \
  build-essential \
  libpq-dev \
  libvips42 \
  nodejs \
  npm \
  && npm install -g yarn \
  git

# 作業ディレクトリを作成
RUN mkdir /app
WORKDIR /app

# GemfileとGemfile.lockをコンテナにコピー
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

# Bundlerを使って必要なGemをインストール
RUN bundle install

# アプリケーションのコードをコンテナにコピー
COPY . /app

# コンテナ起動時にRailsサーバーを立ち上げる
CMD ["rails", "server", "-b", "0.0.0.0"]
