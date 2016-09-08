# ----------------------------------------------------------------------------
# System
# ----------------------------------------------------------------------------
alias vi="vim"
alias inst='sudo apt-get install'
alias gtar='tar zxvf'
alias xtar='tar xvf'
alias l='ls -hlrt'
alias h='history | awk "{print \$2}" | sort | uniq -c |sort -rn | head -50' 
alias hg='history| egrep'
alias bc='bc -l'
alias ag='alias | egrep -i'

# ----------------------------------------------------------------------------
# Expressvpn
# ----------------------------------------------------------------------------

alias xc='expressvpn connect'
alias xp='expressvpn status'

# ----------------------------------------------------------------------------
# Browse
# ----------------------------------------------------------------------------
alias cDo='cd $HOME/Downloads'
alias cdo='cd $HOME/dotfiles'
alias cbi='cd $HOME/bin'
alias cco='cd $HOME/config'
alias cv='cd ~/dotfiles/vim'

# ----------------------------------------------------------------------------
# Edit quickly
# ----------------------------------------------------------------------------
alias rz='source ~/.zshrc'
alias z='vi $HOME/.zshrc && source ~/.zshrc'
alias a='vi ~/config/aliases.sh && source ~/.zshrc'
alias e='vi ~/config/exports.sh && source ~/.zshrc'
alias v='cd ~/dotfiles && vi vimrc && cd -'

# ----------------------------------------------------------------------------
# Django
# ----------------------------------------------------------------------------
alias dj='python $DJ_CUR_PROJECT/manage.py'
alias djc='python $DJ_CUR_PROJECT/manage.py collectstatic'
alias djr='python $DJ_CUR_PROJECT/manage.py runserver'
alias djm='python $DJ_CUR_PROJECT/manage.py makemigrations && \
            python $DJ_CUR_PROJECT/manage.py migrate'

# ----------------------------------------------------------------------------
# Python
# ----------------------------------------------------------------------------
alias pips='sudo -H pip'
alias ipy='ipython'

# ----------------------------------------------------------------------------
# Webfactional
# ----------------------------------------------------------------------------
alias wf='ssh netsamir@netsamir.webfactional.com'

# ----------------------------------------------------------------------------
# Git
# ----------------------------------------------------------------------------
alias findgit='find ~/dotfiles -type f -exec egrep "git@git" {} \;'
