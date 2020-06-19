#!/bin/bash
BITBUCKET_REPO=""
GITLABREPO=""

if [ "$1" != "" ]; then
    BITBUCKET_REPO=$1
fi

if [ "$2" != "" ]; then
    GITLAB_REPO=$2
fi

if [ "$BITBUCKET_REPO" == "" ] || [ "$GITLAB_REPO" == "" ] || [ "$GITLAB_TOKEN" == "" ]; then
   exit 1
fi

WORK_REPO=https://${GITLAB_REPO/https\:\/\//$GITLAB_TOKEN@}

git_remote_url_reachable() {
  if git ls-remote "$1" CHECK_GIT_REMOTE_URL_REACHABILITY >/dev/null 2>&1; then
    return 1
  else
    return 0
  fi  
}

if git_remote_url_reachable $WORK_REPO == 0 ]; then
    echo "GIT LAB REPO NOT FOUND"
    exit 1
fi   

echo "**** MIGRATION STARTING FOR $BITBUCKET_REPO ****"
WORKSPACE="${BITBUCKET_REPO##*/}"
git clone --mirror $BITBUCKET_REPO
cd $WORKSPACE
git branch -a
git remote rm origin

git remote add origin $WORK_REPO
git remote -v

echo "**** PUSH TO GITLAB ****"
git push origin --all
git push origin --tags
echo "*** DONE ***"