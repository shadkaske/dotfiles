# Load my git abbreviations
abbr -a -g g          git
abbr -a -g ga         git add
abbr -a -g gaa        git add --all
abbr -a -g gau        git add --update
abbr -a -g gapa       git add --patch
abbr -a -g gap        git apply
abbr -a -g gb         git branch -vv
abbr -a -g gba        git branch -a -v
abbr -a -g gban       git branch -a -v --no-merged
abbr -a -g gbd        git branch -d
abbr -a -g gbD        git branch -D
abbr -a -g ggsup      git branch --set-upstream-to=origin/\(__git.current_branch\)
abbr -a -g gbl        git blame -b -w
abbr -a -g gbs        git bisect
abbr -a -g gbsb       git bisect bad
abbr -a -g gbsg       git bisect good
abbr -a -g gbsr       git bisect reset
abbr -a -g gbss       git bisect start
abbr -a -g gc         git commit -v
abbr -a -g gc!        git commit -v --amend
abbr -a -g gcn!       git commit -v --no-edit --amend
abbr -a -g gca        git commit -v -a
abbr -a -g gca!       git commit -v -a --amend
abbr -a -g gcan!      git commit -v -a --no-edit --amend
abbr -a -g gcv        git commit -v --no-verify
abbr -a -g gcav       git commit -a -v --no-verify
abbr -a -g gcav!      git commit -a -v --no-verify --amend
abbr -a -g gcm        git commit -m
abbr -a -g gcam       git commit -a -m
abbr -a -g gcs        git commit -S
abbr -a -g gscam      git commit -S -a -m
abbr -a -g gcfx       git commit --fixup
abbr -a -g gcf        git config --list
abbr -a -g gcl        git clone
abbr -a -g gclean     git clean -di
abbr -a -g gclean!    git clean -dfx
abbr -a -g gclean!!   "git reset --hard; and git clean -dfx"
abbr -a -g gcount     git shortlog -sn
abbr -a -g gcp        git cherry-pick
abbr -a -g gcpa       git cherry-pick --abort
abbr -a -g gcpc       git cherry-pick --continue
abbr -a -g gd         git diff
abbr -a -g gdca       git diff --cached
abbr -a -g gds        git diff --stat
abbr -a -g gdsc       git diff --stat --cached
abbr -a -g gdt        git diff-tree --no-commit-id --name-only -r
abbr -a -g gdw        git diff --word-diff
abbr -a -g gdwc       git diff --word-diff --cached
abbr -a -g gdto       git difftool
abbr -a -g gignore    git update-index --assume-unchanged
abbr -a -g gf         git fetch
abbr -a -g gfa        git fetch --all --prune
abbr -a -g gfm        "git fetch origin (__git.default_branch) --prune; and git merge FETCH_HEAD"
abbr -a -g gfo        git fetch origin
abbr -a -g gpl         git pull
abbr -a -g ggl        git pull origin \(__git.current_branch\)
abbr -a -g gll        git pull origin
abbr -a -g glr        git pull --rebase
abbr -a -g glg        git log --stat
abbr -a -g glgg       git log --graph
abbr -a -g glgga      git log --graph --decorate --all
abbr -a -g glo        git log --oneline --decorate --color
abbr -a -g glog       git log --oneline --decorate --color --graph
abbr -a -g gloga      git log --oneline --decorate --color --graph --all
abbr -a -g glom       git log --oneline --decorate --color \(__git.default_branch\)..
abbr -a -g glod       git log --oneline --decorate --color develop..
abbr -a -g gloo       "git log --pretty=format:'%C(yellow)%h %Cred%ad %Cblue%an%Cgreen%d %Creset%s' --date=short"
abbr -a -g gm         git merge
abbr -a -g gmt        git mergetool --no-prompt
abbr -a -g gmom       git merge origin/\(__git.default_branch\)
abbr -a -g gp         git push
abbr -a -g gp!        git push --force-with-lease
abbr -a -g gpo        git push origin
abbr -a -g gpo!       git push --force-with-lease origin
abbr -a -g gpv        git push --no-verify
abbr -a -g gpv!       git push --no-verify --force-with-lease
abbr -a -g ggp        git push origin \(__git.current_branch\)
abbr -a -g ggp!       git push origin \(__git.current_branch\) --force-with-lease
abbr -a -g gpu        git push origin \(__git.current_branch\) --set-upstream
abbr -a -g gpoat      "git push origin --all; and git push origin --tags"
abbr -a -g ggpnp      "git pull origin (__git.current_branch); and git push origin (__git.current_branch)"
abbr -a -g gr         git remote -vv
abbr -a -g gra        git remote add
abbr -a -g grb        git rebase
abbr -a -g grba       git rebase --abort
abbr -a -g grbc       git rebase --continue
abbr -a -g grbi       git rebase --interactive
abbr -a -g grbm       git rebase \(__git.default_branch\)
abbr -a -g grbmi      git rebase \(__git.default_branch\) --interactive
abbr -a -g grbmia     git rebase \(__git.default_branch\) --interactive --autosquash
abbr -a -g grbom      "git fetch origin (__git.default_branch); and git rebase FETCH_HEAD"
abbr -a -g grbomi     "git fetch origin (__git.default_branch); and git rebase FETCH_HEAD --interactive"
abbr -a -g grbomia    "git fetch origin (__git.default_branch); and git rebase FETCH_HEAD --interactive --autosquash"
abbr -a -g grbd       git rebase develop
abbr -a -g grbdi      git rebase develop --interactive
abbr -a -g grbdia     git rebase develop --interactive --autosquash
abbr -a -g grbs       git rebase --skip
abbr -a -g ggu        git pull --rebase origin \(__git.current_branch\)
abbr -a -g grev       git revert
abbr -a -g grh        git reset
abbr -a -g grhh       git reset --hard
abbr -a -g grhpa      git reset --patch
abbr -a -g grm        git rm
abbr -a -g grmc       git rm --cached
abbr -a -g grmv       git remote rename
abbr -a -g grpo       git remote prune origin
abbr -a -g grrm       git remote remove
abbr -a -g grs        git restore
abbr -a -g grset      git remote set-url
abbr -a -g grss       git restore --source
abbr -a -g grst       git restore --staged
abbr -a -g grup       git remote update
abbr -a -g grv        git remote -v
abbr -a -g gsh        git show
abbr -a -g gsd        git svn dcommit
abbr -a -g gsr        git svn rebase
abbr -a -g gss        git status -s
abbr -a -g gst        git status
abbr -a -g gs         git status
abbr -a -g gsta       git stash
abbr -a -g gstd       git stash drop
abbr -a -g gstl       git stash list
abbr -a -g gstp       git stash pop
abbr -a -g gsts       git stash show --text
abbr -a -g gsu        git submodule update
abbr -a -g gsur       git submodule update --recursive
abbr -a -g gsuri      git submodule update --recursive --init
abbr -a -g gts        git tag -s
abbr -a -g gtv        git tag | sort -V
abbr -a -g gsw        git switch
abbr -a -g gswc       git switch --create
abbr -a -g gunignore  git update-index --no-assume-unchanged
abbr -a -g gup        git pull --rebase
abbr -a -g gupv       git pull --rebase -v
abbr -a -g gupa       git pull --rebase --autostash
abbr -a -g gupav      git pull --rebase --autostash -v
abbr -a -g gwch       git whatchanged -p --abbrev-commit --pretty=medium

  # git checkout abbreviations
abbr -a -g gco        git checkout
abbr -a -g gcb        git checkout -b
abbr -a -g gcod       git checkout develop
abbr -a -g gcom       git checkout \(__git.default_branch\)

  # git flow abbreviations
abbr -a -g gfb        git flow bugfix
abbr -a -g gff        git flow feature
abbr -a -g gfr        git flow release
abbr -a -g gfh        git flow hotfix
abbr -a -g gfs        git flow support

abbr -a -g gfbs       git flow bugfix start
abbr -a -g gffs       git flow feature start
abbr -a -g gfrs       git flow release start
abbr -a -g gfhs       git flow hotfix start
abbr -a -g gfss       git flow support start

abbr -a -g gfbt       git flow bugfix track
abbr -a -g gfft       git flow feature track
abbr -a -g gfrt       git flow release track
abbr -a -g gfht       git flow hotfix track
abbr -a -g gfst       git flow support track

abbr -a -g gfp        git flow publish

  # git worktree abbreviations
abbr -a -g gwt        git worktree
abbr -a -g gwta       git worktree add
abbr -a -g gwtls      git worktree list
abbr -a -g gwtlo      git worktree lock
abbr -a -g gwtmv      git worktree move
abbr -a -g gwtpr      git worktree prune
abbr -a -g gwtrm      git worktree remove
abbr -a -g gwtulo     git worktree unlock

  # GitLab push options
abbr -a -g gmr        git push origin \(__git.current_branch\) --set-upstream -o merge_request.create
abbr -a -g gmwps      git push origin \(__git.current_branch\) --set-upstream -o merge_request.create -o merge_request.merge_when_pipeline_succeeds
