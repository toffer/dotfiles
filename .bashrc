## Bash completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

## Bash configuration
export HISTFILESIZE=
export HISTSIZE=

## virtualenv
export VIRTUALENV_USE_DISTRIBUTE=True

## virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

## ls
export CLICOLOR=1

## Aliases
alias ll='ls -l'
alias lh='ls -lh'

# Prompt

## Colors
DEFAULT=$'\e[00m'
RED=$'\e[31m'
GREEN=$'\e[32m'
YELLOW=$'\e[33m'
BLUE=$'\e[34m'

## Git status in prompt
export GIT_PS1_SHOWDIRTYSTATE=yes
export GIT_PS1_SHOWSTASHSTATE=yes
export GIT_PS1_SHOWUNTRACKEDFILES=yes

## Virtualenv
VIRTUAL_ENV_DISABLE_PROMPT=1

prompt_virtualenv() {
    if [ x$VIRTUAL_ENV != x ]; then
        echo -n "workon $YELLOW"
        basename "${VIRTUAL_ENV}"
    fi
}
 
## New prompt
# PS1='\n\u at \h in \w\n$ '
PS1='\n\[${GREEN}\]\u \
\[${DEFAULT}\]at \[${GREEN}\]\h \
\[${DEFAULT}\]in \[${BLUE}\]\w\
\[${RED}\]$(__git_ps1)\
\[${DEFAULT}\] $(prompt_virtualenv)\
\[${DEFAULT}\]\n$ '