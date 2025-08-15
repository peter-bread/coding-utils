#!/usr/bin/env bash

# Configuration.
USE_COLORS=1   # 1 = colored output, 0 = plain
ENABLE_DEBUG=0 # 1 = show debug messages, 0 = hide
DATE_FORMAT="%Y-%m-%d %H:%M:%S"

RESET="\e[0m"

# ANSI color codes.
RED="\e[31m"
YELLOW="\e[33m"
BLUE="\e[34m"
CYAN="\e[36m"

# Internal logging function.
_log() {
  local level="$1"
  local msg="$2"
  local color="$3"
  local timestamp
  timestamp=$(date +"$DATE_FORMAT")

  if [[ $USE_COLORS -eq 1 && -n "$color" ]]; then
    printf "%s ${color}[%-5s]${RESET} %s\n" "$timestamp" "$level" "$msg"
  else
    printf "%s [%-5s] %s\n" "$timestamp" "$level" "$msg"
  fi
}

# Public functions.
info() { _log "INFO" "$1" "$BLUE"; }
warn() { _log "WARN" "$1" "$YELLOW"; }
error() { _log "ERROR" "$1" "$RED"; }
debug() { [[ $ENABLE_DEBUG -eq 1 ]] && _log "DEBUG" "$1" "$CYAN"; }

info "This is some information"
warn "This is a warning"
error "This is an error"
debug "This is a debug message"
