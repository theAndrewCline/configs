export EDITOR='nvim'

fpath=(~/.zsh $fpath)
fpath=(~/.zsh/plugins $fpath)

utoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit -u

fpath+=/opt/homebrew/share/zsh/site-functions
fpath+=~/.local/bin

complete -C '~/.local/bin/aws_completer' aws

alias lg='lazygit'
alias li='ultralist'

export PATH=$PATH:~/.local/bin
export PATH=~/.scripts:$PATH
export PATH=~/configs/scripts:$PATH
export PATH=~/go/bin:$PATH
export PATH="/Users/acline/.deno/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND="rg --files"

alias luamake=/home/andrewcline/.config/nvim/lua-language-server/3rd/luamake/luamake

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

export LIBRARY_PATH=$LIBRARY_PATH:/opt/homebrew/lib

alias python=python3

alias work="timer 30m && terminal-notifier -message 'Pomodoro'\
        -title 'Work Timer is up! Take a Break 😊'\
        -appIcon '~/Pictures/pumpkin.png'\
        -sound Crystal"
        
alias rest="timer 10m && terminal-notifier -message 'Pomodoro'\
        -title 'Break is over! Get back to work 😬'\
        -appIcon '~/Pictures/pumpkin.png'\
        -sound Crystal"

eval "$(starship init zsh)"
