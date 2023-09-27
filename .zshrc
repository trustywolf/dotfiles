# trustywolf's .zshrc
# Last update: 2022-10-27

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
if ! [[ "$PATH" =~ "$HOME/.cargo/bin:$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.cargo/bin:$HOME/.local/bin:$HOME/bin:$PATH"
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
	if [ -f /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
		source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
	fi
	if [ -f /usr/local/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh ]; then
      		source /usr/local/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
	fi
        if type brew &>/dev/null; then
          FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
          autoload -Uz compinit
          compinit
        fi
        #fast-theme -q free
        ;;
    linux*)
        if [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
		source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
	fi
	if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
		source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
	fi
        ;;
esac

# prompt
#prompt grml-large

# aliases
alias t='tmux'
