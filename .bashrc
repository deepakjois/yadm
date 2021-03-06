# check the window size after each if command, and necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

set -o vi
bind '"jj":vi-movement-mode'
bind -m vi-insert "\C-l":clear-screen

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'


# Fancy Prompt
GIT_PROMPT_ONLY_IN_REPO=1
GIT_PROMPT_SHOW_UPSTREAM=1
GIT_PROMPT_FETCH_REMOTE_STATUS=0   # uncomment to avoid fetching remote status
GIT_PROMPT_SHOW_UNTRACKED_FILES=normal # can be no, normal or all; determines counting of untracked files
GIT_PROMPT_THEME=Solarized
source ~/.bash-git-prompt/gitprompt.sh

# History
shopt -s histappend
export HISTFILESIZE=
export HISTSIZE=
HISTCONTROL=ignoreboth:erasedups
shopt -s cmdhist

# pyenv
[[ $(type -p "pyenv") ]] && eval "$(pyenv init -)"


# Git aliases
alias ga='git add'
alias gst='git status --short --branch'
alias gp='git push'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gcm='git commit -v -m'
alias gb='git branch'
alias gba='git branch -a'
alias gcp='git cherry-pick'
alias gco='git checkout'
alias gll='git log --graph --pretty=oneline --abbrev-commit'
alias gg="git log --graph --pretty=format:'%C(bold)%h%Creset%C(magenta)%d%Creset %s %C(yellow)<%an> %C(cyan)(%cr)%Creset' --abbrev-commit --date=relative"
# From http://blogs.atlassian.com/2014/10/advanced-git-aliases/
# Show commits since last pull
alias gnew="git log HEAD@{1}..HEAD@{0}"
# Add uncommitted and unstaged changes to the last commit
alias gcaa="git commit -a --amend -C HEAD"

# GIT_EDITOR
export GIT_EDITOR=nvim
export EDITOR=nvim

# GPG tty
export GPG_TTY=$(tty)

# Tmux aliases
alias tmux="tmux -2 -u"

pathmunge () {
if ! echo $PATH | egrep -q "(^|:)$1($|:)" ; then
   if [ "$2" = "after" ] ; then
      PATH=$PATH:$1
   else
      PATH=$1:$PATH
   fi
fi
}



export npm_config_prefix=$HOME/npm

# Path
pathmunge $HOME/bin:$HOME/go/bin:$HOME/.cargo/bin:$HOME/.local/bin:$HOME/npm/bin

[ -f ~/.bashrc.local ] && source ~/.bashrc.local
[ -f ~/bash_aliases.local ] && source ~/.bash_aliases.local

# fzf
export FZF_DEFAULT_COMMAND='rg --files'
[ -f ~/.fzf.bash ] && source ~/.fzf.bash


