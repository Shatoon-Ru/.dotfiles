#!/usr/bin/env bash

# make sure we have pulled in and updated any submodules
# убедитесь, что мы подключили и обновили все подмодули
git submodule init
git submodule update

# what directories should be installable by all users including the root user
# какие каталоги должны быть доступны для установки всеми пользователями,
# включая пользователя root
base=(
    bash,
    zsh
)

# folders that should, or only need to be installed for a local user
# папки, которые должны быть установлены только 
# для локального пользователя
useronly=(
    git
)

# run the stow command for the passed in directory ($2) in location $1
# запустите команду stow для переданного в каталоге ($2) в расположении $1
stowit() {
    usr=$1
    app=$2
    # -v verbose (вывод информации о произведенных действиях)
    # -R recursive (рекурсивно)
    # -t target (место создания линков)
    stow -v -R -t ${usr} ${app}
}

echo ""
# echo "Stowing apps for user: ${whoami}"
echo "Создание линков для пользователя: ${whoami}"

# install apps available to local users and root
# установка линков, для 
# локальныx пользователей и root
for app in ${base[@]}; do
    stowit "${HOME}" $app 
done

# install only user space folders
# устанавка папок пользовательского пространства
for app in ${useronly[@]}; do
    if [[!"$(whoami)" = *"root"*]]; then
        stowit "${HOME}" $app 
    fi
done

echo ""
echo "##### ВСЕ СДЕЛАНО"
