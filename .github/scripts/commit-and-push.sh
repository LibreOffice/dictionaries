#!/bin/bash
set -euo pipefail

DICTIONARY="$1"
GITHUB_OUTPUT="${GITHUB_OUTPUT:-/dev/stdout}"

DICT_FLAT=$(echo "$DICTIONARY" | tr '/' '-')
RAND=$(openssl rand -hex 4)
BRANCH_NAME="reedsy-bot/add-words/${DICT_FLAT}/${RAND}"

git config user.name "GitHub Action"
git config user.email "github@reedsy.com"

git checkout -B "$BRANCH_NAME"
rm -rf ./queue
git add .

if git diff --cached --quiet; then
  echo "No changes to commit for $DICTIONARY - skipping PR creation"
  echo "has_changes=false" >> "$GITHUB_OUTPUT"
  exit 0
fi

git commit -m "📝 Update $DICTIONARY dictionary"
git push origin "$BRANCH_NAME"

echo "has_changes=true" >> "$GITHUB_OUTPUT"
echo "branch_name=$BRANCH_NAME" >> "$GITHUB_OUTPUT"
