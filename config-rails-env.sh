#!/usr/bin/env bash

sudo sh -c "echo 'deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main' > /etc/apt/sources.list.d/pgdg.list"
wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -

echo "Updating packages"
# sudo apt-get update > /dev/null

install() {
  echo "Installing $1"
  sudo apt-get install $1 -y > /dev/null
}

install git-core
install curl
install zlib1g-dev
install build-essential
install libssl-dev
install libreadline-dev
install libyaml-dev
install libsqlite3-dev
install sqlite3
install libxml2-dev
install libxslt1-dev
install libcurl4-openssl-dev
install python-software-properties
install libffi-dev
install nodejs
install postgresql
install postgresql-contrib
install libpq-dev

local_pwd=$(pwd)

cd

hash rbenv 2>/dev/null
if [ $? -eq 1 ]; then
  echo "\n\nIntalling rbenv\n"

  git clone https://github.com/rbenv/rbenv.git ~/.rbenv

  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
  echo 'eval "$(rbenv init -)"' >> ~/.zshrc

  . $HOME/.zshrc
  echo "gem: --no-ri --no-rdoc" > $HOME/.gemrc
else
  echo "\n\nrbend already installed\n"
fi

if [ ! -d "$HOME/.rbenv/plugins/ruby-build" ]; then
  echo "\n\nIntalling ruby-build\n"

  git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
  echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.zshrc

  . $HOME/.zshrc
else
  echo '\n\nruby-build already installed\n'
fi

hash ruby 2>/dev/null
if [ $? -eq 1 ]; then
  rbenv install 2.4.0
  rbenv global 2.4.0
else
  echo "Ruby is already installed"
fi

echo $(ruby -v)

cd $local_pwd

hash bundle 2>/dev/null
if [ $? -eq 1 ]; then
  echo "Installing Bundler"
  gem install bundler >/dev/null
  rbenv rehash
else
  echo "Bundler already installed"
fi

hash rails 2>/dev/null
if [ $? -eq 1 ]; then
  echo "Installing Rails"
  gem install rails >/dev/null
  rbenv rehash
else
  echo "Rails already installed"
fi

sudo -u postgres createuser mercado_local -s

echo "\nNão esqueça de trocar a senha do usuário do Postgres/n $ sudo -u postgres psql\n $ postgres=# \password mercado_local"

