#!/bin/sh
# ------------------------------------------------------------------
# DCOS CLI install scripts
# 
# Author: Michael Hausenblas, http://mhausenblas.info
# Since: 2016-04-09
# ------------------------------------------------------------------

VERSION=0.1
USAGE="Usage: dcos-cli-setup.sh [ download | install CLUSTER_URL]"

if [ $# == 0 ] ; then
    echo $USAGE
    exit 1;
fi

step=$1

case $step in

    "download" )
        mkdir -p dcos && cd dcos && curl -O https://downloads.mesosphere.io/dcos-cli/install.sh
        echo "\nDCOS CLI resources available, next use 'install CLUSTER_URL'"
    ;;
    "install" )
        if [ $# == 1 ] ; then
            echo "You need to provide the cluster URL, use 'install CLUSTER_URL' "
            echo $USAGE
            exit 1;
        fi
        cluster_url=$2
        bash ./install.sh . $cluster_url
        echo "\nDCOS CLI installed, next use 'activate'"
    ;;
    * ) 
        echo "Sorry, unknown command"
        echo $USAGE
        exit 1;
    ;;
esac

exit 0