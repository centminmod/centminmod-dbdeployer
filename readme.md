# dbdeployer for centminmod.com

[dbdeployer](https://github.com/datacharmer/dbdeployer) wrapper script for [centminmod.com LEMP stack](https://centminmod.com) environments on CentOS 7.x 64bit OSes.

# Content

* [Usage](#usage)
  * [for dbdeployer.sh](#for-dbdeployersh)
  * [for dbdeployer binary](#for-dbdeployer-binary)
* [Install](#install)
* [Reset](#reset)
* [Deploy Single Sandbox Instances](#deploy-single-sandbox-instances)
* [Check](#check)

# Usage

## for dbdeployer.sh

```
./dbdeployer.sh 

usage:

./dbdeployer.sh {install|update|reset|check|install-sandboxes}
```

## for dbdeployer binary

```
dbdeployer -h
dbdeployer makes MySQL server installation an easy task.
Runs single, multiple, and replicated sandboxes.

Usage:
  dbdeployer [command]

Available Commands:
  admin           sandbox management tasks
  cookbook        Shows dbdeployer samples
  data-load       tasks related to dbdeployer data loading
  defaults        tasks related to dbdeployer defaults
  delete          delete an installed sandbox
  delete-binaries delete an expanded tarball
  deploy          deploy sandboxes
  downloads       Manages remote tarballs
  export          Exports the command structure in JSON format
  global          Runs a given command in every sandbox
  help            Help about any command
  import          imports one or more MySQL servers into a sandbox
  info            Shows information about dbdeployer environment samples
  init            initializes dbdeployer environment
  sandboxes       List installed sandboxes
  unpack          unpack a tarball into the binary directory
  update          Gets dbdeployer newest version
  usage           Shows usage of installed sandboxes
  use             uses a sandbox
  versions        List available versions

Flags:
      --config string           configuration file (default "/root/.dbdeployer/config.json")
  -h, --help                    help for dbdeployer
      --sandbox-binary string   Binary repository (default "/root/opt/mysql")
      --sandbox-home string     Sandbox deployment directory (default "/root/sandboxes")
      --shell-path string       Path to Bash, used for generated scripts (default "/usr/bin/bash")
      --skip-library-check      Skip check for needed libraries (may cause nasty errors)
  -v, --version                 version for dbdeployer

Use "dbdeployer [command] --help" for more information about a command.
```

# Install

```
./dbdeployer.sh install
```

Install sandbox singles for Oracle MySQL 5.7, 8.0, MariaDB 10.3 to 10.10 and Percona 5.7 and 8.0.

```
./dbdeployer.sh install

installing dbdeployer

dbdeployer defaults show
# Internal values:
{
        "version": "1.66.0",
        "sandbox-home": "$HOME/sandboxes",
        "sandbox-binary": "$HOME/opt/mysql",
        "use-sandbox-catalog": true,
        "log-sb-operations": false,
        "log-directory": "/root/sandboxes/logs",
        "cookbook-directory": "recipes",
        "shell-path": "/usr/bin/bash",
        "master-slave-base-port": 11000,
        "group-replication-base-port": 12000,
        "group-replication-sp-base-port": 13000,
        "fan-in-replication-base-port": 14000,
        "all-masters-replication-base-port": 15000,
        "multiple-base-port": 16000,
        "pxc-base-port": 18000,
        "ndb-base-port": 19000,
        "ndb-cluster-port": 20000,
        "group-port-delta": 125,
        "mysqlx-port-delta": 10000,
        "admin-port-delta": 11000,
        "master-name": "master",
        "master-abbr": "m",
        "node-prefix": "node",
        "slave-prefix": "slave",
        "slave-abbr": "s",
        "sandbox-prefix": "msb_",
        "imported-sandbox-prefix": "imp_msb_",
        "master-slave-prefix": "rsandbox_",
        "group-prefix": "group_msb_",
        "group-sp-prefix": "group_sp_msb_",
        "multiple-prefix": "multi_msb_",
        "fan-in-prefix": "fan_in_msb_",
        "all-masters-prefix": "all_masters_msb_",
        "reserved-ports": [
                1186,
                3306,
                5432,
                33060,
                33062
        ],
        "remote-repository": "https://raw.githubusercontent.com/datacharmer/mysql-docker-minimal/master/dbdata",
        "remote-index-file": "available.json",
        "remote-completion-url": "https://raw.githubusercontent.com/datacharmer/dbdeployer/master/docs/dbdeployer_completion.sh",
        "remote-tarball-url": "https://raw.githubusercontent.com/datacharmer/dbdeployer/master/downloads/tarball_list.json",
        "pxc-prefix": "pxc_msb_",
        "ndb-prefix": "ndb_msb_",
        "default-sandbox-executable": "default",
        "download-name-linux": "mysql-{{.Version}}-linux-glibc2.17-x86_64{{.Minimal}}.{{.Ext}}",
        "download-name-macos": "mysql-{{.Version}}-macos11-x86_64.{{.Ext}}",
        "download-url": "https://dev.mysql.com/get/Downloads/MySQL",
        "timestamp": "Sat Sep 24 04:23:31 UTC 2022"
 }

dbdeployer remote list
Files available in https://raw.githubusercontent.com/datacharmer/mysql-docker-minimal/master/dbdata/available.json
5.6 -> [mysql-5.6.43 mysql-5.6.44]
5.7 -> [mysql-5.7.25 mysql-5.7.26]
8.0 -> [mysql-8.0.15 mysql-8.0.16]
4.1 -> [mysql-4.1.22]
5.0 -> [mysql-5.0.15 mysql-5.0.96]
5.1 -> [mysql-5.1.72]
5.5 -> [mysql-5.5.61 mysql-5.5.62]

dbdeployer -h
dbdeployer makes MySQL server installation an easy task.
Runs single, multiple, and replicated sandboxes.

Usage:
  dbdeployer [command]

Available Commands:
  admin           sandbox management tasks
  cookbook        Shows dbdeployer samples
  data-load       tasks related to dbdeployer data loading
  defaults        tasks related to dbdeployer defaults
  delete          delete an installed sandbox
  delete-binaries delete an expanded tarball
  deploy          deploy sandboxes
  downloads       Manages remote tarballs
  export          Exports the command structure in JSON format
  global          Runs a given command in every sandbox
  help            Help about any command
  import          imports one or more MySQL servers into a sandbox
  info            Shows information about dbdeployer environment samples
  init            initializes dbdeployer environment
  sandboxes       List installed sandboxes
  unpack          unpack a tarball into the binary directory
  update          Gets dbdeployer newest version
  usage           Shows usage of installed sandboxes
  use             uses a sandbox
  versions        List available versions

Flags:
      --config string           configuration file (default "/root/.dbdeployer/config.json")
  -h, --help                    help for dbdeployer
      --sandbox-binary string   Binary repository (default "/root/opt/mysql")
      --sandbox-home string     Sandbox deployment directory (default "/root/sandboxes")
      --shell-path string       Path to Bash, used for generated scripts (default "/usr/bin/bash")
      --skip-library-check      Skip check for needed libraries (may cause nasty errors)
  -v, --version                 version for dbdeployer

Use "dbdeployer [command] --help" for more information about a command.

dbdeployer --version
dbdeployer version 1.69.2

installing Percona binary tarballs
Unpacking tarball Percona-Server-8.0.29-21-Linux.x86_64.glibc2.28-minimal.tar.gz to $HOME/opt/mysql/ps8.0.29
Renaming directory /root/opt/mysql/Percona-Server-8.0.29-21-Linux.x86_64.glibc2.28-minimal to /root/opt/mysql/ps8.0.29
Unpacking tarball Percona-Server-5.7.39-42-Linux.x86_64.glibc2.17-minimal.tar.gz to $HOME/opt/mysql/ps5.7.39
Renaming directory /root/opt/mysql/Percona-Server-5.7.39-42-Linux.x86_64.glibc2.17-minimal to /root/opt/mysql/ps5.7.39
dbdeployer versions
Basedir: /root/opt/mysql
ps5.7.39  ps8.0.29  

installing MariaDB binary tarballs
Unpacking tarball mariadb-10.10.1-linux-systemd-x86_64.tar.gz to $HOME/opt/mysql/maria10.10.1
Renaming directory /root/opt/mysql/mariadb-10.10.1-linux-systemd-x86_64 to /root/opt/mysql/maria10.10.1
Unpacking tarball mariadb-10.9.3-linux-systemd-x86_64.tar.gz to $HOME/opt/mysql/maria10.9.3
Renaming directory /root/opt/mysql/mariadb-10.9.3-linux-systemd-x86_64 to /root/opt/mysql/maria10.9.3
Unpacking tarball mariadb-10.8.5-linux-systemd-x86_64.tar.gz to $HOME/opt/mysql/maria10.8.5
Renaming directory /root/opt/mysql/mariadb-10.8.5-linux-systemd-x86_64 to /root/opt/mysql/maria10.8.5
Unpacking tarball mariadb-10.7.6-linux-systemd-x86_64.tar.gz to $HOME/opt/mysql/maria10.7.6
Renaming directory /root/opt/mysql/mariadb-10.7.6-linux-systemd-x86_64 to /root/opt/mysql/maria10.7.6
Unpacking tarball mariadb-10.6.10-linux-systemd-x86_64.tar.gz to $HOME/opt/mysql/maria10.6.10
Renaming directory /root/opt/mysql/mariadb-10.6.10-linux-systemd-x86_64 to /root/opt/mysql/maria10.6.10
Unpacking tarball mariadb-10.5.17-linux-systemd-x86_64.tar.gz to $HOME/opt/mysql/maria10.5.17
Renaming directory /root/opt/mysql/mariadb-10.5.17-linux-systemd-x86_64 to /root/opt/mysql/maria10.5.17
Unpacking tarball mariadb-10.4.26-linux-systemd-x86_64.tar.gz to $HOME/opt/mysql/maria10.4.26
Renaming directory /root/opt/mysql/mariadb-10.4.26-linux-systemd-x86_64 to /root/opt/mysql/maria10.4.26
Unpacking tarball mariadb-10.3.36-linux-systemd-x86_64.tar.gz to $HOME/opt/mysql/maria10.3.36
Renaming directory /root/opt/mysql/mariadb-10.3.36-linux-systemd-x86_64 to /root/opt/mysql/maria10.3.36
dbdeployer versions
Basedir: /root/opt/mysql
maria10.10.1  maria10.3.36  maria10.4.26  maria10.5.17  maria10.6.10  maria10.7.6   
maria10.8.5   maria10.9.3   ps5.7.39      ps8.0.29      

installing Oracle MySQL binary tarballs
Unpacking tarball mysql-8.0.30-linux-glibc2.17-x86_64-minimal.tar.xz to $HOME/opt/mysql/oracle8.0.30
Renaming directory /root/opt/mysql/mysql-8.0.30-linux-glibc2.17-x86_64-minimal to /root/opt/mysql/oracle8.0.30
Unpacking tarball mysql-5.7.38-linux-glibc2.12-x86_64.tar.gz to $HOME/opt/mysql/oracle5.7.38
Renaming directory /root/opt/mysql/mysql-5.7.38-linux-glibc2.12-x86_64 to /root/opt/mysql/oracle5.7.38
dbdeployer versions
Basedir: /root/opt/mysql
maria10.10.1  maria10.3.36  maria10.4.26  maria10.5.17  maria10.6.10  maria10.7.6   
maria10.8.5   maria10.9.3   oracle5.7.38  oracle8.0.30  ps5.7.39      ps8.0.29      


---------------------------------------------------------------
dbdeployer installed binaries
---------------------------------------------------------------
dbdeployer info version --flavor percona 8.0 = ps8.0.29
dbdeployer info version --flavor percona 5.7 = ps5.7.39
dbdeployer info version --flavor mariadb 10.10 = maria10.10.1
dbdeployer info version --flavor mariadb 10.9 = maria10.9.3
dbdeployer info version --flavor mariadb 10.8 = maria10.8.5
dbdeployer info version --flavor mariadb 10.7 = maria10.7.6
dbdeployer info version --flavor mariadb 10.6 = maria10.6.10
dbdeployer info version --flavor mariadb 10.5 = maria10.5.17
dbdeployer info version --flavor mariadb 10.4 = maria10.4.26
dbdeployer info version --flavor mariadb 10.3 = maria10.3.36
dbdeployer info version --flavor mysql 8.0 = oracle8.0.30
dbdeployer info version --flavor mysql 5.7 = oracle5.7.38
```

# Reset

Delete and remove all dbdeployer sandboxes and binaries for a fresh start.

```
./dbdeployer.sh reset
```

```

```

# Deploy Single Sandbox Instances

```
./dbdeployer.sh install-sandboxes

```

# Check

```
./dbdeployer.sh check

---------------------------------------------------------------
dbdeployer installed binaries
---------------------------------------------------------------
dbdeployer info version --flavor percona 8.0 = ps8.0.29
dbdeployer info version --flavor percona 5.7 = ps5.7.39
dbdeployer info version --flavor mariadb 10.11 = dbdeployer info version --flavor mariadb 10.10 = maria10.10.1
dbdeployer info version --flavor mariadb 10.9 = maria10.9.3
dbdeployer info version --flavor mariadb 10.8 = maria10.8.5
dbdeployer info version --flavor mariadb 10.7 = maria10.7.6
dbdeployer info version --flavor mariadb 10.6 = maria10.6.10
dbdeployer info version --flavor mariadb 10.5 = maria10.5.17
dbdeployer info version --flavor mariadb 10.4 = maria10.4.26
dbdeployer info version --flavor mariadb 10.3 = maria10.3.36
dbdeployer info version --flavor mysql 8.0 = oracle8.0.30
dbdeployer info version --flavor mysql 5.7 = oracle5.7.38
```