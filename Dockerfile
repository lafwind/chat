FROM ubuntu:14.04
MAINTAINER Lafwind Li "lafwind@gmail.com"

RUN apt-get update
RUN apt-get -y install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev libpq-dev postgresql

# js runtime
RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
RUN apt-get install -y nodejs
ENV PATH /usr/bin/nodejs:$PATH
RUN nodejs -v

RUN cd

# ruby
RUN git clone https://github.com/rbenv/rbenv.git /root/.rbenv
RUN git clone https://github.com/rbenv/ruby-build.git /root/.rbenv/plugins/ruby-build
RUN ./root/.rbenv/plugins/ruby-build/install.sh
ENV PATH /root/.rbenv/bin:$PATH
RUN echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh
RUN echo 'eval "$(rbenv init -)"' >> .bashrc
RUN echo 'eval "$(rbenv init -)"' >> $HOME/.bash_profile
RUN rbenv install 2.3.1
RUN rbenv global 2.3.1
ENV PATH /root/.rbenv/shims:$PATH
RUN ruby -v
RUN gem install --no-rdoc --no-ri bundler
RUN rbenv rehash

# copy app
RUN mkdir -pv /my_app
WORKDIR /my_app
ADD ./ /my_app/chat
WORKDIR /my_app/chat

RUN bundle install -V

# setting ENV
ENV RACK_ENV="production" RAILS_ENV="production"
ENV SECRET_KEY_BASE $(rails secret)
ENV DEVISE_SECRET_KEY $(rails secret)
RUN chmod 777 start.sh

RUN rails assets:precompile
EXPOSE 80
CMD ["sh", "/my_app/chat/start.sh"]
