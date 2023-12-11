set -U fish_greeting

## Aliases ( Abbreviations )
# lazygit
abbr -a -- lg lazygit

# Eza
abbr -a -- la eza --icons --group --header --group-directories-first --long
abbr -a -- ls eza --icons --group --header --group-directories-first

## Fzf Settings
# fzf_key_bindings

if status is-interactive
    # Commands to run in interactive sessions can go here
end
