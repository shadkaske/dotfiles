set -g fish_greeting

fish_add_path $HOME/.cargo/bin/
fish_add_path $HOME/.tmux/plugins/t-smart-tmux-session-manager/bin
fish_add_path $HOME/.local/bin/
fish_add_path $HOME/.fzf/bin/

abbr --add cat bat
abbr --add lg lazygit

set -Ux MANPAGER "sh -c 'col -bx | bat -l man -p'"

set -Ux EDITOR nvim

if status is-interactive
    # Commands to run in interactive sessions can go here
end
