#/bin/sh

rsync -av --delete ~/Library/Application\ Support/Code/User/settings.json ./vscode/
rsync -av --delete ~/.config/karabiner/karabiner.json ./config/karabiner/
rsync -av --delete ~/.config/nvim/init.vim ./nvim/
rsync -av --delete ~/.vimrc .
rsync -av --delete ~/.ideavimrc .
rsync -av --delete ~/.tmux/.tmux.conf .
rsync -av --delete ~/.zshrc .
rsync -av --delete ~/.config/alacritty/alacritty.yml .
