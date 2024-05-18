# trustywolf's .zshrc
# Last update: 2024-05-19

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
if ! [[ "$PATH" =~ "$HOME/.dotnet/tools:$HOME/.cargo/bin:$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.dotnet/tools:$HOME/.cargo/bin:$HOME/.local/bin:$HOME/bin:$PATH"
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
	if [ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
		source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
	fi
	if [ -f /opt/homebrew/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh ]; then
      		source /opt/homebrew/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
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

# k8s completion
[[ $commands[containerlab] ]] && source <(containerlab completion zsh)
[[ $commands[helm] ]] && source <(helm completion zsh)
[[ $commands[kind] ]] && source <(kind completion zsh)
[[ $commands[kubeadm] ]] && source <(kubeadm completion zsh)
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)

# prompt
#prompt grml-large

# aliases
alias t='tmux'
