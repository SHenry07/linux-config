#!/bin/bash

DIR=$(cd $(dirname $0) && pwd)
OH_MY_ZSH_FOLDER="${HOME}/.oh-my-zsh"

if [[ -z "`cat /etc/shells | grep -w zsh`" ]] ; then
  sudo apt install zsh
fi

if [[ ! -d "${OH_MY_ZSH_FOLDER}" ]] ; then
    sh -c "${DIR}/zsh.sh"
else
    echo "oh-my-zsh already installed"; # Should I prompt for repull?
fi


OH_MY_ZSH_PLUGINS_FOLDER=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins

# Oh My Zsh
# git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
# Userssource ~/.zshrc in mainland China can use the official mirror on gitee.com for faster download.
# werlevel10k/powerlevel10k"#'
# 中国大陆用户可以使用 gitee.com 上的官方镜像加速下载.

git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
## zsh-autosugestions
ZSH_SUGGESTIONS_GIT_URL="https://github.com/zsh-users/zsh-autosuggestions"
git clone --depth=1 $ZSH_SUGGESTIONS_GIT_URL "${OH_MY_ZSH_PLUGINS_FOLDER}/zsh-autosuggestions"

## zsh-syntax-highlighting
ZSH_SYNTAX_HIGHLIGHTING_GIT_URL="https://github.com/zsh-users/zsh-syntax-highlighting.git"
git clone --depth=1 $ZSH_SYNTAX_HIGHLIGHTING_GIT_URL "${OH_MY_ZSH_PLUGINS_FOLDER}/zsh-syntax-highlighting"

sudo apt install autojump
cp ${DIR}/{.zshrc,.p10k.zsh,.aliases,.vimrc} ~/
