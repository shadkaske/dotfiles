#!/bin/bash
# Make sure fzf is installed
[ ! -d $HOME/.fzf ] && git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && \
    $HOME/.fzf/install --no-fish --all

# Check if the Autosuggestions Plugin is installed
[ ! -d $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions ] && git clone https://github.com/zsh-users/zsh-autosuggestions \
    $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions

# Check if the Syntax Highlight Plugin is installed
[ ! -d $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ] && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
    $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Install artisan Zsh plugin
ARTISAN=/home/vagrant/.oh-my-zsh/custom/plugins/artisan
if [ ! -d "$ARTISAN" ]; then
  git clone https://github.com/jessarcher/zsh-artisan.git $ARTISAN
fi

# add personal zsh config
sed -i '/^# alias ohmyzsh.*/a source $HOME/.bash_aliases' $HOME/.zshrc
sed -i 's/plugins=(git)/plugins=(git git-flow zsh-syntax-highlighting zsh-autosuggestions artisan fzf zsh-interactive-cd alias-finder aliases ubuntu)/g' /home/vagrant/.zshrc

{
  echo 'bindkey '^ ' autosuggest-accept'
  echo 'bindkey '^[[B' down-line-or-search'
  echo 'bindkey '^[[A' up-line-or-search'
  echo 'vscodeIntegrate=$(find ~/.vscode-server/bin -name shellIntegration-rc.zsh -exec stat -c '%X %n' {} \; | sort -nr | awk 'NR==1 {print $2}' | sed 's#bin/remote-cli/code#out/vs/workbench/contrib/terminal/browser/media/shellIntegration-rc.zsh#g')'
  echo ''
  echo 'if [[ -f "$vscodeIntegrate" ]]; then'
  echo '    source $vscodeIntegrate'
  echo 'fi'
} >> /home/vagrant/.zsh

# git config
{
  echo '[user]'
  echo '    name = Shad Kaske'
  echo '    email = shadkaske@gmail.com'
  echo '[core]'
  echo '    editor = code --wait'
  echo '[merge]'
  echo '  tool = vscode'
  echo '[diff]'
  echo '    tool = vscode'
  echo '[mergetool]'
  echo '    keepBackup = false'
  echo '    prompt = false'
  echo '[mergetool "vscode"]'
  echo '    cmd = code --wait $MERGED'
  echo '[difftool "vscode"]'
  echo '    cmd = code --wait --diff $LOCAL $REMOTE'
  echo '[pull]'
  echo '  rebase = false'
  echo '[init]'
  echo '  defaultBranch = main'
} >> /home/vagrant/.gitconfig

cd $HOME/printapp

sudo update-alternatives --set php /usr/bin/php7.4
sudo update-alternatives --set php-config /usr/bin/php-config7.4
sudo update-alternatives --set phpize /usr/bin/phpize7.4

composer install

yarn install

yarn run dev

php artisan migrate:fresh --seed
