#!/usr/bin/env bash
echo "Pushing dev branch"
git push

echo "Checking out pub branch"
git checkout pub
git pull origin pub

echo "Merging dev branch"
git merge dev

echo "Pushing commits"
git push

echo "Checking out dev branch"
git checkout dev
