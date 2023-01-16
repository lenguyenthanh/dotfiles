#!/bin/sh

echo "Downloading dotfiles"
curl -LJO https://github.com/lenguyenthanh/dotfiles/archive/master.zip
echo "Unziping dotfiles"
unzip -a dotfiles-master.zip
mv -f dotfiles-master .dotfiles
rm dotfiles-master.zip
cd .dotfiles
chmod +x bootstrap.sh
./bootstrap.sh
