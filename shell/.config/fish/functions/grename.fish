function grename --description Rename\ \'old\'\ branch\ to\ \'new\',\ including\ in\ origin\ remote --argument old new
    if test (count $argv) -ne 2
        echo "Usage: "(status -u)" old_branch new_branch"
        return 1
    end

    git branch -m $old $new

    if ! test -n (git remote -v)
        git push origin :$old
        and git push --set-upstream origin $new
    end
end
