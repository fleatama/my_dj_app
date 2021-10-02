FROM ruby:2.6.3
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /my_dj_app
WORKDIR /my_dj_app
COPY Gemfile /my_dj_app/Gemfile
COPY Gemfile.lock /my_dj_app/Gemfile.lock
RUN bundle install
RUN apt install -y graphviz
COPY . /my_dj_app

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]

# Consoleで日本語が入力できない問題を解決する
ENV LANG C.UTF-8