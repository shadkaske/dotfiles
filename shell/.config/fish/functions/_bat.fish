function _bat -d "Set Bat Aliases As Needed"
    if command -q batcat
          abbr --add rcat cat
          abbr --add cat batcat
          set -Ux MANPAGER "sh -c 'col -bx | batcat -l man -p'"
    else if command -q bat
          abbr --add rcat cat
          abbr --add cat bat
          set -Ux MANPAGER "sh -c 'col -bx | bat -l man -p'"
    end
end
