#! /bin/bash

source src_common.sh

trap '__abort' 0

mkdir  -p "${HOME}/.local/share/fonts"
cp shell/fonts/* "${HOME}/.local/share/fonts"

rm -rf "${HOME}/.zshrc" "${HOME}/.oh-my-zsh" "${HOME}/.p10k.zsh"

# OH MY ZSH
URL='https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh'
FILE=$(basename "$URL")
__wget "$URL" "$FILE"

sh "$FILE" --unattended
rm "$FILE"

# p10k powerline
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
sed -i 's/ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' "${HOME}/.zshrc"
cp shell/.p10k.zsh "${HOME}/" 
cp shell/.zshrc "${HOME}/" 

# zsh autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# zsh syntax highlight
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# include plugins
sed -i 's/plugins=(.*/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' "${HOME}/.zshrc"

trap : 0
