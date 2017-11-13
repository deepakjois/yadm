# check the window size after each if command, and necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize


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

# Tmux aliases
alias tmux="tmux -2 -u"

# Python 3 virtual environment
alias pyenv="source ~/pyenv/bin/activate"

# Vim server client stuff
alias vsrv="vim --servername srv"
alias vr="vim --servername srv --remote-silent"

# Go code
alias gocode="cd ~/go/src/github.com"

# Backup alias
alias configbak="rsync --verbose --progress --stats --compress --rsh=/usr/bin/ssh --recursive --times --perms --links --delete=during ~/.config deepak@192.168.0.100:backups/cottongeeks"

pathmunge () {
if ! echo $PATH | egrep -q "(^|:)$1($|:)" ; then
   if [ "$2" = "after" ] ; then
      PATH=$PATH:$1
   else
      PATH=$1:$PATH
   fi
fi
}


# Path
pathmunge $HOME/bin:$HOME/go/bin:$HOME/.cargo/bin:$HOME/.local/bin

source ~/.bashrc.local
source ~/.bash_aliases.local


[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/deepak/.sdkman"
[[ -s "/home/deepak/.sdkman/bin/sdkman-init.sh" ]] && source "/home/deepak/.sdkman/bin/sdkman-init.sh"
