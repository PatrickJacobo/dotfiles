if [ -n "$TTY" ]; then
  export GPG_TTY=$(tty)
else
  export GPG_TTY="$TTY"
fi

PATH="$HOME/.go/bin:$PATH"
export PATH=$PATH:/home/jacob/.local/bin
export PATH="$PATH:$HOME/.config/emacs/bin"
# if [[ -f "/opt/homebrew/bin/brew" ]] then
#   # If you're using macOS, you'll want this enabled
#   eval "$(/opt/homebrew/bin/brew shellenv)"
# fi
export EDITOR=nvim
export BAT_THEME="Catppuccin Mocha"
# SSH_AUTH_SOCK set to GPG to enable using gpgagent as the ssh agent.
# export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
# gpgconf --launch gpg-agent

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found
autoload -Uz compinit && compinit
zinit cdreplay -q

eval "$(oh-my-posh init zsh --config $HOME/zen.toml)"

bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

zle_highlight+=(paste:none)
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

alias ls='eza --color=always --no-time --no-user --no-permissions -a  --no-filesize --icons=always'
alias vim='nvim'
alias c='clear'
alias du='dust'
alias df='duf'
alias cat="bat"
alias grep="rg"
alias find="fd"
alias ping='gping'
#alias cleancache="sudo pacman -Sc" #ARCH
alias cleancache="sudo xbps-remove --clean-cache" #VOID
alias weather="curl wttr.in"
alias fuck="pkill -9"

# Shell integrations
alias fzf='fzf --preview "bat --color=always --style=numbers --line-range=:500 {}"'
source <(fzf --zsh)
eval "$(zoxide init --cmd cd zsh)"

color_code="\033[38;2;254;0;0m"
read_file() {
    local file_path="$1"
    if [ ! -f "$file_path" ]; then
        echo "File not found!"
        return 1
    fi
    while IFS= read -r line
    do
        echo -e "$color_code $line\033[0m"
    done < "$file_path"
}
read_file ~/nervlogo.txt

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"

[ -f "/home/jacob/.ghcup/env" ] && . "/home/jacob/.ghcup/env"

if [ -f '/home/jacob/ocrtest/google-cloud-sdk/path.zsh.inc' ]; then . '/home/jacob/ocrtest/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/home/jacob/ocrtest/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/jacob/ocrtest/google-cloud-sdk/completion.zsh.inc'; fi

export PATH="~/.config/composer/vendor/bin:$PATH"
