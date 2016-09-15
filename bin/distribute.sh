#!/usr/bin/env bash

set -e

DIST_FOLDER="dist"

# cwd ${DIST_FOLDER}
echo "Checking out master in '${DIST_FOLDER}'"
echo "If this fails do 'cd ${DIST_FOLDER} && git reset --hard origin/master'"
echo ''
pushd ${DIST_FOLDER}
git checkout master
git clean -dfx
popd


# cwd /
grunt build


# cwd ${DIST_FOLDER}
pushd ${DIST_FOLDER}

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

echo "Pushing submodule's changes"
git push


# cwd /
popd

git add ${DIST_FOLDER}
git status

echo "Ready to commit submodule changes in parent repository?"
echo -n "(Y/n) "
read okay
if [ "$okay" == "n" ] || [ "$okay" == "N" ]; then
  exit 0
fi

git commit -m "deploy (${DIST_FOLDER}) Update submodule"

echo ""
echo "Next: Update the git submodule in API/public folder."
