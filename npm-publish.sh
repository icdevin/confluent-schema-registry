#!/bin/bash

PACKAGE_NAME=$(awk -F'"' '/"name": ".+"/{ print $4; exit; }' ./package.json)
PACKAGE_VERSION=$(awk -F'"' '/"version": ".+"/{ print $4; exit; }' ./package.json)
PACKAGE=${PACKAGE_NAME}@${PACKAGE_VERSION}

if [[ -z $(git status ./ -s) ]]
then
  printf "\nAttempting to publish package..."
  PUBLISH_COMMAND_RESULT="$(npx publish-if-not-exists)";
  if [ "$PUBLISH_COMMAND_RESULT" = "Already up-to-date." ]; then
    printf "\n⚠️\033[0;31mERROR\033[0m: %s %s Change package version to proceed.\n" "$PACKAGE" "$PUBLISH_COMMAND_RESULT"
    exit 1
  fi
  echo "${PACKAGE} successfully published."
  exit 0
else
  printf "\n⚠️\033[0;31mERROR Publishing %s\033[0m: Git tree is dirty, please commit and push all changes before publishing.\n" "$PACKAGE"
  git status .
  exit 1
fi
