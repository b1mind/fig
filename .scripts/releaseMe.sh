#!/usr/bin/env bash

echo "Checking out pub branch"
git checkout pub
git pull origin pub

git log pub..dev
read -p "Review your changes..."

echo "Merging dev branch"
git merge dev

echo "Pushing commits"
git push

echo "Checking out dev branch"
git checkout dev
git push
