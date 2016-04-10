#!/bin/sh
# ------------------------------------------------------------------
# DCOS CLI shell scripts
# 
# Author: Michael Hausenblas, http://mhausenblas.info
# Since: 2016-04-09
# ------------------------------------------------------------------

VERSION=0.1
USAGE="Usage: dcos-shell.sh"


COMMAND_DIR=cmds
DCOS_CLUSTER_URL=`cat ~/.dcos/dcos.toml | grep dcos_url`
# echo $DCOS_CLUSTER_URL
DCOS_CLUSTER_ID=${DCOS_CLUSTER_URL:20:8}
# echo $DCOS_CLUSTER_ID
DCOS_CLI_PROMPT="[$DCOS_CLUSTER_ID]$"


run_distributed_command () {
    user_command=$1
    if [ ! -d "$COMMAND_DIR" ]; then
        mkdir $COMMAND_DIR
    fi
    # CMD_ID=$(cat /dev/urandom | tr -cd 'a-f0-9' | head -c 32)
    CMD_ID=43887542420cebdde8efa545ce9a1fb7
    cp run_template.json $COMMAND_DIR/$CMD_ID.json
    sed -i 's/ID/$CMD_ID/g' $COMMAND_DIR/$CMD_ID.json
    sed -i 's/COMMAND/$user_command/g' $COMMAND_DIR/$CMD_ID.json
    # dcos marathon app add $CMD_ID.json
}

# source ./bin/env-setup

while :
do
  printf "$DCOS_CLI_PROMPT "
  read user_command
  # echo $user_command
  # eval $user_command
  case $user_command in
      exit )
          exit 0
      ;;
      run* )
          run_command=${user_command:4}
          echo 'Executing' $run_command 'in the DCOS cluster ...'
          run_distributed_command $run_command
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