function la -d "List all directory contents - long"
    if command -q eza
        eza --icons --group --header --group-directories-first --long --all $argv
    else
        ls -alh $argv
    end
end

