# DCOS shell

A simple shell for DCOS.

## Init

    dcos-cli-setup.sh download
    dcos-cli-setup.sh install https://sf42-prod-elasticl-9zb28lsaftrp-1802024446.us-west-2.elb.amazonaws.com

## Usage

### Executing a shell command in the cluster

If you are in the DCOS shell and type `run ...` then whatever comes after run will be executed in the DCOS cluster (a bit like distributed shells like `dsh` or `clush`):

    $ ./dcos-shell.sh
    [sf42-pro]$ run env > env.txt && cp env.txt /tmp
    Executing `env > env.txt && cp env.txt /tmp` in the DCOS cluster

### Calling DCOS CLI commands

If you are in the DCOS shell and enter a [valid command](https://docs.mesosphere.com/usage/cli/command-reference/) or sub-command from an installed package, it gets executed. Get help by typing `help`:


    $ ./dcos-shell.sh
    [sf42-pro]$ task
    NAME             HOST       USER  STATE  ID
    chronos-default  10.0.0.21  root    R    chronos-default.db4c0f87-fea2-11e5-8372-563434eea9f8
    jenkins-default  10.0.0.22  root    R    jenkins-default.e8d63f49-fea2-11e5-8372-563434eea9f8
    kafka            10.0.0.21  root    R    kafka.c78b3a5a-fea4-11e5-8372-563434eea9f8
    spark-default    10.0.0.21  root    R    spark-default.e2137158-fea2-11e5-8372-563434eea9f8
    webserver        10.0.0.21  root    R    webserver.935d71ff-fead-11e5-8372-563434eea9f8
    webserver        10.0.0.21  root    R    webserver.935d9810-fead-11e5-8372-563434eea9f8
    webserver        10.0.0.21  root    R    webserver.935de631-fead-11e5-8372-563434eea9f8
    webserver        10.0.0.21  root    R    webserver.935e0d42-fead-11e5-8372-563434eea9f8
    webserver        10.0.0.21  root    R    webserver.935e5b63-fead-11e5-8372-563434eea9f8
    webserver        10.0.0.23  root    R    webserver.965a3645-fead-11e5-8372-563434eea9f8
    webserver        10.0.0.23  root    R    webserver.965a8467-fead-11e5-8372-563434eea9f8
    webserver        10.0.0.23  root    R    webserver.965af999-fead-11e5-8372-563434eea9f8
    webserver        10.0.0.23  root    R    webserver.965b47bb-fead-11e5-8372-563434eea9f8
    webserver        10.0.0.23  root    R    webserver.965b6ecd-fead-11e5-8372-563434eea9f8
    webserver        10.0.0.23  root    R    webserver.965bbcef-fead-11e5-8372-563434eea9f8
    webserver        10.0.0.23  root    R    webserver.965c0b11-fead-11e5-8372-563434eea9f8
    webserver        10.0.0.25  root    R    webserver.9659c114-fead-11e5-8372-563434eea9f8
    webserver        10.0.0.25  root    R    webserver.965a5d56-fead-11e5-8372-563434eea9f8
    webserver        10.0.0.25  root    R    webserver.965ad288-fead-11e5-8372-563434eea9f8
    webserver        10.0.0.25  root    R    webserver.965b20aa-fead-11e5-8372-563434eea9f8
    webserver        10.0.0.25  root    R    webserver.965b6ecc-fead-11e5-8372-563434eea9f8
    webserver        10.0.0.25  root    R    webserver.965b95de-fead-11e5-8372-563434eea9f8
    webserver        10.0.0.25  root    R    webserver.965be400-fead-11e5-8372-563434eea9f8
    webserver        10.0.0.25  root    R    webserver.965c0b12-fead-11e5-8372-563434eea9f8

## To do

- implement `run` command
- put it into a Docker image
- catch edge cases
- extend docs