# Dotfiles

## Installation

```sh
$ git clone https://github.com/nicksp/dotfiles.git ~/dotfiles
$ cd ~/dotfiles
$ chmod +x install.sh
$ ./install.sh
```
## Remotely install using curl

Alternatively, you can install this into `~/dotfiles` remotely without Git using curl:

```sh
sh -c "`curl -fsSL https://raw.github.com/nicksp/dotfiles/master/remote-install.sh`"
```

Or, using wget:

```sh
sh -c "`wget -O - --no-check-certificate https://raw.githubusercontent.com/nicksp/dotfiles/master/remote-install.sh`"
```

