function l -d "List directory contents - short"
    if command -q eza
        eza --icons --group --header --group-directories-first $argv
    else
        ls $argv
    end
end
