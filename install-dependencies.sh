install() {
  echo "Installing $1"
  sudo apt-get install $1 -y > /dev/null
}

install git
install curl
install zsh
install neovim
install ctags
install silversearcher-ag
install golang
install xclip
install python3
install python3-pip
install taskwarrior

export GOPATH=$HOME/dev
export PATH=$PATH:$HOME/dev/bin:$HOME/bin

go get github.com/github/hub
