---
slug: github-pull-all-repos
title: Bash Script to Automate Pulling Updates for Multiple Git Repositories
repo: justin-napolitano/pull-all-repos
githubUrl: https://github.com/justin-napolitano/pull-all-repos
generatedAt: '2025-11-23T09:27:51.681918Z'
source: github-auto
summary: >-
  A Bash script that recursively scans directories for git repositories and pulls updates on all
  branches, with blacklist support for selective updating.
tags:
  - bash
  - git
  - automation
  - repository-management
  - shell-script
seoPrimaryKeyword: git pull automation
seoSecondaryKeywords:
  - bash script
  - git repositories
  - repository updates
seoOptimized: true
topicFamily: automation
topicFamilyConfidence: 1
topicFamilyNotes: >-
  The post is focused on a Bash script automating the process of pulling updates across multiple Git
  repositories, which fits squarely within the Automation family that covers scripts and projects
  automating git workflows.
---

# Update All Repos Script: Technical Overview

This project addresses the practical need to maintain multiple git repositories efficiently. When managing numerous repositories locally, manually updating each branch across all repos is tedious and error-prone. This Bash script automates that process by recursively scanning a directory tree for git repositories, then pulling updates on all branches within each repo.

## Motivation

Developers often clone many repositories for different projects or components. Keeping these repositories current requires running git pull commands on each branch individually, which is time-consuming and prone to oversight. The script solves this by automating the discovery and update process.

Additionally, some repositories may require special handling, such as only updating the main branch to avoid disrupting work-in-progress branches. To accommodate this, the script includes a blacklist feature. Repositories listed in a configurable blacklist file are only updated on their main branch.

## How It Works

1. **Root Directory Scanning**: The script accepts a root directory argument or defaults to `/home/cobra/Repos`. It recursively searches this directory for git repositories by detecting `.git` folders.

2. **Blacklist Handling**: It reads a blacklist file (default `/etc/update_repos_blacklist.conf`) containing repository paths. If a repository is blacklisted, the script limits updates to the main branch only.

3. **Branch Updates**: For each repository, the script checks out each branch sequentially and performs a `git pull` to fetch the latest changes.

4. **Logging and Output**: The script outputs status messages indicating which repositories and branches are being updated, and whether they are blacklisted.

## Implementation Details

- **Blacklist Checking**: The `is_blacklisted` function verifies if a repo path exists in the blacklist file using `grep -qxF`. It returns a status code to control update behavior.

- **Branch Enumeration**: The script likely uses `git branch` or `git branch -r` commands to list branches. For blacklisted repos, it restricts to the main branch.

- **Error Handling**: Basic checks ensure the blacklist file exists and is set. The script also verifies directory changes succeed before running git commands.

- **Configurability**: Default paths for root directory and blacklist file are set as variables, allowing easy modification.

## Practical Considerations

- The script requires Bash and Git installed on the system.
- Proper permissions are necessary to access and modify the repositories.
- The blacklist file should contain absolute or relative paths matching the repo directories.
- The script assumes the main branch is named `main`; adjustments may be needed for repos using `master` or other names.

## Conclusion

This script is a straightforward yet effective tool for automating the update of multiple git repositories. It balances automation with control via the blacklist feature, reducing manual overhead for developers managing many repos. Future enhancements could include concurrency, improved blacklist patterns, and extended VCS support, but the current implementation provides a solid foundation for routine maintenance tasks.


