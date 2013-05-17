---
layout: post
title: Cleaner git history - Stash, Rebase, Pop
tags:
- git
category: Programming
published: true
---
A common workflow of mine is:

```bash
git stash && git pull --rebase && git stash pop
```

I actually have this aliased to gpull. It stashes any uncommitted changes, pull in the latest with rebase, and then pops my changes off the stash.

<kbd>git pull</kbd> is a shorthand for git fetch and git merge. You can tell git that you'd prefer to rebase instead of merge by adding the <kbd>--rebase</kbd> option. Using rebase instead of merge will lead to a cleaner history.

{% img /images/Screen-shot-2010-05-28-at-11.26.28-AM.png 703 108 "Git graph with merge" %}

Notice in this image how the you can see the branch that occurred from the merge? Merge takes the two versions of code and lays them on top of each other, merging them together. In the image, "moved impersonation controller to admin namespace" is merged into "features initial pass at phase 1".

{% img /images/Screen-shot-2010-12-01-at-12.25.15-AM.png 791 70 "Rebase" %}

In this image, if you were just looking at the tree, you can't even tell that more than one person is committing. This is an example of the cleaner rebase. Instead of taking two different versions of the code and merging them together, git is placing all of the incoming head's (FETCH_HEAD) commit's first and then merging your commits one by one onto it.

To illustrate from the image, I pushed my commit "moved hydra.yml...", then David pulled and pushed "updated required fields..." at 4:35. In the meantime, I had already made the "whitespace" commit at 12:12, but had yet to push it. When I rebased git took the FETCH_HEAD, which was at David's commit, and then reapplied my commit to it.
