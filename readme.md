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

./dbdeployer.sh install
./dbdeployer.sh install-mariadb
./dbdeployer.sh install-percona
./dbdeployer.sh install-oracle
./dbdeployer.sh update
./dbdeployer.sh wipe
./dbdeployer.sh reset
./dbdeployer.sh reset-binary
./dbdeployer.sh check
./dbdeployer.sh delete-sandboxes
./dbdeployer.sh install-sandboxes
./dbdeployer.sh install-sandboxes-force
./dbdeployer.sh install-sandboxes binlogs
./dbdeployer.sh install-sandboxes-force binlogs
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
        "version": "1.70.0",
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
        "timestamp": "Sun Apr 30 01:04:59 EDT 2023"
 }

dbdeployer remote list
Files available in https://raw.githubusercontent.com/datacharmer/mysql-docker-minimal/master/dbdata/available.json
5.7 -> [mysql-5.7.25 mysql-5.7.26]
8.0 -> [mysql-8.0.15 mysql-8.0.16]
4.1 -> [mysql-4.1.22]
5.0 -> [mysql-5.0.15 mysql-5.0.96]
5.1 -> [mysql-5.1.72]
5.5 -> [mysql-5.5.61 mysql-5.5.62]
5.6 -> [mysql-5.6.43 mysql-5.6.44]

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
dbdeployer version 1.72.0

installing Percona binary tarballs
Unpacking tarball Percona-Server-8.0.32-24-Linux.x86_64.glibc2.28-minimal.tar.gz to $HOME/opt/mysql/ps8.0.32
Renaming directory /root/opt/mysql/Percona-Server-8.0.32-24-Linux.x86_64.glibc2.28-minimal to /root/opt/mysql/ps8.0.32

installing MariaDB binary tarballs
Unpacking tarball mariadb-10.6.12-linux-systemd-x86_64.tar.gz to $HOME/opt/mysql/maria10.6.12
Renaming directory /root/opt/mysql/mariadb-10.6.12-linux-systemd-x86_64 to /root/opt/mysql/maria10.6.12
Unpacking tarball mariadb-10.5.19-linux-systemd-x86_64.tar.gz to $HOME/opt/mysql/maria10.5.19
Renaming directory /root/opt/mysql/mariadb-10.5.19-linux-systemd-x86_64 to /root/opt/mysql/maria10.5.19
Unpacking tarball mariadb-10.4.28-linux-systemd-x86_64.tar.gz to $HOME/opt/mysql/maria10.4.28
Renaming directory /root/opt/mysql/mariadb-10.4.28-linux-systemd-x86_64 to /root/opt/mysql/maria10.4.28
Unpacking tarball mariadb-10.3.38-linux-systemd-x86_64.tar.gz to $HOME/opt/mysql/maria10.3.38
Renaming directory /root/opt/mysql/mariadb-10.3.38-linux-systemd-x86_64 to /root/opt/mysql/maria10.3.38
dbdeployer versions
Basedir: /root/opt/mysql
maria10.3.38  maria10.4.28  maria10.5.19  maria10.6.12  ps8.0.32      

installing Oracle MySQL binary tarballs
Unpacking tarball mysql-8.0.33-linux-glibc2.28-x86_64.tar.gz to $HOME/opt/mysql/oracle8.0.33
Renaming directory /root/opt/mysql/mysql-8.0.33-linux-glibc2.28-x86_64 to /root/opt/mysql/oracle8.0.33
dbdeployer versions
Basedir: /root/opt/mysql
maria10.3.38  maria10.4.28  maria10.5.19  maria10.6.12  oracle8.0.33  ps8.0.32      


installing Oracle MySQL Shell
8.0.33
Merging shell tarball mysql-shell-8.0.33-linux-glibc2.12-x86-64bit.tar.gz to $HOME/opt/mysql/oracle8.0.33

---------------------------------------------------------------
dbdeployer installed binaries
---------------------------------------------------------------
dbdeployer info version --flavor percona 8.0 = ps8.0.32
dbdeployer info version --flavor mariadb 10.6 = maria10.6.12
dbdeployer info version --flavor mariadb 10.5 = maria10.5.19
dbdeployer info version --flavor mariadb 10.4 = maria10.4.28
dbdeployer info version --flavor mariadb 10.3 = maria10.3.38
dbdeployer info version --flavor mysql 8.0 = oracle8.0.33
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

creating maria10.3.38 single sandbox instance
dbdeployer deploy single maria10.3.38 --skip-library-check --socket-in-datadir --init-options '--auth-root-authhentication-method=normal'
Database installed in $HOME/sandboxes/msb_maria10_3_38
run 'dbdeployer usage single' for basic instructions'
. sandbox server started

creating maria10.4.28 single sandbox instance
dbdeployer deploy single maria10.4.28 --skip-library-check --socket-in-datadir --init-options '--auth-root-authentication-method=normal'
Database installed in $HOME/sandboxes/msb_maria10_4_28
run 'dbdeployer usage single' for basic instructions'
. sandbox server started

creating maria10.5.19 single sandbox instance
dbdeployer deploy single maria10.5.19 --skip-library-check --socket-in-datadir --init-options '--auth-root-authentication-method=normal'
Database installed in $HOME/sandboxes/msb_maria10_5_19
run 'dbdeployer usage single' for basic instructions'
. sandbox server started

creating maria10.6.12 single sandbox instance
dbdeployer deploy single maria10.6.12 --skip-library-check --socket-in-datadir --init-options '--auth-root-authentication-method=normal'
Database installed in $HOME/sandboxes/msb_maria10_6_12
run 'dbdeployer usage single' for basic instructions'
. sandbox server started

creating oracle8.0.33 single sandbox instance
dbdeployer deploy single oracle8.0.33 --skip-library-check --socket-in-datadir
Database installed in $HOME/sandboxes/msb_oracle8_0_33
run 'dbdeployer usage single' for basic instructions'
. sandbox server started

creating ps8.0.32 single sandbox instance
dbdeployer deploy single ps8.0.32 --skip-library-check --socket-in-datadir
error creating sandbox: 'check directory directory /root/sandboxes/msb_ps8_0_32 already exists. Use --force to override'

dbdeployer sandboxes
 msb_maria10_3_38         :   single   maria10.3.38   [10338 ]      
 msb_maria10_4_28         :   single   maria10.4.28   [10428 ]      
 msb_maria10_5_19         :   single   maria10.5.19   [10519 ]      
 msb_maria10_6_12         :   single   maria10.6.12   [10612 ]      
 msb_oracle8_0_33         :   single   oracle8.0.33   [8033 18033 ] 

sandbox info

/root/sandboxes/msb_maria10_3_38/my sql -e '\s'
--------------
/root/opt/mysql/maria10.3.38/bin/mysql  Ver 15.1 Distrib 10.3.38-MariaDB, for linux-systemd (x86_64) using readline 5.1

Connection id:          9
Current database:
Current user:           msandbox@localhost
SSL:                    Not in use
Current pager:          stdout
Using outfile:          ''
Using delimiter:        ;
Server:                 MariaDB
Server version:         10.3.38-MariaDB MariaDB Server
Protocol version:       10
Connection:             Localhost via UNIX socket
Server characterset:    latin1
Db     characterset:    latin1
Client characterset:    utf8
Conn.  characterset:    utf8
UNIX socket:            /root/sandboxes/msb_maria10_3_38/data/mysql_sandbox10338.sock
Uptime:                 11 sec

Threads: 6  Questions: 20  Slow queries: 0  Opens: 18  Flush tables: 1  Open tables: 11  Queries per second avg: 1.818
--------------


/root/sandboxes/msb_maria10_4_28/my sql -e '\s'
--------------
/root/opt/mysql/maria10.4.28/bin/mysql  Ver 15.1 Distrib 10.4.28-MariaDB, for linux-systemd (x86_64) using readline 5.1

Connection id:          9
Current database:
Current user:           msandbox@localhost
SSL:                    Not in use
Current pager:          stdout
Using outfile:          ''
Using delimiter:        ;
Server:                 MariaDB
Server version:         10.4.28-MariaDB MariaDB Server
Protocol version:       10
Connection:             Localhost via UNIX socket
Server characterset:    latin1
Db     characterset:    latin1
Client characterset:    utf8
Conn.  characterset:    utf8
UNIX socket:            /root/sandboxes/msb_maria10_4_28/data/mysql_sandbox10428.sock
Uptime:                 8 sec

Threads: 6  Questions: 20  Slow queries: 0  Opens: 20  Flush tables: 1  Open tables: 13  Queries per second avg: 2.500
--------------


/root/sandboxes/msb_maria10_5_19/my sql -e '\s'
--------------
/root/opt/mysql/maria10.5.19/bin/mysql  Ver 15.1 Distrib 10.5.19-MariaDB, for linux-systemd (x86_64) using readline 5.1

Connection id:          4
Current database:
Current user:           msandbox@localhost
SSL:                    Not in use
Current pager:          stdout
Using outfile:          ''
Using delimiter:        ;
Server:                 MariaDB
Server version:         10.5.19-MariaDB MariaDB Server
Protocol version:       10
Connection:             Localhost via UNIX socket
Server characterset:    latin1
Db     characterset:    latin1
Client characterset:    utf8
Conn.  characterset:    utf8
UNIX socket:            /root/sandboxes/msb_maria10_5_19/data/mysql_sandbox10519.sock
Uptime:                 6 sec

Threads: 1  Questions: 20  Slow queries: 0  Opens: 20  Open tables: 13  Queries per second avg: 3.333
--------------


/root/sandboxes/msb_maria10_6_12/my sql -e '\s'
--------------
/root/opt/mysql/maria10.6.12/bin/mysql  Ver 15.1 Distrib 10.6.12-MariaDB, for linux-systemd (x86_64) using readline 5.1

Connection id:          4
Current database:
Current user:           msandbox@localhost
SSL:                    Not in use
Current pager:          stdout
Using outfile:          ''
Using delimiter:        ;
Server:                 MariaDB
Server version:         10.6.12-MariaDB MariaDB Server
Protocol version:       10
Connection:             Localhost via UNIX socket
Server characterset:    latin1
Db     characterset:    latin1
Client characterset:    utf8mb3
Conn.  characterset:    utf8mb3
UNIX socket:            /root/sandboxes/msb_maria10_6_12/data/mysql_sandbox10612.sock
Uptime:                 5 sec

Threads: 1  Questions: 20  Slow queries: 0  Opens: 20  Open tables: 13  Queries per second avg: 4.000
--------------


/root/sandboxes/msb_oracle8_0_33/my sql -e '\s'
--------------
/root/opt/mysql/oracle8.0.33/bin/mysql  Ver 8.0.33 for Linux on x86_64 (MySQL Community Server - GPL)

Connection id:          9
Current database:
Current user:           msandbox@localhost
SSL:                    Not in use
Current pager:          stdout
Using outfile:          ''
Using delimiter:        ;
Server version:         8.0.33 MySQL Community Server - GPL
Protocol version:       10
Connection:             Localhost via UNIX socket
Server characterset:    utf8mb4
Db     characterset:    utf8mb4
Client characterset:    utf8mb4
Conn.  characterset:    utf8mb4
UNIX socket:            /root/sandboxes/msb_oracle8_0_33/data/mysql_sandbox8033.sock
Uptime:                 0 sec

Threads: 2  Questions: 42  Slow queries: 0  Opens: 149  Flush tables: 3  Open tables: 65  Queries per second avg: 0.000
--------------
```

# Check

```
./dbdeployer.sh check

---------------------------------------------------------------
dbdeployer installed binaries
---------------------------------------------------------------

---------------------------------------------------------------
dbdeployer sandboxes
---------------------------------------------------------------
 msb_maria10_3_38         :   single   maria10.3.38   [10338 ]      
 msb_maria10_4_28         :   single   maria10.4.28   [10428 ]      
 msb_maria10_5_19         :   single   maria10.5.19   [10519 ]      
 msb_maria10_6_12         :   single   maria10.6.12   [10612 ]      
 msb_oracle8_0_33         :   single   oracle8.0.33   [8033 18033 ] 

---------------------------------------------------------------
sandbox info
---------------------------------------------------------------

/root/sandboxes/msb_maria10_3_38/my sql -e '\s'
--------------
/root/opt/mysql/maria10.3.38/bin/mysql  Ver 15.1 Distrib 10.3.38-MariaDB, for linux-systemd (x86_64) using readline 5.1

Connection id:          10
Current database:
Current user:           msandbox@localhost
SSL:                    Not in use
Current pager:          stdout
Using outfile:          ''
Using delimiter:        ;
Server:                 MariaDB
Server version:         10.3.38-MariaDB MariaDB Server
Protocol version:       10
Connection:             Localhost via UNIX socket
Server characterset:    latin1
Db     characterset:    latin1
Client characterset:    utf8
Conn.  characterset:    utf8
UNIX socket:            /root/sandboxes/msb_maria10_3_38/data/mysql_sandbox10338.sock
Uptime:                 1 min 22 sec

Threads: 6  Questions: 24  Slow queries: 0  Opens: 18  Flush tables: 1  Open tables: 11  Queries per second avg: 0.292
--------------

saving msb_maria10_3_38 variables to /home/dbdeployer/msb_maria10_3_38-variables.txt
/root/sandboxes/msb_maria10_3_38/my sqladmin var
---------------------------------------------------------------

/root/sandboxes/msb_maria10_4_28/my sql -e '\s'
--------------
/root/opt/mysql/maria10.4.28/bin/mysql  Ver 15.1 Distrib 10.4.28-MariaDB, for linux-systemd (x86_64) using readline 5.1

Connection id:          10
Current database:
Current user:           msandbox@localhost
SSL:                    Not in use
Current pager:          stdout
Using outfile:          ''
Using delimiter:        ;
Server:                 MariaDB
Server version:         10.4.28-MariaDB MariaDB Server
Protocol version:       10
Connection:             Localhost via UNIX socket
Server characterset:    latin1
Db     characterset:    latin1
Client characterset:    utf8
Conn.  characterset:    utf8
UNIX socket:            /root/sandboxes/msb_maria10_4_28/data/mysql_sandbox10428.sock
Uptime:                 1 min 19 sec

Threads: 6  Questions: 24  Slow queries: 0  Opens: 20  Flush tables: 1  Open tables: 13  Queries per second avg: 0.303
--------------

saving msb_maria10_4_28 variables to /home/dbdeployer/msb_maria10_4_28-variables.txt
/root/sandboxes/msb_maria10_4_28/my sqladmin var
---------------------------------------------------------------

/root/sandboxes/msb_maria10_5_19/my sql -e '\s'
--------------
/root/opt/mysql/maria10.5.19/bin/mysql  Ver 15.1 Distrib 10.5.19-MariaDB, for linux-systemd (x86_64) using readline 5.1

Connection id:          5
Current database:
Current user:           msandbox@localhost
SSL:                    Not in use
Current pager:          stdout
Using outfile:          ''
Using delimiter:        ;
Server:                 MariaDB
Server version:         10.5.19-MariaDB MariaDB Server
Protocol version:       10
Connection:             Localhost via UNIX socket
Server characterset:    latin1
Db     characterset:    latin1
Client characterset:    utf8
Conn.  characterset:    utf8
UNIX socket:            /root/sandboxes/msb_maria10_5_19/data/mysql_sandbox10519.sock
Uptime:                 1 min 17 sec

Threads: 1  Questions: 24  Slow queries: 0  Opens: 20  Open tables: 13  Queries per second avg: 0.311
--------------

saving msb_maria10_5_19 variables to /home/dbdeployer/msb_maria10_5_19-variables.txt
/root/sandboxes/msb_maria10_5_19/my sqladmin var
---------------------------------------------------------------

/root/sandboxes/msb_maria10_6_12/my sql -e '\s'
--------------
/root/opt/mysql/maria10.6.12/bin/mysql  Ver 15.1 Distrib 10.6.12-MariaDB, for linux-systemd (x86_64) using readline 5.1

Connection id:          5
Current database:
Current user:           msandbox@localhost
SSL:                    Not in use
Current pager:          stdout
Using outfile:          ''
Using delimiter:        ;
Server:                 MariaDB
Server version:         10.6.12-MariaDB MariaDB Server
Protocol version:       10
Connection:             Localhost via UNIX socket
Server characterset:    latin1
Db     characterset:    latin1
Client characterset:    utf8mb3
Conn.  characterset:    utf8mb3
UNIX socket:            /root/sandboxes/msb_maria10_6_12/data/mysql_sandbox10612.sock
Uptime:                 1 min 16 sec

Threads: 1  Questions: 24  Slow queries: 0  Opens: 20  Open tables: 13  Queries per second avg: 0.315
--------------

saving msb_maria10_6_12 variables to /home/dbdeployer/msb_maria10_6_12-variables.txt
/root/sandboxes/msb_maria10_6_12/my sqladmin var
---------------------------------------------------------------

/root/sandboxes/msb_oracle8_0_33/my sql -e '\s'
--------------
/root/opt/mysql/oracle8.0.33/bin/mysql  Ver 8.0.33 for Linux on x86_64 (MySQL Community Server - GPL)

Connection id:          10
Current database:
Current user:           msandbox@localhost
SSL:                    Not in use
Current pager:          stdout
Using outfile:          ''
Using delimiter:        ;
Server version:         8.0.33 MySQL Community Server - GPL
Protocol version:       10
Connection:             Localhost via UNIX socket
Server characterset:    utf8mb4
Db     characterset:    utf8mb4
Client characterset:    utf8mb4
Conn.  characterset:    utf8mb4
UNIX socket:            /root/sandboxes/msb_oracle8_0_33/data/mysql_sandbox8033.sock
Uptime:                 1 min 11 sec

Threads: 2  Questions: 47  Slow queries: 0  Opens: 149  Flush tables: 3  Open tables: 65  Queries per second avg: 0.661
--------------

saving msb_oracle8_0_33 variables to /home/dbdeployer/msb_oracle8_0_33-variables.txt
/root/sandboxes/msb_oracle8_0_33/my sqladmin var
---------------------------------------------------------------
```

# Delete Sandboxes Only

```
./dbdeployer.sh delete-sandboxes

delete sandboxes only

dbdeployer delete all
List of deployed sandboxes:
/root/sandboxes/msb_maria10_3_38 
/root/sandboxes/msb_maria10_4_28 
/root/sandboxes/msb_maria10_5_19 
/root/sandboxes/msb_maria10_6_12 
/root/sandboxes/msb_oracle8_0_33 
Do you confirm? y/[N] Proceeding with deletion
Running /root/sandboxes/msb_maria10_3_38/send_kill destroy
Terminating the server immediately --- kill -9 1440879
Running rm -rf /root/sandboxes/msb_maria10_3_38
Directory /root/sandboxes/msb_maria10_3_38 deleted
Running /root/sandboxes/msb_maria10_4_28/send_kill destroy
Terminating the server immediately --- kill -9 1441128
Running rm -rf /root/sandboxes/msb_maria10_4_28
Directory /root/sandboxes/msb_maria10_4_28 deleted
Running /root/sandboxes/msb_maria10_5_19/send_kill destroy
Terminating the server immediately --- kill -9 1441361
Running rm -rf /root/sandboxes/msb_maria10_5_19
Directory /root/sandboxes/msb_maria10_5_19 deleted
Running /root/sandboxes/msb_maria10_6_12/send_kill destroy
Terminating the server immediately --- kill -9 1441576
Running rm -rf /root/sandboxes/msb_maria10_6_12
Directory /root/sandboxes/msb_maria10_6_12 deleted
Running /root/sandboxes/msb_oracle8_0_33/send_kill destroy
Terminating the server immediately --- kill -9 1441886
Running rm -rf /root/sandboxes/msb_oracle8_0_33
Directory /root/sandboxes/msb_oracle8_0_33 deleted
```

# Reset Binaries Only

Delete only installed binaries

```
./dbdeployer.sh reset-binary

resetting bins


dbdeployer delete-binaries maria10.3.38
Do you want to delete maria10.3.38? y/[N] Proceeding with deletion
Directory maria10.3.38 removed

dbdeployer delete-binaries maria10.4.28
Do you want to delete maria10.4.28? y/[N] Proceeding with deletion
Directory maria10.4.28 removed

dbdeployer delete-binaries maria10.5.19
Do you want to delete maria10.5.19? y/[N] Proceeding with deletion
Directory maria10.5.19 removed

dbdeployer delete-binaries maria10.6.12
Do you want to delete maria10.6.12? y/[N] Proceeding with deletion
Directory maria10.6.12 removed

dbdeployer delete-binaries oracle8.0.33
Do you want to delete oracle8.0.33? y/[N] Proceeding with deletion
Directory oracle8.0.33 removed

dbdeployer delete-binaries ps8.0.32
Do you want to delete ps8.0.32? y/[N] Proceeding with deletion
Directory ps8.0.32 removed
```