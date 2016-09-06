#!/usr/bin/env bash

set -e

# cwd dist
echo 'Checking out "master" in "dist/"'
echo 'If this fails do "cd dist && git reset --hard origin/master"'
echo ''
pushd dist
git checkout master
git clean -dfx
popd

# cwd /
grunt build
pushd dist

echo ""
git status

echo ""
echo "All good?"
echo "- You checked that 'grunt serve' was not running before building?"
echo "- Ready for git add?"
echo -n "(Y/n) "
read okay
if [ "$okay" == "n" ] || [ "$okay" == "N" ]; then
  exit 0
fi

git add -A .
echo "What's the commit message? (eg. theme for the deploy)"
read message
git commit -m "$message"

echo "Pushing changes"
git push

echo ""
echo "Next: Update the git submodule in API/public folder."
