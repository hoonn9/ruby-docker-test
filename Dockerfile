# # 1. 2 ubuntu, ruby install

# FROM        ubuntu:16.04
# MAINTAINER  hxxns@github.com/hoonn9
# RUN         apt-get -y -qq update && \
#             apt-get -y install ruby
# # -qq 로그 ignore

# RUN gem install bundler

# # 3. Gem package install
# COPY    Gemfile* /usr/src/app
# WORKDIR /usr/src/app
# RUN     bundle install --no-rdoc --nori

# # 4. copy source (소스가 변경되면 build cache가 깨짐: install이 끝나고 적용 re인스톨 방지)
# COPY . /usr/src/app

# # 5. server start (port)
# EXPOSE 4567
# CMD     bundle exec ruby app.rb -o 0.0.0.0


FROM ruby:2.3
MAINTAINER hxxns@github.com/hoonn9
COPY Gemfile* /usr/src/app/
WORKDIR /usr/src/app
RUN bundle install
COPY . /usr/src/app
EXPOSE 4567
CMD bundle exec ruby app.rb -o 0.0.0.0