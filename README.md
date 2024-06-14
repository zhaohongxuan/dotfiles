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

## wezterm

I use wezterm as my primary terminal emulator.

### key bindings

Mod Key (macOS):

`SUPER` -> `Command`
`SUPER_REV` -> `Command + Shift`
`LEADER` -> `CTRL+a` 
`OPT` -> `OPT`

#### Pane operations 

| Keys               | Action                             |
| ------------------ | ---------------------------------- |
| `SUPER` + `\`      | Split Horizontal                   |
| `SUPER_REV` + `\|` | Split Vertical                     |
| `SUPER` + `Enter`  | Toggle Pane Zoom                   |
| `SUPER` + `w`      | Close current Pane without confirm |
|                    |                                    |
#### Pane Navigation

`Leader` + `any key`  means  stoke `Leader` first and then the arbitrary key.

| Keys                                  | Action                    |
| ------------------------------------- | ------------------------- |
| `Leader` +`k`  or `OPT` +`UpArrow`    | Move cursor to Up Pane    |
| `Leader` +`j`  or `OPT` +`DownArrow`  | Move cursor to Down Pane  |
| `Leader` +`h`  or `OPT` +`LeftArrow`  | Move cursor to Left Pane  |
| `Leader` +`l`  or `OPT` +`RightArrow` | Move cursor to Right Pane |

#### Pane Resize 

Use `Leader + p` to active Pane Resize Mode

| Keys         | Action                          |
| ------------ | ------------------------------- |
| `k`          | Adjust current Pane Size: Up    |
| `j`          | Adjust current Pane Size: Down  |
| `h`          | Adjust current Pane Size: Left  |
| `l`          | Adjust current Pane Size: Right |
| `ESC` or `q` | Quit Pane Resize Mode           |


#### Tab Operation 

| Keys             | Action                          |
| ---------------- | ------------------------------- |
| `SUPER` + `[`    | Navigate to Previous Tab (Left) |
| `SUPER` +`]`     | Navigate to Next Tab (Right)    |
| `SUPER_REV` +`[` | Move current TAB to previous    |
| `SUPER_REV` +`]` | Move current TAB to next        |

#### Miscellaneous

| Keys                  | Action                                    |
| --------------------- | ----------------------------------------- |
| `SUPER` + `u`         | Show all  url candidates  in current Pane |
| `SUPER` + `p`         | Active Command Palette like VSCode        |
| `SUPER_REV` + `Enter` | Active Copy Mode                          |


## tmux

use Oh my tmux

## karabiner

karabiner/karabiner.json

