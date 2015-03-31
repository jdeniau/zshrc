# mapado zshrc

# environment
export PATH=$PATH:/sbin/:/usr/local/sbin:/usr/sbin
#local LOCALE=en_US.UTF-8
local LOCALE="fr_FR.UTF-8"
export LC_COLLATE="$LOCALE"
export LC_CTYPE="$LOCALE"
export LC_MESSAGES="$LOCALE"
export LC_MONETARY="$LOCALE"
export LC_NUMERIC="$LOCALE"
export LC_TIME="$LOCALE"
export LANG="$LOCALE"

export PAGER="less"
export EDITOR="vim"
export VISUAL="vim"
export LESS="-I -M -R --shift 5"
export BLOCKSIZE="K"

export WORKON_HOME=/home/envs/$USER
export VIRTUALENVWRAPPER_HOOK_DIR=/home/envs
source /usr/local/bin/virtualenvwrapper.sh
# export PYTHONPATH=$PYTHONPATH:$MAPADO_ROOT

# TreeTagger
export TAGDIR=/opt/treetagger
export PATH=$PATH:$TAGDIR/cmd
export PATH=$PATH:$TAGDIR/bin

export ZSH=/etc/zsh/plugins/oh-my-zsh

export COMPOSER_CACHE_DIR=/home/cache/composer

# history
HISTFILE=~/.zhistory
HISTSIZE=5000
SAVEHIST=5000
setopt append_history hist_ignore_all_dups hist_reduce_blanks

# options
setopt auto_list
setopt auto_param_keys
setopt auto_param_slash
setopt autocd
setopt equals
setopt extended_glob
setopt hash_cmds
setopt hash_dirs
setopt numeric_glob_sort
setopt transient_rprompt
unsetopt beep
unsetopt notify

# Color vars
autoload -U colors
colors

umask 0022

# Bindings
# emacs :
bindkey -e
# or vi :
#bindkey -v

# Fixes from Debian
if [[ "$TERM" != emacs ]]; then
  [[ -z "$terminfo[kdch1]" ]] || bindkey -M emacs "$terminfo[kdch1]" delete-char
  [[ -z "$terminfo[khome]" ]] || bindkey -M emacs "$terminfo[khome]" beginning-of-line
  [[ -z "$terminfo[kend]" ]] || bindkey -M emacs "$terminfo[kend]" end-of-line
  [[ -z "$terminfo[kich1]" ]] || bindkey -M emacs "$terminfo[kich1]" overwrite-mode
  [[ -z "$terminfo[kdch1]" ]] || bindkey -M vicmd "$terminfo[kdch1]" vi-delete-char
  [[ -z "$terminfo[khome]" ]] || bindkey -M vicmd "$terminfo[khome]" vi-beginning-of-line
  [[ -z "$terminfo[kend]" ]] || bindkey -M vicmd "$terminfo[kend]" vi-end-of-line
  [[ -z "$terminfo[kich1]" ]] || bindkey -M vicmd "$terminfo[kich1]" overwrite-mode

  # [[ -z "$terminfo[cuu1]" ]] || bindkey -M viins "$terminfo[cuu1]" vi-up-line-or-history
  [[ -z "$terminfo[cuu1]" ]] || bindkey -M viins "$terminfo[cuu1]" up-line-or-history
  [[ -z "$terminfo[cuf1]" ]] || bindkey -M viins "$terminfo[cuf1]" vi-forward-char
  # [[ -z "$terminfo[kcuu1]" ]] || bindkey -M viins "$terminfo[kcuu1]" vi-up-line-or-history
  [[ -z "$terminfo[kcuu1]" ]] || bindkey -M viins "$terminfo[kcuu1]" up-line-or-history
  # [[ -z "$terminfo[kcud1]" ]] || bindkey -M viins "$terminfo[kcud1]" vi-down-line-or-history
  [[ -z "$terminfo[kcud1]" ]] || bindkey -M viins "$terminfo[kcud1]" down-line-or-history
  [[ -z "$terminfo[kcuf1]" ]] || bindkey -M viins "$terminfo[kcuf1]" vi-forward-char
  [[ -z "$terminfo[kcub1]" ]] || bindkey -M viins "$terminfo[kcub1]" vi-backward-char

  # ncurses fogyatekos
  # [[ "$terminfo[kcuu1]" == "O"* ]] && bindkey -M viins "${terminfo[kcuu1]/O/[}" vi-up-line-or-history
  # [[ "$terminfo[kcud1]" == "O"* ]] && bindkey -M viins "${terminfo[kcud1]/O/[}" vi-down-line-or-history
  [[ "$terminfo[kcuu1]" == ""* ]] && bindkey -M viins "${terminfo[kcuu1]/O/[}" up-line-or-history
  [[ "$terminfo[kcud1]" == ""* ]] && bindkey -M viins "${terminfo[kcud1]/O/[}" down-line-or-history
  [[ "$terminfo[kcuf1]" == "O"* ]] && bindkey -M viins "${terminfo[kcuf1]/O/[}" vi-forward-char
  [[ "$terminfo[kcub1]" == "O"* ]] && bindkey -M viins "${terminfo[kcub1]/O/[}" vi-backward-char
  [[ "$terminfo[khome]" == "O"* ]] && bindkey -M viins "${terminfo[khome]/O/[}" beginning-of-line
  [[ "$terminfo[kend]" == "O"* ]] && bindkey -M viins "${terminfo[kend]/O/[}" end-of-line
  [[ "$terminfo[khome]" == "O"* ]] && bindkey -M emacs "${terminfo[khome]/O/[}" beginning-of-line
  [[ "$terminfo[kend]" == "O"* ]] && bindkey -M emacs "${terminfo[kend]/O/[}" end-of-line
fi

# URxvt keys
bindkey '[2~' overwrite-mode
bindkey '[3~' delete-char
bindkey '[7~' beginning-of-line
bindkey '[8~' end-of-line
bindkey '[5~' history-search-backward
bindkey '[6~' history-search-forward
bindkey ';5C' forward-word
bindkey ';5D' backward-word


# Man
bindkey '^[h' run-help

# Edit cmdline
autoload edit-command-line
zle -N edit-command-line
bindkey '^[e' edit-command-line
bindkey '^[x' execute-named-cmd

# Completion
autoload -Uz compinit
autoload -Uz complist
compinit
zstyle ':completion:*' menu select=5
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' completer _complete _correct _approximate
zstyle ':completion:*' max-errors 2 not-numeric
zstyle ':completion:*:approximate:::' max-errors 3 numeric
zstyle ':completion:*' group-name ''
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' original true
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*:rm:*' ignore-line yes

# Per OS settings
case `uname -s` in
  FreeBSD)
    export LSCOLORS="exgxfxcxcxdxdxhbadacec"
    alias ls="ls -G"
    ZCOLORS="no=00:fi=00:di=00;34:ln=00;36:pi=00;32:so=00;35:do=00;35:bd=00;33:cd=00;33:or=05;37;41:mi=05;37;41:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=00;32:"
    zstyle ':completion:*' list-colors ${(s.:.)ZCOLORS}
    ;;
  Linux)
    if [[ -r ~/.dir_colors ]]; then
      eval `dircolors -b ~/.dir_colors`
    elif [[ -r /etc/DIR_COLORS ]]; then
      eval `dircolors -b /etc/DIR_COLORS`
    else
      eval `dircolors`
    fi
    zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
    alias ls="ls --color=auto"
    ;;
esac

# Aliases
alias l="ls -A -F"
alias ll="ls -h -l"
alias la="ls -a"
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
alias editor="${EDITOR}"

# mapado aliases
source "zshaliases"

# Git prompt
if [ -f "/etc/zsh/plugins/git-prompt/zshrc.sh" ]; then
  source "/etc/zsh/plugins/git-prompt/zshrc.sh"
  #ZSH_THEME_GIT_PROMPT_NOCACHE=1
  HAS_GIT_PROMPT=1
fi

# Right prompt with clock
RPS1="  %{$fg_no_bold[yellow]%}%D{%d/%m/%y %H:%M:%S}%{${reset_color}%}"

# Others prompts
PS2="%{$fg_no_bold[yellow]%}%_>%{${reset_color}%} "
PS3="%{$fg_no_bold[yellow]%}?#%{${reset_color}%} "

# Change terminal/screen/tmux window title
function title {
  local t="%n@%m %~"

  case $TERM in
    screen) # and tmux
      print -nP "\ek$t\e\\"
      print -nP "\e]0;$t\a"
      ;;
    xterm*|rxvt*|(E|e)term)
      print -nP "\e]0;$t\a"
      ;;
  esac
}

function precmd {
  # Set window title
  title

  # Color for non-text things
  local misc="%{${fg_no_bold[white]}%}"

  # Change path color given user rights on it
  if [[ -O "${PWD}" ]]; then # owner
    local path_color="${fg_bold[yellow]}"
  elif [[ -w "${PWD}" ]]; then # can write
    local path_color="${fg_bold[blue]}"
  else # other
    local path_color="${fg_bold[red]}"
  fi

  if [[ $UID = 0 ]]; then
    local login_color="${fg_bold[red]}"
  else
    local login_color="${fg_bold[green]}"
  fi

  # Display return code when not 0
  # local return_code="%(?..${misc}!%{${fg_no_bold[red]}%}%?${misc}! )"
  # Host
  local host="%{${fg_no_bold[cyan]}%}%m"
  # User
  local user="${misc}[%{${login_color}%}%n${misc}]"
  # Current path
  local cwd="%{${path_color}%}%48<...<%~"
  # Red # for root, green % for user
  local sign="%{${login_color}%}%#"

  # Git
  if [ -n "$HAS_GIT_PROMPT" ]; then
    local git_status=" \${\$(git_super_status)/git:/}"
  else
    local git_status=""
  fi

  # Set the prompt
  #PS1="${return_code}${host} ${user} ${cwd}${git_status} ${sign}%{${reset_color}%} "
  PS1="${host} ${user} ${cwd}%{${reset_color}%}${git_status} ${sign}%{${reset_color}%} "
}

function run-help-sudo {
  if [ $# -eq 0 ]; then
    man sudo
  else
    man $1
  fi
}

: # noop

OLDIFS=$IFS
IFS=$'\n';

echo "\n${fg[green]}===== [${fg[white]}Useful aliases${fg[green]}] =====${reset_color}"
echo "ccat
reloadSatis
clone
mkcd
mdown
statusall
git-branch-delete
custom-acl"

#alias | cut -d= -f1
#cat /etc/zsh/zshaliases | grep "^function" | cut -d" " -f2

echo "\n${fg[green]}===== [${fg[white]}Git system aliases${fg[green]}] =====${reset_color}"
for a in `git config --system --list | grep '^alias' | cut -d" " -f1,2 | cut -d"." -f2`
do
    echo "  ${fg[cyan]}*${reset_color}" ${a/=/${fg[cyan]} : ${reset_color}}
done
echo "\033[30mType \`git [alias] --help\` for more informations"

echo "${fg[green]}[==============================]${reset_color}\n"

IFS=$OLDIFS


if [ -f "/etc/zsh/plugins/oh-my-zsh/oh-my-zsh.sh" ]; then
    DISABLE_AUTO_UPDATE=true
    plugins=(node npm phing symfony2 virtualenvwrapper supervisor pip composer)
    source "/etc/zsh/plugins/oh-my-zsh/oh-my-zsh.sh"
fi

# vim:filetype=zsh:tabstop=2:shiftwidth=2:
