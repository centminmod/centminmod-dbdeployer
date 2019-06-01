# dbdeployer for centminmod.com

[dbdeployer](https://github.com/datacharmer/dbdeployer) wrapper script for [centminmod.com LEMP stack](https://centminmod.com) environments on CentOS 7.x 64bit OSes.

Usage

## for dbdeployer.sh

```
./dbdeployer.sh 

usage:

./dbdeployer.sh {install|update|reset|check}
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
  defaults        tasks related to dbdeployer defaults
  delete          delete an installed sandbox
  delete-binaries delete an expanded tarball
  deploy          deploy sandboxes
  export          Exports the command structure in JSON format
  global          Runs a given command in every sandbox
  help            Help about any command
  info            Shows information about dbdeployer environment samples
  remote          Manages remote tarballs
  sandboxes       List installed sandboxes
  unpack          unpack a tarball into the binary directory
  usage           Shows usage of installed sandboxes
  versions        List available versions

Flags:
      --config string           configuration file (default "/root/.dbdeployer/config.json")
  -h, --help                    help for dbdeployer
      --sandbox-binary string   Binary repository (default "/root/opt/mysql")
      --sandbox-home string     Sandbox deployment directory (default "/root/sandboxes")
      --version                 version for dbdeployer

Use "dbdeployer [command] --help" for more information about a command.
```

# Install

```
./dbdeployer.sh install
```

Install sandbox singles for Oracle MySQL 5.7, 8.0, MariaDB 10.1, 10.2, 10.3, 10.4 and Percona 5.7 and 8.0.

```

./dbdeployer.sh install                 

installing dbdeployer

dbdeployer defaults show
# Internal values:
{
        "version": "1.30.0",
        "sandbox-home": "$HOME/sandboxes",
        "sandbox-binary": "$HOME/opt/mysql",
        "use-sandbox-catalog": true,
        "log-sb-operations": false,
        "log-directory": "/root/sandboxes/logs",
        "cookbook-directory": "recipes",
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
        "master-slave-prefix": "rsandbox_",
        "group-prefix": "group_msb_",
        "group-sp-prefix": "group_sp_msb_",
        "multiple-prefix": "multi_msb_",
        "fan-in-prefix": "fan_in_msb_",
        "all-masters-prefix": "all_masters_msb_",
        "reserved-ports": [
                1186,
                3306,
                33060,
                33062
        ],
        "remote-repository": "https://raw.githubusercontent.com/datacharmer/mysql-docker-minimal/master/dbdata",
        "remote-index-file": "available.json",
        "pxc-prefix": "pxc_msb_",
        "ndb-prefix": "ndb_msb_",
        "timestamp": "Sat Jun  1 15:06:44 UTC 2019"
 }

dbdeployer remote list
Files available in https://raw.githubusercontent.com/datacharmer/mysql-docker-minimal/master/dbdata/available.json
8.0 -> [mysql-8.0.15 mysql-8.0.16]
4.1 -> [mysql-4.1.22]
5.0 -> [mysql-5.0.15 mysql-5.0.96]
5.1 -> [mysql-5.1.72]
5.5 -> [mysql-5.5.61 mysql-5.5.62]
5.6 -> [mysql-5.6.43 mysql-5.6.44]
5.7 -> [mysql-5.7.25 mysql-5.7.26]

dbdeployer -h
dbdeployer makes MySQL server installation an easy task.
Runs single, multiple, and replicated sandboxes.

Usage:
  dbdeployer [command]

Available Commands:
  admin           sandbox management tasks
  cookbook        Shows dbdeployer samples
  defaults        tasks related to dbdeployer defaults
  delete          delete an installed sandbox
  delete-binaries delete an expanded tarball
  deploy          deploy sandboxes
  export          Exports the command structure in JSON format
  global          Runs a given command in every sandbox
  help            Help about any command
  info            Shows information about dbdeployer environment samples
  remote          Manages remote tarballs
  sandboxes       List installed sandboxes
  unpack          unpack a tarball into the binary directory
  usage           Shows usage of installed sandboxes
  versions        List available versions

Flags:
      --config string           configuration file (default "/root/.dbdeployer/config.json")
  -h, --help                    help for dbdeployer
      --sandbox-binary string   Binary repository (default "/root/opt/mysql")
      --sandbox-home string     Sandbox deployment directory (default "/root/sandboxes")
      --version                 version for dbdeployer

Use "dbdeployer [command] --help" for more information about a command.

dbdeployer --version
dbdeployer version 1.30.1

installing Percona binary tarballs
Unpacking tarball Percona-Server-8.0.15-6-Linux.x86_64.ssl.tar.gz to $HOME/opt/mysql/ps8.0.15
.........100..................15900.........16000.........16100.........16200.........16300.........16400.........16500.........16600.........16700.........16800.........16900.........17000.........17100.........17200.........17300.........17400.........17500.........17600.........17700.........17800.........17900.........18000.........18100.........18200.........18300.........18400.........18500.........18600.........18700.........18800.........18900.........19000.........19100.........19200.........19300.........19400.........19500.........19600.........19700.........19800.........19900.........20000.........20100.........20200.........20300.........20400.........20500.........20600.........20700.........20800.........20900.........21000.........21100.........21200.........21300.........21400.........21500..21521
Renaming directory /root/opt/mysql/Percona-Server-8.0.15-6-Linux.x86_64.ssl to /root/opt/mysql/ps8.0.15
Unpacking tarball Percona-Server-5.7.26-29-Linux.x86_64.ssl101.tar.gz to $HOME/opt/mysql/ps5.7.26
.........100..................15900.........16000.........16100.........16200.........16300.........16400.........16500.........16600.........16700.........16800.........16900.........17000.........17100.........17200.........17300.........17400.........17500.........17600.........17700.........17800.........17900.........18000.........18100.........18200.........18300.........18400.........18500.........18600.........18700.........18800.........18900.........19000.........19100.........19200.......19275
Renaming directory /root/opt/mysql/Percona-Server-5.7.26-29-Linux.x86_64.ssl101 to /root/opt/mysql/ps5.7.26
Basedir: /root/opt/mysql
ps5.7.26  ps8.0.15  

installing MariaDB binary tarballs
Unpacking tarball mariadb-10.4.5-linux-glibc_214-x86_64.tar.gz to $HOME/opt/mysql/maria10.4.5
.........100..................15900.........16000.........16100.........16200.........16300.........16400.........16500.........16600.........16700.........16800.........16900.........17000.........17100.........17200.........17300.........17400.........17500.........17599
Renaming directory /root/opt/mysql/mariadb-10.4.5-linux-glibc_214-x86_64 to /root/opt/mysql/maria10.4.5
Unpacking tarball mariadb-10.3.15-linux-x86_64.tar.gz to $HOME/opt/mysql/maria10.3.15
.........100..................15900.........16000.........16100.........16200.........16300.........16400.........16500.........16600.........16700.........16800.........16900.........17000...17031
Renaming directory /root/opt/mysql/mariadb-10.3.15-linux-x86_64 to /root/opt/mysql/maria10.3.15
Unpacking tarball mariadb-10.2.24-linux-x86_64.tar.gz to $HOME/opt/mysql/maria10.2.24
.........100..................15000.........15100.........15200.....15259
Renaming directory /root/opt/mysql/mariadb-10.2.24-linux-x86_64 to /root/opt/mysql/maria10.2.24
Unpacking tarball mariadb-10.1.40-linux-x86_64.tar.gz to $HOME/opt/mysql/maria10.1.40
.........100..................13900.........14000.........14100.........14200.........14300.........14400.........14500....14546
Renaming directory /root/opt/mysql/mariadb-10.1.40-linux-x86_64 to /root/opt/mysql/maria10.1.40
Basedir: /root/opt/mysql
maria10.1.40  maria10.2.24  maria10.3.15  maria10.4.5   ps5.7.26      ps8.0.15      


installing Oracle MySQL binary tarballs
file '/svr-setup/mysql-8.0.16.tar.xz' already exists
Unpacking tarball mysql-8.0.16.tar.xz to $HOME/opt/mysql/oracle8.0.16
........85
Renaming directory /root/opt/mysql/mysql-8.0.16 to /root/opt/mysql/oracle8.0.16
file '/svr-setup/mysql-5.7.26.tar.xz' already exists
Unpacking tarball mysql-5.7.26.tar.xz to $HOME/opt/mysql/oracle5.7.26
.........99
Renaming directory /root/opt/mysql/mysql-5.7.26 to /root/opt/mysql/oracle5.7.26
Basedir: /root/opt/mysql
maria10.1.40  maria10.2.24  maria10.3.15  maria10.4.5   oracle5.7.26  oracle8.0.16  
ps5.7.26      ps8.0.15      

dbdeployer info version --flavor percona 8.0
ps8.0.15

dbdeployer info version --flavor percona 5.7
ps5.7.26

dbdeployer info version --flavor mariadb 10.4
maria10.4.5

dbdeployer info version --flavor mariadb 10.3
maria10.3.15

dbdeployer info version --flavor mariadb 10.2
maria10.2.24

dbdeployer info version --flavor mariadb 10.1
maria10.1.40

dbdeployer info version --flavor mysql 8.0
oracle8.0.16

dbdeployer info version --flavor mysql 5.7
oracle5.7.26
```

# Reset

Delete and remove all dbdeployer sandboxes and binaries for a fresh start.

```
./dbdeployer.sh reset
```

```
./dbdeployer.sh reset

resetting all

dbdeployer delete all
Nothing to delete in /root/sandboxes

dbdeployer delete-binaries maria10.1.40
Do you want to delete maria10.1.40? y/[N] Proceeding with deletion
Directory maria10.1.40 removed

dbdeployer delete-binaries maria10.2.24
Do you want to delete maria10.2.24? y/[N] Proceeding with deletion
Directory maria10.2.24 removed

dbdeployer delete-binaries maria10.3.15
Do you want to delete maria10.3.15? y/[N] Proceeding with deletion
Directory maria10.3.15 removed

dbdeployer delete-binaries maria10.4.5
Do you want to delete maria10.4.5? y/[N] Proceeding with deletion
Directory maria10.4.5 removed

dbdeployer delete-binaries oracle5.7.26
Do you want to delete oracle5.7.26? y/[N] Proceeding with deletion
Directory oracle5.7.26 removed

dbdeployer delete-binaries oracle8.0.16
Do you want to delete oracle8.0.16? y/[N] Proceeding with deletion
Directory oracle8.0.16 removed

dbdeployer delete-binaries ps5.7.26
Do you want to delete ps5.7.26? y/[N] Proceeding with deletion
Directory ps5.7.26 removed

dbdeployer delete-binaries ps8.0.15
Do you want to delete ps8.0.15? y/[N] Proceeding with deletion
Directory ps8.0.15 removed
```