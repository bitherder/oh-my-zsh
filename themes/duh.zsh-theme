# DUH - created by Larry Baltz.
# Initially hacked from the CRUNCH theme.
#
# * The time (not the date)
# * The RVM version and gemset (omitting the 'ruby' name if it's MRI)
# * The current directory
# * The Git branch and its 'dirty' state
# 
# Colors are at the top so you can mess with those separately if you like.
# For the most part I stuck with Dallas's.

DUH_BRACKET_COLOR="%{$fg[white]%}"
DUH_TIME_COLOR="%{$fg[yellow]%}"
DUH_RVM_COLOR="%{$fg[magenta]%}"
DUH_DIR_COLOR="%{$fg[cyan]%}"
DUH_GIT_BRANCH_COLOR="%{$fg[green]%}"
DUH_GIT_CLEAN_COLOR="%{$fg[green]%}"
DUH_GIT_DIRTY_COLOR="%{$fg[red]%}"
DUH_ERROR_COLOR="%{$fg[red]%}"

# These Git variables are used by the oh-my-zsh git_prompt_info helper:
ZSH_THEME_GIT_PROMPT_PREFIX="$DUH_BRACKET_COLOR:$DUH_GIT_BRANCH_COLOR"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_CLEAN=" $DUH_GIT_CLEAN_COLOR✓"
ZSH_THEME_GIT_PROMPT_DIRTY=" $DUH_GIT_DIRTY_COLOR✗"

# Our elements:
DUH_TIME_="$DUH_TIME_COLOR%T%{$reset_color%}"
if [ -e ~/.rvm/bin/rvm-prompt ]; then
  DUH_RVM_="$DUH_RVM_COLOR\${\$(~/.rvm/bin/rvm-prompt i v g)#ruby-}%{$reset_color%}"
else
  if which rbenv &> /dev/null; then
    DUH_RVM_="$DUH_RVM_COLOR\${\$(rbenv version | sed -e 's/ (set.*$//' -e 's/^ruby-//')}%{$reset_color%}"
  fi
fi

if [ -n "$SSH_TTY" ]; then
  DUH_HOST_=" %n@%m "
else
  DUH_HOST_=" "
fi
DUH_ERROR_="$DUH_ERROR_COLOR%(?..%?:)%{$reset_color%}"
DUH_DIR_="$DUH_DIR_COLOR%~\$(git_prompt_info) "
DUH_PROMPT="$DUH_BRACKET_COLOR➭ "

# Put it all together!
PROMPT="$DUH_ERROR_%! $DUH_TIME_ $DUH_RVM_$DUH_HOST_$DUH_PROMPT%{$reset_color%}"
RPROMPT="$DUH_DIR_%{$reset_color%}"
