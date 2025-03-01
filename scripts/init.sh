#!/usr/bin/env bash

set -e
echo "*** Uninstall and reinstall default toolchain nightly ***"
rustup toolchain uninstall nightly
rustup toolchain install nightly
echo "*** Initializing WASM build environment ***"
if [ -z $CI_PROJECT_NAME ] ; then
    echo $CI_PROJECT_NAME
    rustup update nightly
    rustup update stable
fi
rustup target add wasm32-unknown-unknown --toolchain nightly