# trustywolf's .zshrc
# Last update: 2022-04-26

# Source global definitions
if [ -f /etc/zshrc ]; then
        . /etc/zshrc
fi

# LANG
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
setopt print_eight_bit

# zsh-completions
case ${OSTYPE} in
    darwin*)
        if type brew &>/dev/null; then
            FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
        fi
        ;;
esac

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

export GPG_TTY=$(tty)

# User specific aliases and functions
if [ -d ~/.zshrc.d ]; then
        for rc in ~/.zshrc.d/*; do
                if [ -f "$rc" ]; then
                        . "$rc"
                fi
        done
fi

# plugins
case ${OSTYPE} in
    darwin*)
        export PATH="/usr/local/sbin:$PATH"
        source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
        source /usr/local/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
        #fast-theme -q free
        ;;
    linux*)
        source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
        source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
        ;;
esac

# prompt
#prompt grml-large

# aliases
alias t='tmux'
