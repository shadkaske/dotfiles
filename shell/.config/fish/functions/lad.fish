function lad -d "List All and Page with Bat"
    if command -q bat
        la $argv | bat --language fs --color always
    else
        la $argv | less
    end
end
