# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

#Download ZInit,if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi 

source "${ZINIT_HOME}/zinit.zsh"
zinit ice depth=1; zinit light romkatv/powerlevel10k
# Add in zsh plugins
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions 
zinit light Aloxaf/fzf-tab
#load completiong
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::pip 
zinit snippet OMZP::command-not-found

autoload -U compinit && compinit

zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
#bindkey
bindkey '^H' backward-kill-word
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
#History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab-complte:__zoxide_z:*' fzf-preview 'ls --color $realpath'

#Aliases
alias ps=procs
alias sed=sd
alias df=duf
alias ls='eza --color'
alias "python -m venv"=pipenv
alias vim=nvim
alias grep=rg
alias reset=c
#alias clear=
alias cat=bat
alias ping=gping
alias 'python -m pip'=pip
alias du=dust
#Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
LAST_REPO=""
function __zoxide_z() {
  if [ "$#" -eq 0 ]; then
    __zoxide_cd ~
  elif [ "$#" -eq 1 ] && [ "$1" = '-' ]; then
    if [ -n "${OLDPWD}" ]; then
      __zoxide_cd "${OLDPWD}"
    else
      # shellcheck disable=SC2016
      \builtin printf 'zoxide: $OLDPWD is not set'
      return 1
    fi
  elif [ "$#" -eq 1 ] && [ -d "$1" ]; then
    __zoxide_cd "$1"
  else
    \builtin local result
    result="$(zoxide query --exclude "$(__zoxide_pwd)" -- "$@")" \
      && __zoxide_cd "${result}"
  fi

  git rev-parse 2>/dev/null

  if [ $? -eq 0 ]; then
    if [ "$LAST_REPO" != $(basename $(git rev-parse --show-toplevel)) ]; then
      onefetch
      LAST_REPO=$(basename $(git rev-parse --show-toplevel))
    fi
  fi
}
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
# Created by `pipx` on 2024-06-10 17:39:04
export PATH="$PATH:/home/jacobendeavour/.local/bin"
