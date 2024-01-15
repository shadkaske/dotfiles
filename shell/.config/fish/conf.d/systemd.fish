# Some simple abbrevations for systemctl interactions

abbr -a -g sc          sudo systemctl
abbr -a -g scu         systemctl --user
abbr -a -g sj          journalctl --all --follow --unit
abbr -a -g sju         journalctl --all --follow --user-unit

abbr -a -g scr         sudo systemctl restart
abbr -a -g scur        systemctl --user restart
abbr -a -g scs         sudo systemctl stop
abbr -a -g scus        systemctl --user stop
abbr -a -g sce         sudo systemctl enable
abbr -a -g scue        systemctl --user enable
abbr -a -g scdis       sudo systemctl disable
abbr -a -g scudis      systemctl --user disable
abbr -a -g scdisn      sudo systemctl --now disable
abbr -a -g scudisn     systemctl --user --now disable
abbr -a -g scen        sudo systemctl --now enable
abbr -a -g scuen       systemctl --user --now enable
abbr -a -g scrb        systemctl reboot -i

