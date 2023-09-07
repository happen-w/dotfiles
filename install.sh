#! /bin/bash

scriptDir=$(cd `dirname $0`; pwd)
. "$scriptDir/public/index.sh"

cp /etc/apt/sources.list /etc/apt/sources.list.bak
sed -i "s@http://.*archive.ubuntu.com@http://mirrors.tuna.tsinghua.edu.cn@g" /etc/apt/sources.list
sed -i "s@http://.*security.ubuntu.com@http://mirrors.tuna.tsinghua.edu.cn@g" /etc/apt/sources.list
apt update

install_list=(vim curl zsh git ripgrep net-tools unzip nodejs npm wget tldr gdb cmake)

for elem in ${install_list[@]}
do
  if ! isCmdExist $elem; then
    echoInfo 'installing'$elem
    apt install -y $elem
    echoInfo 'intalled '$elem' done'
  fi
done

# echoInfo 'install neovim'
# echo -e "\n" | add-apt-repository ppa:neovim-ppa/stable
# apt-get update
# apt-get install -y neovim
# apt-get install -y python3-dev python3-pip
# git config --global core.editor "vim"
# mkdir -p ~/.config/nvim/
# cp -R $scriptDir/nvim/* ~/.config/nvim/

git config --global url."github".insteadOf kgithub

# git clone --depth=1 https://kgithub.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# git clone https://kgithub.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# git clone https://kgithub.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
#
#
# python3 
# ln -s python /usr/bin/python3.10
