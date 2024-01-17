# dotfiles

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

git clone git://github.com/wting/autojump.git
cd autojump
./install.py or ./uninstall.py



nvim-surround 


ysw " 
ysa"{
cs " ' 
ds " 

visual 模式下选中： S + {/t/f 可以直接括起来

yswt 
cst 
dst 
yswf  
csf
dsf 


s-> S 换行

