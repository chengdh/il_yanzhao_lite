# Inspired by Deepak's setup here - https://gist.github.com/deepak/5925003

#FROM former03/dev03-ruby-1.8
FROM ruby:1.9.3

RUN apt-get update -qq && apt-get install -y build-essential git curl mysql-client libmysqlclient-dev libxml2-dev libxslt-dev libreadline-dev
RUN mkdir -p /il_yanzhao

# Install rbenv
#RUN git clone https://github.com/sstephenson/rbenv.git /usr/local/rbenv
#RUN echo '# rbenv setup' > /etc/profile.d/rbenv.sh
#RUN echo 'export RBENV_ROOT=/usr/local/rbenv' >> /etc/profile.d/rbenv.sh
#RUN echo 'export PATH="$RBENV_ROOT/bin:$PATH"' >> /etc/profile.d/rbenv.sh
#RUN echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh
#RUN chmod +x /etc/profile.d/rbenv.sh

# install ruby-build
#RUN mkdir /usr/local/rbenv/plugins
#RUN git clone https://github.com/sstephenson/ruby-build.git /usr/local/rbenv/plugins/ruby-build

#ENV RBENV_ROOT /usr/local/rbenv
#ENV PATH $RBENV_ROOT/bin:$RBENV_ROOT/shims:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

#RUN rbenv install 1.8.6-p420
#RUN rbenv install  2.0.0-p598
#RUN bash -l -c 'rbenv global 1.8.6-p420; gem install bundler; rbenv rehash'

RUN gem install bundler -v 1.9.3
ENV APP_HOME /il_yanzhao
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/

# --- Add this to your Dockerfile ---
ENV BUNDLE_GEMFILE=$APP_HOME/Gemfile \
  BUNDLE_JOBS=2 \
  BUNDLE_PATH=/bundle

RUN ruby -v
RUN bundle install

ADD . $APP_HOME

CMD bundle exec unicorn
