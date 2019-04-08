curl -LJO https://github.com/lenguyenthanh/dotfiles/archive/master.zip
unzip -a dotfiles-master.zip
mv -f dotfiles-master .dotfiles
rm dotfile-master.zip
cd .dotfiles
./bootstrap.sh
