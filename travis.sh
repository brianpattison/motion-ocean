#!/usr/bin/env sh

bundle exec rake pod:install &>/dev/null &&
bundle exec rake clean &&
bundle exec rake spec &&
bundle exec rake clean &&
bundle exec rake pod:install osx=true &>/dev/null &&
bundle exec rake clean &&
bundle exec rake spec osx=true