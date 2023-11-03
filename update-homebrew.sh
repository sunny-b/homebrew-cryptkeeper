#!/bin/bash

function auto_sed() {
  cmd=$1
  shift

  if [[ "$(uname -s)" == "Darwin" ]]; then
    sed -i '' -e "$cmd" $@
  else
    sed -i -e "$cmd" $@
  fi
}

REPO="sunny-b/cryptkeeper"
FORMULA_PATH="cryptkeeper.rb" 

LATEST_RELEASE=$(curl -s https://api.github.com/repos/$REPO/releases/latest)

TAG=$(echo $LATEST_RELEASE | jq -r .tag_name)
TARBALL_URL=$(echo $LATEST_RELEASE | jq -r .tarball_url)

SHA256=$(curl -L $TARBALL_URL | shasum -a 256 | sed 's/ .*//')

auto_sed "s/v = \\\".*\\\" # CI Managed/v = \\\"${TAG}\\\" # CI Managed/" $FORMULA_PATH
auto_sed "s|url .*|url \"$TARBALL_URL\"|" $FORMULA_PATH
auto_sed "s|sha256 .*|sha256 \"$SHA256\"|" $FORMULA_PATH