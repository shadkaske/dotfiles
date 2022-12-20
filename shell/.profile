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

[ -d $HOME/.local/bin ] && export PATH=$HOME/.local/bin:$PATH
[ -d $HOME/.npm-global/bin ] && export PATH=$HOME/.npm-global/bin:$PATH
[ -d $HOME/.local/share/gem/ruby/3.0.0/bin ] && export PATH="$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH"
[ -d $HOME/.config/composer/vendor/bin ] && export PATH=$HOME/.config/composer/vendor/bin:$PATH
[ -d $HOME/.composer/vendor/bin ] && export PATH=$HOME/.composer/vendor/bin:$PATH
[ -d $HOME/.cargo/bin ] && export PATH=$HOME/.cargo/bin:$PATH

[ -d $HOME/go/bin ] && export PATH="$HOME/go/bin:$PATH"

[ -d $HOME/.cargo/bin ] && export PATH="$HOME/.cargo/bin:$PATH"

export TERMINAL=kitty

export QT_STYLE_OVERRIDE=kvantum

