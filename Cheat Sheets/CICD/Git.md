## Cloning

    git clone <repo url> <target directory>
    git clone --depth 1 <repo url>      # Shallow clone

## Branches

### Create New Branch

Create a new git branch and switch to it

    git checkout -b <branch name>

and create it on origin too

    git push --set-upstream origin/<branch name> <branch name>

### Tracking Remote Branches

To follow additional branches in your local repo follow these steps:

    # Find out all existing remote branches
    git branch -r

    # And track one of them locally
    git branch --track <local name> origin/<name>

### Remove Branch

Remove git branch locally with

    git branch -d <branch>
    
### Remove branch on origin

    git push origin --delete <branch>
    
or

    git branch -d -r origin/<branch>
    git push origin :

### Rename Local Branch

    git branch -m <new name>

### Remove stale

When remote branches disappear clean them from your local repo with

    git remote prune origin

## Rebasing

To rebase on master

    git rebase master 

### Solve Merge Conflicts

When a rebase fails manually fix files and

    git add <files>
    git rebase --continue

### Move commits onto new branch

    git branch 
    git reset --hard HEAD~1      # 1 to move 1 commit
    git checkout 

### Squash Commits

    git rebase -i <commit after which to rebase>

## Commits

    git show <commit hash>                   # Show commit contents
    git log                                  # Commit history with details

    git rev-list --all --pretty=oneline      # Commit history as one liners
    
    git log -p -S "class Layout"             # Find commit adding/changing line with "class Layout" 
    git log -p -G <regex>                    # Find commit adding/changing a line matching a regex 
    
### Amending changes

    git add <file>
    git commit --amend

### Apply patches

A detailed description can be found
[here](http://ariejan.net/2009/10/26/how-to-create-and-apply-a-patch-with-git).
You should always run the following commands:

    git apply --stat cool_feature.patch    # Check what the patch will do
    git apply --check cool_feature.patch   # Check if the patch fails
    git am --signoff < cool_feature.patch

### Create patches

    git format-patch -1                # Creates one patch file for the commit
    git format-patch -2 HEAD           # Creates two patch files for last two commits on HEAD
    git format-patch -3 HEAD --stdout  # Print last 3 commit changes on stdout

### Solving Mistakes

Accidental "git add"

    git reset HEAD []

Accidental commit of too many files

    git reset --soft HEAD^

    git status         # to list all added files
    git reset <files>  # to remove incorrectly added files

    # Commit afterwards

### Stashing Changes

For a detailed explanation check
[here](http://ariejan.net/2008/04/23/git-using-the-stash/). This feature
is useful to put debugging or experimental changes to the "background".
Here are the commands:

    git stash "Some test I made"    # Stash some changes away

    git stash list                  # List stashes
    git stash show stash@{0}        # Show changes file in last stash
    git stash show -p stash@{0}     # Show patch for last stash

    git stash apply stash@{0}       # Get last stash active again
    git stash drop stash@{0}        # Delete last stash

    git stash pop                   # Apply and remove last stash

    git stash clear                 # Delete all stashes

    # Stash just some files by adding all others first and using --keep-index
    git add <files>
    git stash --keep-index

### Disecting

    git disect start <recent commit> <older commit>
    
    git disect good
    git disect bad
    
    git disect reset

## Tags

    git fetch --all --tags --prune

    git checkout tag/<tag> -b <branch>
    git clone <repo> --branch=<tag>
    
    git tag                    # List all tags
    git tag <tag>              # Create tag
    git tag -a <tag> -m <msg>  # Create annotated tag
    git push --tags            # Push tags to remote
    
    git tag -d <tag>         # Deletes tag in your local repo
    git push origin :<tag>   # Deletes tag remote

## Origins

    git remote -v                  # List
    git remote add <origin> <url>  # Add new origin
    git remote rm <origin>         # Remove
    
    # Get a branch track a specific origin
    git branch --set-upstream-to=<origin>/<branch> <branch>
    
    # Remove remote branch
    git push origin --delete <branch>

## Security

### Enable git password Caching

To keep passwords for 1h run

    git config --global credential.helper 'cache --timeout=3600'

### Allow insecure certificates

One time only

    git clone <url> --config http.sslVerify=false

Permanently for a give URL

    git config https.<remote url>/.sslVerify false

### Configuring specific proxy

Disable proxy for a given URL

    git config https.<remote url>/.proxy ""

## Misc

### Run pre-commit hook (e.g. in CICD pipeline)

    git hook run pre-commit

### Update submodules

    git submodule update --init --recursive

### Remove all repo files from a directory

If you ever need to remove all git related files from a local working
repo and make it just a normal directory:

    git clean -ffrx

### List Branch in Bash Prompt PS1

There are several documentations online e.g. [this
one](http://mediadoneright.com/content/ultimate-git-ps1-bash-prompt). In
the end it boils down to running "git branch" on each prompt and to use
an environment function \_\_git\_ps1() that is set up by "git branch" to
print the branch if there is one. So if your current \$PS1 is

    export PS1='\u@\h:\w\$ "

you could extend it to

    export PS1='\u@\h:\w$(git branch &>/dev/null; echo $(__git_ps1 "(%s)"))\$ '

to show the branch name in braces after the directory name and before
the \$ like this:

    john@server:~/project/src(master)$ 

### Push Dry Run

    git push --dry-run --porcelain

### git-write-tree: error building trees

    git reset --mixed

### Merge two repos

One simple way to [merge two repos](https://bneijt.nl/blog/post/merge-a-subdirectory-of-another-repository-with-git/)
is to add one repo (repo1) into a subdirectory of another repository (repo2)

    cd repo2
    git remote add repo1 <path to repo1>
    git fetch repo1
    git merge -s ours --no-commit repo1/master
    # Ignore the merge error!
    
    git read-tree --prefix=<subdir> -u repo1/master
    git commit

That's it. Check "git log" to see if changes of repo1 appear.

### Comfort merging with opening PRs in a browser

This can be done via git command aliases invoking xdg-open. An example solution

    [alias]
      curbranch = rev-parse --symbolic-full-name --abbrev-ref HEAD
      bpush = !sh -c 'git push origin $(git curbranch) 2>&1 |grep -o "https://.*" |xargs xdg-open'
      bp = !sh -c 'echo "Pull" && git pull origin master && echo "Push" && git bpush'

with now "git bp" pulling, pushing and opening the PR for further review work.

### Checkout at a specific time

    git checkout 'master@{2019-01-01 01:00:00}'

<?slideshare,cWwH3B15RuuGW6,Git Tips and Tricks?>

### Cherry-pick changes in a specific commit from branch 'A' to branch 'B'
    
    git checkout B
    git cherry-pick <commit hash from branch A>

### Resync git repo

    git fetch origin && git reset --hard origin/master && git clean -f -d

### Resync forked repo

    git remote add upstream https://github.com/lwindolf/lzone-cheat-sheets.git
    git fetch upstream
    git checkout master
    git merge upstream/master
   
### Ignore invalid certificates

    git -c http.sslVerify=false <command> 

### Setup LFS

    apt install git-lfs
    git-lfs install
    git lfs track <file>
    git add .gitattributes
    git commit -m "Add file to LFS" <file> .gitattributes
    git push
