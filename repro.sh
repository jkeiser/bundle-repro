#!/bin/sh

set -evx

# Uninstall all bundle-test-foos and bundle-test-bars
gem uninstall bundle-test-bar bundle-test-foo --force

# Install bundle-test-bar 2.0.0
pushd bar
BAR_VERSION=2.0.0 gem build bundle-test-bar
gem install bundle-test-bar-2.0.0.gem
popd

# Bundle install will show bundle-test-bar 1.0.0 and bundle-test-foo 2.0.0
pushd foo
FOO_VERSION=1.0.0 bundle install
FOO_VERSION=1.0.0 bundle list
popd

# Install bundle-test-bar 2.0.1
pushd bar
BAR_VERSION=2.0.1 gem build bundle-test-bar
gem install bundle-test-bar-2.0.1.gem
popd

# Bundle install will still show bundle-test-bar 1.0.0 and bundle-test-foo 2.0.0
pushd foo
FOO_VERSION=1.0.0 bundle install
FOO_VERSION=1.0.0 bundle list
popd

# This should not change the version of bundle-test-bar! 2.0.0 still satisfies deps
# But it does: bundle install will show bundle-test-bar 1.0.1 and bundle-test-foo 2.0.1
pushd foo
FOO_VERSION=1.0.1 bundle install
FOO_VERSION=1.0.1 bundle list
popd

