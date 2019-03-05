#!/bin/sh

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

include () {
  [[ -f "$1" ]] && source "$1"
}

function bot() {
  echo -e "\n${GREEN}\[._.]/${NC} - ${1}\n"
}

function action() {
  echo -en "${YELLOW}⇒ ${NC}${1}: "
}

function task() {
  echo -e "${YELLOW}[task]${NC} ${1}"
}

function ok() {
  echo -e "${GREEN}[ok]${NC} ${1}"
}

function warn() {
  echo -e "${YELLOW}[warning]${NC} ${1}"
}

function error() {
  echo -e "${RED}[error]${NC} ${1}"
}

function proxy_off() {
  action "Removing proxy configuration"
    unset http_proxy https_proxy no_proxy
  ok
}
