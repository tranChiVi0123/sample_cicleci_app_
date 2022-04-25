FROM ruby:2.7.3-alpine

#必要なパッケージのインストール
RUN apk --update --no-cache add git curl build-base mysql-dev tzdata nodejs


#作業ディレクトリの作成
RUN mkdir /sample_app  
#自身のアプリディレクトリ名を設定

#作業ディレクトリをAPP_ROOTに割り当てる
ENV APP_ROOT /sample_app  
#自身のアプリディレクトリ名を設定 
WORKDIR $APP_ROOT

#ローカルのGemfileを追加
ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock

RUN bundle update --bundler

RUN sudo gem install pg --with-pg-config=/path/to/pg_config

#Gemfileのbundle installを実行
RUN bundle install
ADD . $APP_ROOT