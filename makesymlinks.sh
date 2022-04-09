#!/bin/bash
############################
# .make.sh
# Этот скрипт создает символические ссылки из домашнего каталога на любые нужные точечные файлы в ~/dotfiles
############################

########## Переменные

dir=~/dotfiles                    # директория с dotfiles directory
olddir=~/dotfiles_old             # каталог резервных копий старых dotfiles
files="bashrc vimrc vim zshrc oh-my-zsh private scrotwm.conf Xresources"    # список файлов/папок для символической ссылки в домашни  каталог

##########

# Создание катлога dotfiles_old в домашней дириктории
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# переход в каталог dotfiles
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# Перемещение существующих dotfiles из homedir в dotfiles_old директорию, затем создаются символические ссылки из каталога homedir на любые дотфайлы в ~/dotfiles директории, которые были указаны в переменной $files
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

install_zsh () {
# Test to see if zshell is installed.  If it is:
if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
    # Clone my oh-my-zsh repository from GitHub only if it isn't already present
    if [[ ! -d $dir/oh-my-zsh/ ]]; then
        git clone http://github.com/robbyrussell/oh-my-zsh.git
    fi
    # Set the default shell to zsh if it isn't currently set to zsh
    if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
        chsh -s $(which zsh)
    fi
else
    # If zsh isn't installed, get the platform of the current machine
    platform=$(uname);
    # If the platform is Linux, try an apt-get to install zsh and then recurse
    if [[ $platform == 'Linux' ]]; then
        if [[ -f /etc/redhat-release ]]; then
            sudo yum install zsh
            install_zsh
        fi
        if [[ -f /etc/debian_version ]]; then
            sudo apt-get install zsh
            install_zsh
        fi
    # If the platform is OS X, tell the user to install zsh :)
    elif [[ $platform == 'Darwin' ]]; then
        echo "Please install zsh, then re-run this script!"
        exit
    fi
fi
}

install_zsh
