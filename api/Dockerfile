FROM erlang

# Download elixir source code
RUN git clone https://github.com/elixir-lang/elixir.git /opt/elixir-source
RUN apt-get update

# configure locale to en_US.UTF-8
RUN apt-get install -y locales
ENV LANG=en_US.UTF-8
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
    && locale-gen

# Install elixir
RUN cd /opt/elixir-source && make clean test
RUN cd /opt/elixir-source && make install

# Install hex
RUN mix local.hex --force

# install node
RUN curl -sL https://deb.nodesource.com/setup_5.x | bash -
RUN apt-get install -y nodejs

# RUN update-alternatives --install /usr/bin/node node /usr/bin/nodejs 10
# RUN apt-get install -y npm

# Install phoenix
RUN mix archive.install --force https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez

# install inotify tools
RUN apt-get install -y inotify-tools
