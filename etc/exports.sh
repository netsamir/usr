# ----------------------------------------------------------------------------
# System
# ----------------------------------------------------------------------------

export DEFAULT_USER="netsamir"
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
export PATH=$HOME/bin:$HOME/local/bin:$PATH
export MANPATH="/usr/local/man:$MANPATH"
export PERL5LIB=$HOME/local/lib64
export PYTHONSTARTUP=~/.pythonrc

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

set -o vi
# Preferred editor for local and remote sessions
export EDITOR='vim'
#if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
#else
#   export EDITOR='mvim'
#fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/dsa_id"
# ----------------------------------------------------------------------------
# Django
# ----------------------------------------------------------------------------
export DJ_CUR_PROJECT='/home/netsamir/Python/Mercyl/src'
