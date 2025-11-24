---
slug: github-pull-all-repos-note-technical-overview
id: github-pull-all-repos-note-technical-overview
title: pull-all-repos Overview
repo: justin-napolitano/pull-all-repos
githubUrl: https://github.com/justin-napolitano/pull-all-repos
generatedAt: '2025-11-24T18:43:49.443Z'
source: github-auto
summary: >-
  This repo contains a Bash script that helps you update all your Git
  repositories within a specified directory. It automatically checks out all
  branches and pulls the latest changes, with a blacklist feature to restrict
  updates to the main branch for selected repositories.
tags: []
seoPrimaryKeyword: ''
seoSecondaryKeywords: []
seoOptimized: false
topicFamily: null
topicFamilyConfidence: null
kind: note
entryLayout: note
showInProjects: false
showInNotes: true
showInWriting: false
showInLogs: false
---

This repo contains a Bash script that helps you update all your Git repositories within a specified directory. It automatically checks out all branches and pulls the latest changes, with a blacklist feature to restrict updates to the main branch for selected repositories.

### Key Features

- Scans a specified root directory for Git repos.
- Checks out and updates all branches.
- Blacklist support to limit updates on certain repos.
  
### Getting Started

1. Save the script as `update_repos.sh` and make it executable:

   ```bash
   chmod +x update_repos.sh
   ```

2. Run the script with an optional path. If you skip it, it defaults to `/home/cobra/Repos`:

   ```bash
   ./update_repos.sh /path/to/your/repos
   ```

### Gotchas

- Ensure you have Git installed and accessible.
- Permissions matter; you need read/write access to the target repos.
- Set your blacklist file correctly to avoid unwanted updates.
