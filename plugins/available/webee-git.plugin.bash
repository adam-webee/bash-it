# shellcheck shell=bash
about-plugin 'Git related improvements'

function webee_setup_git_aliases {
    about 'Install most usable git aliases'
    group 'webee-git'

    if ! _command_exists git
    then
        echo "Git is not installed. Skipping."
        return
    fi
    
    echo "What is your name?"
    read GIT_NAME
    git config --global user.name "$GIT_NAME"

    echo "What is your email?"
    read GIT_EMAIL
    git config --global user.email "$GIT_EMAIL"

    echo 'Setting up git aliases...'

    # `git checkout` -> `git co`
    git config --global alias.co checkout
    # `git status` -> `git st`
    git config --global alias.st status
    # `git commit` -> `git ci`
    git config --global alias.ci commit
    # `git diff --staged` -> `git staged`
    git config --global alias.staged 'diff --staged'
    # `git reset HEAD --` -> `git unstage`
    git config --global alias.unstage 'reset HEAD --'
    # `git checkout @{-1}` -> `git last`
    git config --global alias.last 'checkout @{-1}'
    # `git pull --ff` -> `git puff`
    git config --global alias.puff 'pull --ff'
    # `git push origin <current-branch-name>` -> `git poc`
    git config --global alias.poc '!git push origin $(git rev-parse --abbrev-ref HEAD)'
}

alias setup-git=webee_setup_git_aliases
