---
slug: github-pull-all-repos
id: github-pull-all-repos
title: Bash Script to Pull All Git Repositories Automatically
repo: justin-napolitano/pull-all-repos
githubUrl: https://github.com/justin-napolitano/pull-all-repos
generatedAt: '2025-11-24T21:36:01.920Z'
source: github-auto
summary: >-
  A Bash script that recursively pulls updates from all git repositories in a
  directory, with support for blacklisting specific repos.
tags:
  - bash
  - git
  - scripting
  - repository management
seoPrimaryKeyword: bash script pull all git repositories
seoSecondaryKeywords:
  - git repository automation
  - bash automation script
  - update git branches
  - blacklist git repos
  - shell scripting for git
seoOptimized: true
topicFamily: null
topicFamilyConfidence: null
kind: project
entryLayout: project
showInProjects: true
showInNotes: false
showInWriting: false
showInLogs: false
---

A Bash script to recursively locate all git repositories within a specified directory, check out all branches, and pull the latest changes. It supports a blacklist mechanism to restrict updates to only the main branch for selected repositories.

---

## Features

- Recursively scans a root directory for git repositories
- Automatically checks out and updates all branches in each repository
- Supports a blacklist to limit updates to the main branch for certain repos
- Configurable root directory and blacklist file path

## Tech Stack

- Shell scripting (Bash)
- Git command-line interface

## Getting Started

### Prerequisites

- Bash shell
- Git installed and accessible in PATH
- Permissions to read/write the target repositories

### Installation

1. Save the script content to a file named `update_repos.sh`:

```bash
#!/bin/bash

# Define the default root directory where your repos are located
DEFAULT_ROOT_DIR="/home/cobra/Repos"

# Define the default blacklist file location
BLACKLIST_FILE="/etc/update_repos_blacklist.conf"

# Use the provided argument as the root directory, or the default if none is provided
ROOT_DIR=${1:-$DEFAULT_ROOT_DIR}

# Export the BLACKLIST_FILE variable so it's available in subshells
export BLACKLIST_FILE

# Function to check if a repository is blacklisted
is_blacklisted() {
    local repo_dir=$1
    echo "Checking for Blacklisted $repo_dir in $BLACKLIST_FILE"
    if [ -z "$BLACKLIST_FILE" ]; then
        echo "BLACKLIST_FILE is not set"
        return 1
    fi
    if [ ! -f "$BLACKLIST_FILE" ]; then
        echo "Blacklist file does not exist: $BLACKLIST_FILE"
        return 1
    fi
    grep -qxF "$repo_dir" "$BLACKLIST_FILE"
    local result=$?
    if [ $result -eq 0 ]; then
        echo "$repo_dir is blacklisted"
    else
        echo "$repo_dir is not blacklisted"
    fi
    return $result
}

# Additional script logic...
```

2. Make the script executable:

```bash
chmod +x update_repos.sh
```

### Usage

Run the script with an optional root directory argument. If no argument is provided, it defaults to `/home/cobra/Repos`:

```bash
./update_repos.sh /path/to/your/repos
```

## Project Structure

- `update-repos.sh` - The main Bash script to update repositories.
- `README.md` - This documentation file.
- `index.md` - Blog post or project overview content.

## Future Work / Roadmap

- Add support for parallel updates to speed up processing of many repositories.
- Improve blacklist handling with pattern matching or regex support.
- Add logging capabilities to track update results over time.
- Support other version control systems beyond Git.
- Provide more granular control over which branches to update.

---

_Last updated: 2024-07-13_

