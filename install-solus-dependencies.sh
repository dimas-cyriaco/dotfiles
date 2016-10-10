install() {
  sudo eopkg it $1
}

install git
install zsh
install neovim
install ctags
install silver-searcher
install golang
install xclip
install python3

export GOPATH=$HOME/dev

go get github.com/github/hub

