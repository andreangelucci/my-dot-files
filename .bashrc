# Create PS1 structure
parse_git() {
	branch=$(git branch 2> /dev/null | grep \* | colrm 1 2)
	[[ -n $(git status --porcelain 2> /dev/null ) ]] && status=󰈸
	[[ -n $branch ]] && line=" ($branch)"
	[[ -n $status ]] && line="$line $status"
	[[ $line ]] && echo $line
}
PS1="\[\033[0;31m\] \W \[\033[0;33m\]\$(parse_git) \[\033[31m\]\$\[\033[0m\] "

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:/Users/andreangeluci/.local/bin:/opt/homebrew/opt/libpq/bin:$PATH"

set -o vi
shopt -s autocd
export EDITOR=nvim
bind -f ~/.inputrc

# Fuzzy Finder configuration
FZF_TMUX=1
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export HISTSIZE=3000
export HISTFILESIZE=3000

# External Files
. ~/.bash_aliases
. ~/.bash_variables
. ~/.bash_functions
