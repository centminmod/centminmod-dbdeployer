# dbdeployer for centminmod.com

[dbdeployer](https://github.com/datacharmer/dbdeployer) wrapper script for [centminmod.com LEMP stack](https://centminmod.com) environments on CentOS 7.x/AlmaLinux 8 64bit OSes.

# Content

* [Usage](#usage)
  * [for dbdeployer.sh](#for-dbdeployersh)
  * [for dbdeployer binary](#for-dbdeployer-binary)
* [Install](#install)
* [Reset](#reset)
* [Deploy Single Sandbox Instances](#deploy-single-sandbox-instances)
* [Check](#check)
* [Reset Binaries Only](#reset-binaries-only)

# Usage

## for dbdeployer.sh

```
./dbdeployer.sh 

usage:

./dbdeployer.sh {install|update|wipe|reset|reset-binary|check|install-sandboxes|install-sandboxes-force}
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
```
./dbdeployer.sh install-sandboxes
dbdeployer deploy single sandboxes

creating maria10.3.36 single sandbox instance
dbdeployer deploy single maria10.3.36 --skip-library-check --socket-in-datadir
Database installed in $HOME/sandboxes/msb_maria10_3_36
run 'dbdeployer usage single' for basic instructions'
. sandbox server started

creating maria10.4.26 single sandbox instance
dbdeployer deploy single maria10.4.26 --skip-library-check --socket-in-datadir
Database installed in $HOME/sandboxes/msb_maria10_4_26
run 'dbdeployer usage single' for basic instructions'
. sandbox server started

creating maria10.5.17 single sandbox instance
dbdeployer deploy single maria10.5.17 --skip-library-check --socket-in-datadir
Database installed in $HOME/sandboxes/msb_maria10_5_17
run 'dbdeployer usage single' for basic instructions'
. sandbox server started

creating maria10.6.10 single sandbox instance
dbdeployer deploy single maria10.6.10 --skip-library-check --socket-in-datadir
Database installed in $HOME/sandboxes/msb_maria10_6_10
run 'dbdeployer usage single' for basic instructions'
. sandbox server started

creating oracle5.7.38 single sandbox instance
dbdeployer deploy single oracle5.7.38 --skip-library-check --socket-in-datadir
Database installed in $HOME/sandboxes/msb_oracle5_7_38
run 'dbdeployer usage single' for basic instructions'
. sandbox server started

creating oracle8.0.30 single sandbox instance
dbdeployer deploy single oracle8.0.30 --skip-library-check --socket-in-datadir
Database installed in $HOME/sandboxes/msb_oracle8_0_30
run 'dbdeployer usage single' for basic instructions'
. sandbox server started

creating ps5.7.39 single sandbox instance
dbdeployer deploy single ps5.7.39 --skip-library-check --socket-in-datadir
Database installed in $HOME/sandboxes/msb_ps5_7_39
run 'dbdeployer usage single' for basic instructions'
. sandbox server started

creating ps8.0.29 single sandbox instance
dbdeployer deploy single ps8.0.29 --skip-library-check --socket-in-datadir
Database installed in $HOME/sandboxes/msb_ps8_0_29
run 'dbdeployer usage single' for basic instructions'
. sandbox server started

dbdeployer sandboxes
 msb_maria10_3_36         :   single   maria10.3.36   [10336 ]      
 msb_maria10_4_26         :   single   maria10.4.26   [10426 ]      
 msb_maria10_5_17         :   single   maria10.5.17   [10517 ]      
 msb_maria10_6_10         :   single   maria10.6.10   [10610 ]      
 msb_oracle5_7_38         :   single   oracle5.7.38   [5738 ]       
 msb_oracle8_0_30         :   single   oracle8.0.30   [8030 18030 ] 
 msb_ps5_7_39             :   single   ps5.7.39       [5739 ]       
 msb_ps8_0_29             :   single   ps8.0.29       [8029 18029 ] 

sandbox info

/root/sandboxes/msb_maria10_3_36/my sql -e '\s'
--------------
/root/opt/mysql/maria10.3.36/bin/mysql  Ver 15.1 Distrib 10.3.36-MariaDB, for linux-systemd (x86_64) using readline 5.1

Connection id:          9
Current database:
Current user:           msandbox@localhost
SSL:                    Not in use
Current pager:          stdout
Using outfile:          ''
Using delimiter:        ;
Server:                 MariaDB
Server version:         10.3.36-MariaDB MariaDB Server
Protocol version:       10
Connection:             Localhost via UNIX socket
Server characterset:    latin1
Db     characterset:    latin1
Client characterset:    utf8
Conn.  characterset:    utf8
UNIX socket:            /root/sandboxes/msb_maria10_3_36/data/mysql_sandbox10336.sock
Uptime:                 25 sec

Threads: 6  Questions: 20  Slow queries: 0  Opens: 18  Flush tables: 1  Open tables: 11  Queries per second avg: 0.800
--------------


/root/sandboxes/msb_maria10_4_26/my sql -e '\s'
--------------
/root/opt/mysql/maria10.4.26/bin/mysql  Ver 15.1 Distrib 10.4.26-MariaDB, for linux-systemd (x86_64) using readline 5.1

Connection id:          9
Current database:
Current user:           msandbox@localhost
SSL:                    Not in use
Current pager:          stdout
Using outfile:          ''
Using delimiter:        ;
Server:                 MariaDB
Server version:         10.4.26-MariaDB MariaDB Server
Protocol version:       10
Connection:             Localhost via UNIX socket
Server characterset:    latin1
Db     characterset:    latin1
Client characterset:    utf8
Conn.  characterset:    utf8
UNIX socket:            /root/sandboxes/msb_maria10_4_26/data/mysql_sandbox10426.sock
Uptime:                 21 sec

Threads: 6  Questions: 20  Slow queries: 0  Opens: 20  Flush tables: 1  Open tables: 13  Queries per second avg: 0.952
--------------


/root/sandboxes/msb_maria10_5_17/my sql -e '\s'
--------------
/root/opt/mysql/maria10.5.17/bin/mysql  Ver 15.1 Distrib 10.5.17-MariaDB, for linux-systemd (x86_64) using readline 5.1

Connection id:          4
Current database:
Current user:           msandbox@localhost
SSL:                    Not in use
Current pager:          stdout
Using outfile:          ''
Using delimiter:        ;
Server:                 MariaDB
Server version:         10.5.17-MariaDB MariaDB Server
Protocol version:       10
Connection:             Localhost via UNIX socket
Server characterset:    latin1
Db     characterset:    latin1
Client characterset:    utf8
Conn.  characterset:    utf8
UNIX socket:            /root/sandboxes/msb_maria10_5_17/data/mysql_sandbox10517.sock
Uptime:                 20 sec

Threads: 1  Questions: 20  Slow queries: 0  Opens: 20  Open tables: 13  Queries per second avg: 1.000
--------------


/root/sandboxes/msb_maria10_6_10/my sql -e '\s'
--------------
/root/opt/mysql/maria10.6.10/bin/mysql  Ver 15.1 Distrib 10.6.10-MariaDB, for linux-systemd (x86_64) using readline 5.1

Connection id:          4
Current database:
Current user:           msandbox@localhost
SSL:                    Not in use
Current pager:          stdout
Using outfile:          ''
Using delimiter:        ;
Server:                 MariaDB
Server version:         10.6.10-MariaDB MariaDB Server
Protocol version:       10
Connection:             Localhost via UNIX socket
Server characterset:    latin1
Db     characterset:    latin1
Client characterset:    utf8mb3
Conn.  characterset:    utf8mb3
UNIX socket:            /root/sandboxes/msb_maria10_6_10/data/mysql_sandbox10610.sock
Uptime:                 18 sec

Threads: 1  Questions: 20  Slow queries: 0  Opens: 20  Open tables: 13  Queries per second avg: 1.111
--------------


/root/sandboxes/msb_oracle5_7_38/my sql -e '\s'
--------------
/root/opt/mysql/oracle5.7.38/bin/mysql  Ver 14.14 Distrib 5.7.38, for linux-glibc2.12 (x86_64) using  EditLine wrapper

Connection id:          3
Current database:
Current user:           msandbox@localhost
SSL:                    Not in use
Current pager:          stdout
Using outfile:          ''
Using delimiter:        ;
Server version:         5.7.38 MySQL Community Server (GPL)
Protocol version:       10
Connection:             Localhost via UNIX socket
Server characterset:    latin1
Db     characterset:    latin1
Client characterset:    utf8
Conn.  characterset:    utf8
UNIX socket:            /root/sandboxes/msb_oracle5_7_38/data/mysql_sandbox5738.sock
Uptime:                 14 sec

Threads: 1  Questions: 25  Slow queries: 0  Opens: 111  Flush tables: 1  Open tables: 104  Queries per second avg: 1.785
--------------


/root/sandboxes/msb_oracle8_0_30/my sql -e '\s'
--------------
/root/opt/mysql/oracle8.0.30/bin/mysql  Ver 8.0.30 for Linux on x86_64 (MySQL Community Server - GPL)

Connection id:          9
Current database:
Current user:           msandbox@localhost
SSL:                    Not in use
Current pager:          stdout
Using outfile:          ''
Using delimiter:        ;
Server version:         8.0.30 MySQL Community Server - GPL
Protocol version:       10
Connection:             Localhost via UNIX socket
Server characterset:    utf8mb4
Db     characterset:    utf8mb4
Client characterset:    utf8mb4
Conn.  characterset:    utf8mb4
UNIX socket:            /root/sandboxes/msb_oracle8_0_30/data/mysql_sandbox8030.sock
Uptime:                 9 sec

Threads: 2  Questions: 42  Slow queries: 0  Opens: 149  Flush tables: 3  Open tables: 65  Queries per second avg: 4.666
--------------


/root/sandboxes/msb_ps5_7_39/my sql -e '\s'
--------------
/root/opt/mysql/ps5.7.39/bin/mysql  Ver 14.14 Distrib 5.7.39-42, for Linux (x86_64) using  6.2

Connection id:          3
Current database:
Current user:           msandbox@localhost
SSL:                    Not in use
Current pager:          stdout
Using outfile:          ''
Using delimiter:        ;
Server version:         5.7.39-42 Percona Server (GPL), Release 42, Revision b0a7dc2da2e
Protocol version:       10
Connection:             Localhost via UNIX socket
Server characterset:    latin1
Db     characterset:    latin1
Client characterset:    utf8
Conn.  characterset:    utf8
UNIX socket:            /root/sandboxes/msb_ps5_7_39/data/mysql_sandbox5739.sock
Uptime:                 5 sec

Threads: 1  Questions: 25  Slow queries: 0  Opens: 112  Flush tables: 1  Open tables: 105  Queries per second avg: 5.000
--------------


/root/sandboxes/msb_ps8_0_29/my sql -e '\s'
--------------
/root/opt/mysql/ps8.0.29/bin/mysql  Ver 8.0.29-21 for Linux on x86_64 (Percona Server (GPL), Release 21, Revision c59f87d2854)

Connection id:          9
Current database:
Current user:           msandbox@localhost
SSL:                    Not in use
Current pager:          stdout
Using outfile:          ''
Using delimiter:        ;
Server version:         8.0.29-21 Percona Server (GPL), Release 21, Revision c59f87d2854
Protocol version:       10
Connection:             Localhost via UNIX socket
Server characterset:    utf8mb4
Db     characterset:    utf8mb4
Client characterset:    utf8mb4
Conn.  characterset:    utf8mb4
UNIX socket:            /root/sandboxes/msb_ps8_0_29/data/mysql_sandbox8029.sock
Uptime:                 1 sec

Threads: 2  Questions: 42  Slow queries: 0  Opens: 149  Flush tables: 3  Open tables: 65  Queries per second avg: 42.000
--------------
```

# Check

```
./dbdeployer.sh check

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

# Reset Binaries Only

Delete only installed binaries

```
./dbdeployer.sh reset-binary

resetting bins


dbdeployer delete-binaries maria10.3.36

binaries directory /root/opt/mysql/maria10.3.36 is used by the following deployments:
/root/sandboxes/msb_maria10_3_36

dbdeployer delete-binaries maria10.4.26

binaries directory /root/opt/mysql/maria10.4.26 is used by the following deployments:
/root/sandboxes/msb_maria10_4_26

dbdeployer delete-binaries maria10.5.17

binaries directory /root/opt/mysql/maria10.5.17 is used by the following deployments:
/root/sandboxes/msb_maria10_5_17

dbdeployer delete-binaries maria10.6.10

binaries directory /root/opt/mysql/maria10.6.10 is used by the following deployments:
/root/sandboxes/msb_maria10_6_10

dbdeployer delete-binaries oracle5.7.38

binaries directory /root/opt/mysql/oracle5.7.38 is used by the following deployments:
/root/sandboxes/msb_oracle5_7_38

dbdeployer delete-binaries oracle8.0.30

binaries directory /root/opt/mysql/oracle8.0.30 is used by the following deployments:
/root/sandboxes/msb_oracle8_0_30

dbdeployer delete-binaries ps5.7.39

binaries directory /root/opt/mysql/ps5.7.39 is used by the following deployments:
/root/sandboxes/msb_ps5_7_39

dbdeployer delete-binaries ps8.0.29

binaries directory /root/opt/mysql/ps8.0.29 is used by the following deployments:
/root/sandboxes/msb_ps8_0_29
```