# My Personal dot_files Managed by chezmoi 🤖

This repo contains all my dotfiles managed by [chezmoi](https://github.com/twpayne/chezmoi), you can fork and edit before use it.


## How to Usage
1. install [chezmoi](https://github.com/twpayne/chezmoi) first, if you use mac, simply `brew install chezmoi`
2. fork this repo, if you want to manage dotfiles your self, if you just use it, you can just use this repo 
3. use `chezmoi init https://github.com/username/dotfiles.git` to init dotfiles
4. use `chezmoi apply -v` to make all dotfiles take effect. if you just want to apply one config file,
   let's take .zshrc for example, just use `chezmoi appy -v .zshrc`

⚠️ Note. before truely used, you need to prepare some requirements, like nvim.

## neovim

### Pre-requisite

There are some dependencies before we use nvim to do efficient editing and development work.


#### Python3
A lot of Nvim plugins are written by Python3 so , we must install python3 first. 
after installation ,make sure that you can run `python --version` and got `Python3.x`
`pip install -U pynvim` to install Pynvim

#### Node
We need to install node.js from [here](https://nodejs.org/en/download/).

#### Ripgrep
Ripgrep, aka, rg, is a fast grepping tool available for both Linux, Windows and macOS. It is used by several searching plugins.
if you use mac brew , simply `brew install ripgrep`

#### nvim
click herer https://neovim.io/ to install nvim, if you use brew in mac ,simply `brew install nvim`

### Setting Nvim

#### Install Plug manager 

install Neovim Plugin manager[GitHub - junegunn/vim-plug: Minimalist Vim Plugin Manager](https://github.com/junegunn/vim-plug)

```shell
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

#### install this configuration

use `chezmoi apply -v .config/nvim/init.vim` to take nvim settings work


## Ideavimrc

1. if you use chezmoi, simple use `chezmoi apply -v .ideavimrc` to make it effect, or you can just copy this `.ideavimrc` to your home dictory
2. enable `ideavim plugin` in your Jetbrain IDE like Intellij IDEA or Pycharm etc.
3. you can watch my tutorial video in bilibili to get more information:[ideavim插件的配置和使用](https://www.bilibili.com/video/BV1p541157Va)

## tmux

use Oh my tmux

## karabiner

karabiner/karabiner.json

