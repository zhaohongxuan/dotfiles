# fish configuration, converted from .zshrc

# --- General Settings ---
# Use Vi key bindings
fish_vi_key_bindings

# Set color for autosuggestions
set fish_color_autosuggestion 555

# --- Aliases ---
alias ll='ls -la'
alias grep='grep --color=auto'
alias mvi="mvn clean && mvn install -DskipTests=true"
alias v='nvim'
alias gcf='git checkout (git branch | fzf)'
alias gcfr='git checkout (git branch -r | fzf | sed "s/origin\///")'
alias cm='chezmoi'

alias gst='git status'
alias glog='git log --oneline --decorate --graph'
alias gco='git checkout'
alias gaa='git add --all'
alias gca='git commit -v -a'
alias gcm='git commit -m'
alias gcp='git cherry-pick'
alias gp='git push'
alias gl='git pull'
alias ggpull='git pull origin (git branch --show-current)'
alias ggpush='git push origin (git branch --show-current)'

# --- PATH Configuration ---
# Use fish_add_path to prevent duplicate entries in PATH
fish_add_path "$HOME/.yarn/bin"
fish_add_path "$HOME/.config/yarn/global/node_modules/.bin"
if set -q GOPATH
    fish_add_path "$GOPATH/bin"
end
fish_add_path "/Users/hank.zhao/Developer/git-fuzzy/bin"
fish_add_path "/opt/homebrew/opt/openjdk@11/bin"
fish_add_path ~/bin

# --- Environment Variables ---


# Java Development Kit
# Set JAVA_HOME. You can switch between versions by moving the '#'
# set -gx JAVA_HOME (/usr/libexec/java_home -v 1.8)
# set -gx JAVA_HOME "/opt/homebrew/opt/openjdk@11"
set -gx JAVA_HOME /Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/Home

# Google Cloud Project
set -gx GOOGLE_CLOUD_PROJECT "zeusjavacom"

# Default Editor
# Set to nvim to be consistent with the 'v' alias
set -gx EDITOR nvim

# --- Functions ---

# fd: fzf-based directory finder and changer
function fd --description 'fzf find directory and cd'
    set -l start_dir .
    if test (count $argv) -gt 0
        set start_dir $argv[1]
    end

    # Find directories, pipe to fzf, and cd if one is selected
    set -l dir (find $start_dir -path '*/\.*' -prune -o -type d -print 2>/dev/null | fzf +m)
    if test -n "$dir"
        cd -- "$dir"
    end
end

# fh: fzf-based history search and execution
function fh --description 'fzf search history and execute'
    set -l command (history | fzf +s --tac)
    if test -n "$command"
        # Safer than eval: put command on the next line and execute
        commandline --replace -- $command
        commandline --function execute
    end
end

# --- Interactive session settings ---
if status is-interactive
    # Commands to run in interactive sessions can go here
end


eval "$(/opt/homebrew/bin/brew shellenv)"
