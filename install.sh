#! /bin/bash

scriptDir=$(cd `dirname $0`; pwd)
. "$scriptDir/public/index.sh"

#cp /etc/apt/sources.list /etc/apt/sources.list.bak
#sed -i "s@http://.*archive.ubuntu.com@http://mirrors.tuna.tsinghua.edu.cn@g" /etc/apt/sources.list
#sed -i "s@http://.*security.ubuntu.com@http://mirrors.tuna.tsinghua.edu.cn@g" /etc/apt/sources.list
#apt update

install_list=(vim curl zsh git ripgrep net-tools unzip nodejs npm wget gdb cmake cland-12)

echo ${install_list[@]} 

for elem in ${install_list[@]}
do
  if ! isCmdExist $elem;then
      echo 'installing '$elem
      apt install -y $elem > /dev/null 2>&1 
      if isCmdExist $elem;then
          echo 'intalled '$elem' done'
      else
          echoError 'install '$elem' failed'
      fi
  else
      echoWarn 'already intalled '$elem''
  fi
done

if ! isCmdExist nvim;then
  echo 'installing nvim'
  snap install nvim --classic
  if isCmdExist nvim;then
    echo 'installed nvim done'
  else
    echo 'installed nvim failed'
  fi
else
  echoWarn 'already intalled nvim'
fi


#sh "$scriptDir/ohmyzsh.sh"
#echo 'install plugin'
#git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
#git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
#git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k




if [ ! -d ~/.config/nvim/ ]; then
   echo 'mkdir and copy nvim config'
   mkdir -p  ~/.config/nvim/
   rm -rf ~/.config/nvim
   ln -s ~/dotfile-lazy ~/.config/nvim
else
   echo 'already has nvim config '
fi


#sudo apt install python3-pip
#sudo pip install python-lsp-server
#sudo pip install ipython

