#!/usr/bin/env bash

# Clean all .pyc files in a git repository
# Run from anywhere within the repo.

# Written by David Winterbottom
# http://codeinthehole.com/writing/a-useful-git-post-checkout-hook-for-python-repos/

# Delete .pyc files and empty directories from root of project
cd ./$(git rev-parse --show-cdup)

# Clean-up
find . -name ".DS_Store" -delete

NUM_PYC_FILES=$( find . -name "*.pyc" | wc -l | tr -d ' ' )
if [ $NUM_PYC_FILES -gt 0 ]; then
    find . -name "*.pyc" -delete
    printf "\e[00;31mDeleted $NUM_PYC_FILES .pyc files\e[00m\n"
fi

NUM_EMPTY_DIRS=$( find . -type d -empty | wc -l | tr -d ' ' )
if [ $NUM_EMPTY_DIRS -gt 0 ]; then
    find . -type d -empty -delete
    printf "\e[00;31mDeleted $NUM_EMPTY_DIRS empty directories\e[00m\n"
fi