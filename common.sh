#!/bin/sh

eval "$(rbenv init -)"

export PATH=$HOME/bin:$PATH
export GROOVY_HOME=/usr/local/opt/groovy/libexec
export GRADLE_HOME=/usr/local/opt/gradle/libexec

action "Setting aliases"
  alias cwc="grep -Ev '^\s*(;|#|//|$)'"
  alias pdkt="pdk test unit --parallel --puppet-version=${PUPPET_GEM_VERSION}"
  alias pdkv="pdk validate --parallel --puppet-version=${PUPPET_GEM_VERSION}"
ok

action "Configuring ZSH"
  autoload -U zmv
ok

action "Common Git config"
    git config --global fetch.prune true
ok
