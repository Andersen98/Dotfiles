# Options {{{1
#
# Arranged according to `man zshoptions`

# Changing Directories {{{2

setopt AUTO_CD            # Change to a directory just by typing its name
setopt AUTO_PUSHD         # Make cd push each old directory onto the stack
setopt CDABLE_VARS        # Like AUTO_CD, but for named directories
setopt PUSHD_IGNORE_DUPS  # Don't push duplicates onto the stack

# }}}2

# Completion {{{2

unsetopt LIST_BEEP        # Don't beep on an ambiguous completion

# Expansion and Globbing {{{2

# setopt EXTENDED_GLOB

# }}}2

# History {{{2

# History environment variables
HISTFILE=${HOME}/.zsh_history
HISTSIZE=120000  # Larger than $SAVEHIST for HIST_EXPIRE_DUPS_FIRST to work
SAVEHIST=100000

setopt EXTENDED_HISTORY       # Save time stamps and durations
setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicates first


setopt HIST_IGNORE_DUPS     # Do not enter 2 consecutive duplicates into history
setopt HIST_IGNORE_SPACE    # Ignore command lines with leading spaces
setopt HIST_VERIFY          # Reload results of history expansion before executing
setopt INC_APPEND_HISTORY   # Constantly update $HISTFILE
setopt SHARE_HISTORY        # Constantly share history between shell instances

# }}}2

# Input/Output {{{2

setopt INTERACTIVE_COMMENTS # Allow comments in interactive mode

# }}}2

# Job Control {{{2

: ${AGKDOT_SYSTEMINFO:=$(uname -a)}

# Disable nice for background processes in WSL
[[ ${AGKDOT_SYSTEMINFO} == *Microsoft* ]] && unsetopt BG_NICE

# }}}2

# }}}1
# # Some autoloaded functions {{{1

# Test for minimal ZSH version
autoload -Uz is-at-least

# Function for batch moving and renaming of files
autoload -Uz zmv

autoload -Uz compinit
compinit -u -d "${HOME}/.zcompdump_${ZSH_VERSION}"
# Menu-style completion
zstyle ':completion:*' menu select

# use the vi navigation keys (hjkl) besides cursor keys in menu completion
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char        # left
bindkey -M menuselect 'k' vi-up-line-or-history   # up
bindkey -M menuselect 'l' vi-forward-char         # right
bindkey -M menuselect 'j' vi-down-line-or-history # bottom

# Use dircolors $LS_COLORS for completion when possible
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Allow pasting URLs as CLI arguments
if [[ $ZSH_VERSION != '5.1.1' ]] && [[ $TERM != 'dumb' ]] \
  && (( ! $+INSIDE_EMACS )); then
  if is-at-least 5.1; then
    autoload -Uz bracketed-paste-magic
    zle -N bracketed-paste bracketed-paste-magic
  fi
  autoload -Uz url-quote-magic
  zle -N self-insert url-quote-magic
elif [[ $TERM == 'dumb' ]]; then
  unset zle_bracketed_paste # Avoid ugly control sequences
fi

# Use Esc-K for run-help
bindkey -M vicmd 'K' run-help

# Allow v to edit the command line
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd 'v' edit-command-line

# Fuzzy matching of completions
# https://grml.org/zsh/zsh-lovers.html
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle -e ':completion:*:approximate:*' \
  max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'

# Have the completion system announce what it is completing
zstyle ':completion:*' format 'Completing %d'

# In menu-style completion, give a status bar
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'

# In the line editor, number of matches to show before asking permission
LISTMAX=9999
### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
  print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
  command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
  command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" &&
    print -P "%F{33} %F{34}Installation successful.%f%b" ||
    print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
( (${+_comps})) && _comps[zinit]=_zinit

# fzf-marks
zinit ice wait lucid
zinit load urbainvaes/fzf-marks

zinit snippet "${HOME}/.zsh.d/file_manager_keybinds.zsh"
