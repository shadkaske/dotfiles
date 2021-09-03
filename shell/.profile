# Make sure oh-my-zsh is installed
[ ! -d $HOME/.oh-my-zsh ] && git clone https://github.com/robbyrussell/oh-my-zsh.git \
    $HOME/.oh-my-zsh

# Make sure fzf is installed
[ ! -d $HOME/.fzf ] && git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && \
    $HOME/.fzf/install --no-fish --all

# Check if the PowerLevel10k Plugin is install
[ ! -d $HOME/.oh-my-zsh/custom/themes/powerlevel10k ] && git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
    $HOME/.oh-my-zsh/custom/themes/powerlevel10k

# Check if the Autosuggestions Plugin is installed
[ ! -d $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions ] && git clone https://github.com/zsh-users/zsh-autosuggestions \
    $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions

# Check if the Syntax Highlight Plugin is installed
[ ! -d $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ] && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
    $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Check if Base16-Shell is Installed
# [ ! -d $HOME/.config/base16-shell ] && git clone https://github.com/chriskempson/base16-shell.git \
#     $HOME/.config/base16-shell

export PATH="$HOME/.emacs.d/bin:$PATH"
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.local/bin/pip:$PATH
export PATH=$HOME/.config/composer/vendor/bin:$PATH
export PATH=$HOME/.composer/vendor/bin:$PATH
export PATH="$(npm config get prefix):$PATH"

export TERMINAL=kitty

export QT_STYLE_OVERRIDE=kvantum
