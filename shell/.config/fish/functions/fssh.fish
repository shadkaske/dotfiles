function fssh -d "Fuzzy-find ssh host via ag and ssh into it"
    rg --ignore-case '^host [^*]' ~/.ssh/config | cut -d ' ' -f 2 | fzf --border-label ssh | read -l result; and ssh "$result"
end
