#!/bin/bash

# Define the default root directory where your repos are located
DEFAULT_ROOT_DIR="/home/cobra/Repos"

# Define the default blacklist file location
BLACKLIST_FILE="/etc/update_repos_blacklist.conf"

# Use the provided argument as the root directory, or the default if none is provided
ROOT_DIR=${1:-$DEFAULT_ROOT_DIR}

# Function to check if a repository is blacklisted
is_blacklisted() {
    local repo_dir=$1
    grep -qxF "$repo_dir" "$BLACKLIST_FILE"
}

echo "Starting update process for repositories in $ROOT_DIR"

# Function to pull changes in all branches of a git repository
pull_all_branches() {
    local repo_dir=$1
    echo "Pulling updates in $repo_dir"
    cd "$repo_dir" || return
    
    if is_blacklisted "$repo_dir"; then
        echo "Repository is blacklisted, only pulling main branch"
        git checkout main || git checkout -b main origin/main
        git pull origin main
    else
        # Fetch all branches
        git fetch --all
        
        # Get a list of all branches
        branches=$(git branch -r | grep -v '\->')
        
        # Checkout and pull each branch
        for branch in $branches; do
            local_branch=${branch#origin/}
            git checkout "$local_branch" || git checkout -b "$local_branch" "origin/$local_branch"
            git pull origin "$local_branch"
        done
    fi
    
    echo "Completed update in $repo_dir"
    cd - || return
}

# Export the function so it can be used by find -exec
export -f pull_all_branches
export -f is_blacklisted

# Find all .git directories and pull changes in all branches in their parent directories
find "$ROOT_DIR" -name ".git" -type d -exec bash -c 'pull_all_branches "$(dirname "{}")"' \;

echo "All repositories updated."
