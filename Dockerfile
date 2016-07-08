FROM ubuntu:14.04
MAINTAINER Lafwind Li "lafwind@gmail.com"
RUN apt-get update
RUN apt-get -y install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev postgresql
RUN cd
RUN git clone https://github.com/rbenv/rbenv.git /root/.rbenv
RUN git clone https://github.com/rbenv/ruby-build.git /root/.rbenv/plugins/ruby-build
RUN ./root/.rbenv/plugins/ruby-build/install.sh
ENV PATH /root/.rbenv/bin:$PATH
RUN echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh
RUN echo 'eval "$(rbenv init -)"' >> .bashrc
RUN echo 'eval "$(rbenv init -)"' >> $HOME/.bash_profile
## RUN source $HOME/.bash_profile

RUN rbenv install 2.3.1
RUN rbenv global 2.3.1
ENV PATH /root/.rbenv/shims:$PATH
RUN ruby -v
RUN gem install --no-rdoc --no-ri bundler
RUN rbenv rehash

## RUN git clone https://github.com/rbenv/rbenv.git ~/.rbenv
## RUN echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
## RUN echo 'eval "$(rbenv init -)"' >> ~/.bashrc
## RUN exec $SHELL
## RUN git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
## RUN echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
## RUN exec $SHELL
## RUN source ~/.bashrc
## RUN rbenv install 2.3.1
## RUN rbenv global 2.3.1
## RUN ruby -v
## RUN gem install --no-rdoc --no-ri bundler
## RUN rbenv rehash
# WORKDIR /tmp
# RUN wget http://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.2.tar.gz
# RUN tar -zxvf ruby-2.2.2.tar.gz
# WORKDIR /tmp/ruby-2.2.2
# RUN ["./configure"]
# RUN make -j2
# RUN make install -j2
# RUN ruby -v

RUN mkdir -pv /my_app
WORKDIR /my_app
ADD ./ /my_app/chat
WORKDIR /my_app/chat

# RUN mkdir -pv tmp/{pids,sockets}
# ENV RAILS_ENV docker
RUN bundle install -V
RUN chmod 777 start.sh
## ENV DB_HOST ------
## ENV DB_USERNAME ------
## ENV DB_PASSWORD ------
## ENV REDIS_PASSWORD ------
## ENV REDIS_PORT ------
## ENV REDIS_HOST ------
## RUN rails assets:precompile
## EXPOSE 80
##
CMD ["sh", "/my_app/chat/start.sh"]
