#!/usr/bin/env bash

function main {
  case $1 in
  'cmd1')
    echo cmd1
    ;;
  esac
  'cmd2')
    echo cmd2
    ;;
  esac

}

#-----

DEBUG=1
if [ -z "$DEBUG" ]; then
  main $@
else

  CONFIGS_DIR="$HOME/git/configs"

  function test_a {
    function_a
  }

  function test {
    test_a
  }

  echo 'debugging...'
  test

fi
