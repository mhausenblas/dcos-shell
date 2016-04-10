#!/bin/sh
# ------------------------------------------------------------------
# DCOS CLI shell scripts
# 
# Author: Michael Hausenblas, http://mhausenblas.info
# Since: 2016-04-09
# ------------------------------------------------------------------

VERSION=0.1
USAGE="Usage: dcos-shell.sh"

# source ./bin/env-setup

DCOS_CLUSTER_URL=`cat ~/.dcos/dcos.toml | grep dcos_url`
# echo $DCOS_CLUSTER_URL
DCOS_CLUSTER_ID=${DCOS_CLUSTER_URL:20:8}
# echo $DCOS_CLUSTER_ID
DCOS_CLI_PROMPT="[$DCOS_CLUSTER_ID]$"

while :
do
  printf "$DCOS_CLI_PROMPT "
  read user_command
  # echo $user_command
  # eval $user_command
  case $user_command in
      run* )
          run_command=${user_command:4}
          # dcos maraton ...
          echo "Executing `$run_command` in the DCOS cluster"
      ;;
      h*)
          dcos
      ;;
      
      * )
          eval "dcos $user_command"
      ;;
  esac
done

exit 0