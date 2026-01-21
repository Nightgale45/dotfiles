zmodload zsh/complist
autoload -U compinit && compinit
autoload -U colors && colors

export PATH="$PATH:/opt/nvim-linux-x86_64/bin:$XDG_BIN_HOME"

# cmp opts
zstyle ':completion:*' menu select # tab opens cmp menu
zstyle ':completion:*' special-dirs true # force . and .. to show in cmp menu
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} ma=0\;33 # colorize cmp menu
# zstyle ':completion:*' file-list true # more detailed list
zstyle ':completion:*' squeeze-slashes false # explicit disable to allow /*/ expansion


# main opts
setopt append_history inc_append_history share_history # better history
# on exit, history appends rather than overwrites; history is appended as soon as cmds executed; history shared across sessions
setopt auto_menu menu_complete # autocmp first menu match
setopt autocd # type a dir to cd
setopt auto_param_slash # when a dir is completed, add a / instead of a trailing space
setopt no_case_glob no_case_match # make cmp case insensitive
setopt globdots # include dotfiles
setopt extended_glob # match ~ # ^
setopt interactive_comments # allow comments in shell
unsetopt prompt_sp # don't autoclean blanklines

# alias
alias gst='git status'
alias gpush='git push origin'
alias gpull='git pull origin'
alias gcm='git commit -m'
alias gco='git checkout'
alias gcob='git checkout -b'


HISTFILE="$XDG_CACHE_HOME/zsh_history" 
eval "$(starship init zsh)"
eval "$(mise activate zsh)"
