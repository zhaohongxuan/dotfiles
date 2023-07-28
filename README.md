# My Personal dotfiles Managed by chezmoi 🤖

This repo contains all my dotfiles managed by [chezmoi](https://github.com/twpayne/chezmoi), Chezmoi manage dotfile start with `dot_` prefix instead of `.`  for example,
the `.zshrc` will be `dot_zshrc` in chezmoi, so if you don't want use chezmoi, just rename the `dot_` config file to real `.` file, you can fork and edit before use it.

**PS.** nvim dotfiles were migrated to https://github.com/zhaohongxuan/nvim

## How to Usage
1. install [chezmoi](https://github.com/twpayne/chezmoi) first, if you use mac, simply `brew install chezmoi`
2. fork this repo, if you want to manage dotfiles your self, if you just use it, you can just use this repo 
3. use `chezmoi init https://github.com/zhaohongxuan/dotfiles.git` to init dotfiles
4. use `chezmoi apply -v` to make all dotfiles take effect. if you just want to apply one config file,
   let's take .zshrc for example, just use `chezmoi appy -v .zshrc`

## Ideavim

1. if you use chezmoi, simple use `chezmoi apply -v .ideavimrc` to make it effect, or you can just copy this `.ideavimrc` to your home dictory
2. enable `ideavim plugin` in your Jetbrain IDE like Intellij IDEA or Pycharm etc.
3. you can watch my tutorial video in bilibili to get more information:[ideavim插件的配置和使用](https://www.bilibili.com/video/BV1p541157Va)

## tmux

use Oh my tmux

## karabiner

karabiner/karabiner.json

