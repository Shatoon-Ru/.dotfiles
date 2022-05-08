#!/bin/sh

##############################################
#   Настрока опций (смотри man zshoptions)   #
##############################################
#
# Настройка истории
#
setopt extended_history     # добавление в историю время выполнения команд
setopt inc_append_history   # обновляет историю после каждого нажатия enter
setopt share_history        # общая история между всеми сессиями/терминалами
setopt hist_ignore_all_dups # игнорирование всех дубилкатов в истории
setopt hist_ignore_space    # игнорирование строк начинающихся с пробела
setopt hist_reduce_blanks   # игнорирование пустых строк

# setopt globdots             # добавляет скрытые файлы в список aвтоподстановки
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments # Возможность вводить коментарии после '#'
stty stop undef	      	    # Отключение ctrl-s для freeze terminal.
zle_highlight=('paste:none')

unsetopt BEEP               # Отключение БИПА


# Настройка завершения
autoload -Uz compinit
zstyle ':completion:*' menu select
# zstyle ':completion::complete:lsof:*' menu yes select
zmodload zsh/complist       # Расширение списка завершения
# compinit
_comp_options+=(globdots)		# Добавление скрытых файлов

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Цвета
autoload -Uz colors && colors

# Чтение Functions
source "$ZDOTDIR/zsh-functions"

# Добавление профильных файлов
zsh_add_file "zsh-exports"
zsh_add_file "zsh-vim-mode"
zsh_add_file "zsh-aliases"
zsh_add_file "zsh-prompt"

# Плагины
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "hlissner/zsh-autopair"
# zsh_add_completion "esc/conda-zsh-completion" false
# Еще плагины: https://github.com/unixorn/awesome-zsh-plugins
# Еще completions https://github.com/zsh-users/zsh-completions

# Key-bindings
bindkey -s '^o' 'ranger^M'
bindkey -s '^f' 'zi^M'
bindkey -s '^s' 'ncdu^M'
# bindkey -s '^n' 'nvim $(fzf)^M'
# bindkey -s '^v' 'nvim\n'
bindkey -s '^z' 'zi^M'
bindkey '^[[P' delete-char
bindkey "^p" up-line-or-beginning-search # Up
bindkey "^n" down-line-or-beginning-search # Down
bindkey "^k" up-line-or-beginning-search # Up
bindkey "^j" down-line-or-beginning-search # Down
bindkey -r "^u"
bindkey -r "^d"

# FZF 
# TODO разобраться с FZF
# [ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
# [ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
# [ -f /usr/share/doc/fzf/examples/completion.zsh ] && source /usr/share/doc/fzf/examples/completion.zsh
# [ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# [ -f $ZDOTDIR/completion/_fnm ] && fpath+="$ZDOTDIR/completion/"
# export FZF_DEFAULT_COMMAND='rg --hidden -l ""'
# compinit

# Редактирование строки в neovim ctrl-e:
# autoload edit-command-line; zle -N edit-command-line
# bindkey '^e' edit-command-line


# Установка задержки и частоты повтора клавиш
xset r rate 210 40

# Переназначение своих переменных среды
export EDITOR="nvim"
export TERMINAL="mate-terminal"
export BROWSER="yandex-browser"

# Для QT Themes
export QT_QPA_PLATFORMTHEME=qt5ct

# переназначение escape на Caps
setxkbmap -option caps:escape
# размен местами escape и caps
# setxkbmap -option caps:swapescape

