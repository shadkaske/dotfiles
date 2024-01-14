set -g fish_greeting

fish_add_path $HOME/.local/bin/
fish_add_path $HOME/.cargo/bin/
fish_add_path $HOME/.fzf/bin/
fish_add_path /usr/local/lib/npm/bin/
fish_add_path $HOME/.local/share/npm/bin/
fish_add_path $HOME/.tmux/plugins/t-smart-tmux-session-manager/bin
fish_add_path /snap/node/current/bin

set -Ux EDITOR nvim

abbr --add czcd cd (chezmoi source-path)
abbr --add czed chezmoi edit
abbr --add czap chezmoi apply
abbr --add czdf chezmoi diff
abbr --add czad chezmoi add
abbr --add xoff sudo phpdismod xdebug
abbr --add xon sudo phpenmod xdebug

abbr --add ls eza --icons

abbr --add lg lazygit

abbr --add tinker php artisan tinker
abbr --add artisan php artisan

abbr --add - cd -
abbr --add ... cd ../..
abbr --add .... cd ../../..
abbr --add ..... cd ../../../..

fish_config theme choose "Catppuccin Mocha"

starship init fish | source

if status is-interactive
    # Commands to run in interactive sessions can go here
end
