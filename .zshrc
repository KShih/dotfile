# export PATH=$HOME/bin:/usr/local/bin:$PATH
export TERM="xterm-256color"
# Path to your oh-my-zsh installation.
export PATH="/usr/local/mysql/bin:$PATH"
export GOPATH=$HOME/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export NVM_DIR="/Users/kshih/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

export CLICOLOR=1

# virtualenv
export WORKON_HOME=$HOME/code/.virtualenvs
export PROJECT_HOME=$HOME/code
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
export WORKON_HOME=$HOME/Envs 
source /usr/local/bin/virtualenvwrapper.sh

#alias
#system
alias vimrc="vim ~/.vimrc"
alias zshrc="vim ~/.zshrc"
alias tmuxrc="vim ~/.tmux.conf"
alias ls="gls -F --color=auto"
alias mv="mv -i"
alias cp="cp -i"
alias less="less -R"
alias grep="grep --color=auto"
alias cask="brew cask"
alias dk="docker"
alias rd2G="diskutil erasevolume HFS+ RamDisk $(hdiutil attach -nomount ram://$((2*1024*2048)))"
alias rd4G="diskutil erasevolume HFS+ RamDisk $(hdiutil attach -nomount ram://$((4*1024*2048)))"
alias save='git commit -a -m "save 'date'"'
alias py3="python3"
#ssh
alias ptt="ssh bbsu@ptt.cc"
alias wp="ssh Shih@120.113.173.155"
alias vm="ssh -v kidd@192.168.0.5"
alias vm1="ssh -v kidd@10.51.174.214"
function mkcd { mkdir -p "$@" && cd "$@";  }

#cd 
alias rd="cd /Volumes/Ramdisk/"
alias gd="cd ~/Google\ Drive/Desktop"
alias ryu="cd /Users/kshih/ryu/ryu/app"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/kshih/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/kshih/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/kshih/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/kshih/google-cloud-sdk/completion.zsh.inc'; fi


### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

#################################################################
# FUNCTIONS TO MAKE CONFIGURATION LESS VERBOSE
turbo0()   { zinit ice wait"0a" lucid             "${@}"; }
turbo1()   { zinit ice wait"0b" lucid             "${@}"; }
turbo2()   { zinit ice wait"0c" lucid             "${@}"; }
zload()    { zinit light                          "${@}"; }
#################################################################

# Theme
zinit ice depth=1
zload romkatv/powerlevel10k
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval $(gdircolors -b $HOME/.dircolors)

# Folder
turbo1; zload rupa/z
turbo0; zload andrewferrier/fzf-z
turbo0; zload changyuheng/fz

# Completions
turbo0 blockf
zload zsh-users/zsh-completions
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

turbo0 atload"_zsh_autosuggest_start"
zload zsh-users/zsh-autosuggestions

turbo2 atinit"ZINIT[COMPINIT_OPTS]='-i' zpcompinit; zpcdreplay"
zload zdharma/fast-syntax-highlighting

# Ctrl+r
turbo1; zload zdharma/history-search-multi-word


