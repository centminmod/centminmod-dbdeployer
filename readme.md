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

# Deploy Single Sandbox Instances

```
./dbdeployer.sh install-sandboxes
dbdeployer deploy single sandboxes

creating maria10.1.40 single sandbox instance
dbdeployer deploy single maria10.1.40
Database installed in $HOME/sandboxes/msb_maria10_1_40
run 'dbdeployer usage single' for basic instructions'
. sandbox server started

creating maria10.2.24 single sandbox instance
dbdeployer deploy single maria10.2.24
Database installed in $HOME/sandboxes/msb_maria10_2_24
run 'dbdeployer usage single' for basic instructions'
. sandbox server started

creating maria10.3.15 single sandbox instance
dbdeployer deploy single maria10.3.15
Database installed in $HOME/sandboxes/msb_maria10_3_15
run 'dbdeployer usage single' for basic instructions'
. sandbox server started

creating maria10.4.5 single sandbox instance
dbdeployer deploy single maria10.4.5
Database installed in $HOME/sandboxes/msb_maria10_4_5
run 'dbdeployer usage single' for basic instructions'
. sandbox server started

creating oracle5.7.26 single sandbox instance
dbdeployer deploy single oracle5.7.26
Database installed in $HOME/sandboxes/msb_oracle5_7_26
run 'dbdeployer usage single' for basic instructions'
. sandbox server started

creating oracle8.0.16 single sandbox instance
dbdeployer deploy single oracle8.0.16
Database installed in $HOME/sandboxes/msb_oracle8_0_16
run 'dbdeployer usage single' for basic instructions'
............... sandbox server started

creating ps5.7.26 single sandbox instance
dbdeployer deploy single ps5.7.26
Database installed in $HOME/sandboxes/msb_ps5_7_26
run 'dbdeployer usage single' for basic instructions'
... sandbox server started

creating ps8.0.15 single sandbox instance
dbdeployer deploy single ps8.0.15
Database installed in $HOME/sandboxes/msb_ps8_0_15
run 'dbdeployer usage single' for basic instructions'
............. sandbox server started

dbdeployer sandboxes
 msb_maria10_1_40         :   single   maria10.1.40   [10140 ]      
 msb_maria10_2_24         :   single   maria10.2.24   [10224 ]      
 msb_maria10_3_15         :   single   maria10.3.15   [10315 ]      
 msb_maria10_4_5          :   single   maria10.4.5    [10405 ]      
 msb_oracle5_7_26         :   single   oracle5.7.26   [5726 ]       
 msb_oracle8_0_16         :   single   oracle8.0.16   [8016 18016 ] 
 msb_ps5_7_26             :   single   ps5.7.26       [5727 ]       
 msb_ps8_0_15             :   single   ps8.0.15       [8015 18015 ] 
```

# Check

```
./dbdeployer.sh check                   

---------------------------------------------------------------
dbdeployer installed binaries
---------------------------------------------------------------
dbdeployer info version --flavor percona 8.0 = ps8.0.15
dbdeployer info version --flavor percona 5.7 = ps5.7.26
dbdeployer info version --flavor mariadb 10.4 = maria10.4.5
dbdeployer info version --flavor mariadb 10.3 = maria10.3.15
dbdeployer info version --flavor mariadb 10.2 = maria10.2.24
dbdeployer info version --flavor mariadb 10.1 = maria10.1.40
dbdeployer info version --flavor mysql 8.0 = oracle8.0.16
dbdeployer info version --flavor mysql 5.7 = oracle5.7.26

---------------------------------------------------------------
dbdeployer sandboxes
---------------------------------------------------------------
 msb_maria10_1_40         :   single   maria10.1.40   [10140 ]      
 msb_maria10_2_24         :   single   maria10.2.24   [10224 ]      
 msb_maria10_3_15         :   single   maria10.3.15   [10315 ]      
 msb_maria10_4_5          :   single   maria10.4.5    [10405 ]      
 msb_oracle5_7_26         :   single   oracle5.7.26   [5726 ]       
 msb_oracle8_0_16         :   single   oracle8.0.16   [8016 18016 ] 
 msb_ps5_7_26             :   single   ps5.7.26       [5727 ]       
 msb_ps8_0_15             :   single   ps8.0.15       [8015 18015 ] 

---------------------------------------------------------------
sandbox info
---------------------------------------------------------------

/root/sandboxes/msb_maria10_1_40/my sql -e '\s'
--------------
/root/opt/mysql/maria10.1.40/bin/mysql  Ver 15.1 Distrib 10.1.40-MariaDB, for Linux (x86_64) using readline 5.1

Connection id:          21
Current database:
Current user:           msandbox@localhost
SSL:                    Not in use
Current pager:          stdout
Using outfile:          ''
Using delimiter:        ;
Server:                 MariaDB
Server version:         10.1.40-MariaDB MariaDB Server
Protocol version:       10
Connection:             Localhost via UNIX socket
Server characterset:    latin1
Db     characterset:    latin1
Client characterset:    utf8
Conn.  characterset:    utf8
UNIX socket:            /tmp/mysql_sandbox10140.sock
Uptime:                 13 hours 35 min 40 sec

Threads: 1  Questions: 63  Slow queries: 0  Opens: 17  Flush tables: 1  Open tables: 11  Queries per second avg: 0.001
--------------

saving msb_maria10_1_40 variables to /home/dbdeployer/msb_maria10_1_40-variables.txt
/root/sandboxes/msb_maria10_1_40/my sqladmin var
---------------------------------------------------------------

/root/sandboxes/msb_maria10_2_24/my sql -e '\s'
--------------
/root/opt/mysql/maria10.2.24/bin/mysql  Ver 15.1 Distrib 10.2.24-MariaDB, for Linux (x86_64) using readline 5.1

Connection id:          18
Current database:
Current user:           msandbox@localhost
SSL:                    Not in use
Current pager:          stdout
Using outfile:          ''
Using delimiter:        ;
Server:                 MariaDB
Server version:         10.2.24-MariaDB MariaDB Server
Protocol version:       10
Connection:             Localhost via UNIX socket
Server characterset:    latin1
Db     characterset:    latin1
Client characterset:    utf8
Conn.  characterset:    utf8
UNIX socket:            /tmp/mysql_sandbox10224.sock
Uptime:                 13 hours 35 min 37 sec

Threads: 7  Questions: 43  Slow queries: 0  Opens: 17  Flush tables: 1  Open tables: 11  Queries per second avg: 0.000
--------------

saving msb_maria10_2_24 variables to /home/dbdeployer/msb_maria10_2_24-variables.txt
/root/sandboxes/msb_maria10_2_24/my sqladmin var
---------------------------------------------------------------

/root/sandboxes/msb_maria10_3_15/my sql -e '\s'
--------------
/root/opt/mysql/maria10.3.15/bin/mysql  Ver 15.1 Distrib 10.3.15-MariaDB, for Linux (x86_64) using readline 5.1

Connection id:          18
Current database:
Current user:           msandbox@localhost
SSL:                    Not in use
Current pager:          stdout
Using outfile:          ''
Using delimiter:        ;
Server:                 MariaDB
Server version:         10.3.15-MariaDB MariaDB Server
Protocol version:       10
Connection:             Localhost via UNIX socket
Server characterset:    latin1
Db     characterset:    latin1
Client characterset:    utf8
Conn.  characterset:    utf8
UNIX socket:            /tmp/mysql_sandbox10315.sock
Uptime:                 13 hours 35 min 35 sec

Threads: 7  Questions: 43  Slow queries: 0  Opens: 17  Flush tables: 1  Open tables: 11  Queries per second avg: 0.000
--------------

saving msb_maria10_3_15 variables to /home/dbdeployer/msb_maria10_3_15-variables.txt
/root/sandboxes/msb_maria10_3_15/my sqladmin var
---------------------------------------------------------------

/root/sandboxes/msb_maria10_4_5/my sql -e '\s'
--------------
/root/opt/mysql/maria10.4.5/bin/mysql  Ver 15.1 Distrib 10.4.5-MariaDB, for Linux (x86_64) using readline 5.1

Connection id:          18
Current database:
Current user:           msandbox@localhost
SSL:                    Not in use
Current pager:          stdout
Using outfile:          ''
Using delimiter:        ;
Server:                 MariaDB
Server version:         10.4.5-MariaDB MariaDB Server
Protocol version:       10
Connection:             Localhost via UNIX socket
Server characterset:    latin1
Db     characterset:    latin1
Client characterset:    utf8
Conn.  characterset:    utf8
UNIX socket:            /tmp/mysql_sandbox10405.sock
Uptime:                 13 hours 35 min 31 sec

Threads: 7  Questions: 43  Slow queries: 0  Opens: 19  Flush tables: 1  Open tables: 13  Queries per second avg: 0.000
--------------

saving msb_maria10_4_5 variables to /home/dbdeployer/msb_maria10_4_5-variables.txt
/root/sandboxes/msb_maria10_4_5/my sqladmin var
---------------------------------------------------------------

/root/sandboxes/msb_oracle5_7_26/my sql -e '\s'
--------------
/root/opt/mysql/oracle5.7.26/bin/mysql  Ver 14.14 Distrib 5.7.26, for linux-glibc2.12 (x86_64) using  EditLine wrapper

Connection id:          19
Current database:
Current user:           msandbox@localhost
SSL:                    Not in use
Current pager:          stdout
Using outfile:          ''
Using delimiter:        ;
Server version:         5.7.26 MySQL Community Server (GPL)
Protocol version:       10
Connection:             Localhost via UNIX socket
Server characterset:    latin1
Db     characterset:    latin1
Client characterset:    utf8
Conn.  characterset:    utf8
UNIX socket:            /tmp/mysql_sandbox5726.sock
Uptime:                 13 hours 35 min 27 sec

Threads: 1  Questions: 69  Slow queries: 0  Opens: 120  Flush tables: 1  Open tables: 113  Queries per second avg: 0.001
--------------

saving msb_oracle5_7_26 variables to /home/dbdeployer/msb_oracle5_7_26-variables.txt
/root/sandboxes/msb_oracle5_7_26/my sqladmin var
---------------------------------------------------------------

/root/sandboxes/msb_oracle8_0_16/my sql -e '\s'
--------------
/root/opt/mysql/oracle8.0.16/bin/mysql  Ver 8.0.16 for linux-glibc2.12 on x86_64 (MySQL Community Server - GPL)

Connection id:          18
Current database:
Current user:           msandbox@localhost
SSL:                    Not in use
Current pager:          stdout
Using outfile:          ''
Using delimiter:        ;
Server version:         8.0.16 MySQL Community Server - GPL
Protocol version:       10
Connection:             Localhost via UNIX socket
Server characterset:    utf8mb4
Db     characterset:    utf8mb4
Client characterset:    utf8mb4
Conn.  characterset:    utf8mb4
UNIX socket:            /tmp/mysql_sandbox8016.sock
Uptime:                 13 hours 35 min 21 sec

Threads: 2  Questions: 71  Slow queries: 0  Opens: 164  Flush tables: 3  Open tables: 65  Queries per second avg: 0.001
--------------

saving msb_oracle8_0_16 variables to /home/dbdeployer/msb_oracle8_0_16-variables.txt
/root/sandboxes/msb_oracle8_0_16/my sqladmin var
---------------------------------------------------------------

/root/sandboxes/msb_ps5_7_26/my sql -e '\s'
--------------
/root/opt/mysql/ps5.7.26/bin/mysql  Ver 14.14 Distrib 5.7.26-29, for Linux (x86_64) using  6.2

Connection id:          12
Current database:
Current user:           msandbox@localhost
SSL:                    Not in use
Current pager:          stdout
Using outfile:          ''
Using delimiter:        ;
Server version:         5.7.26-29 Percona Server (GPL), Release 29, Revision 11ad961
Protocol version:       10
Connection:             Localhost via UNIX socket
Server characterset:    latin1
Db     characterset:    latin1
Client characterset:    utf8
Conn.  characterset:    utf8
UNIX socket:            /tmp/mysql_sandbox5727.sock
Uptime:                 13 hours 34 min 52 sec

Threads: 1  Questions: 55  Slow queries: 0  Opens: 114  Flush tables: 1  Open tables: 107  Queries per second avg: 0.001
--------------

saving msb_ps5_7_26 variables to /home/dbdeployer/msb_ps5_7_26-variables.txt
/root/sandboxes/msb_ps5_7_26/my sqladmin var
---------------------------------------------------------------

/root/sandboxes/msb_ps8_0_15/my sql -e '\s'
--------------
/root/opt/mysql/ps8.0.15/bin/mysql  Ver 8.0.15-6 for Linux on x86_64 (Percona Server (GPL), Release 6, Revision 63abd08)

Connection id:          18
Current database:
Current user:           msandbox@localhost
SSL:                    Not in use
Current pager:          stdout
Using outfile:          ''
Using delimiter:        ;
Server version:         8.0.15-6 Percona Server (GPL), Release 6, Revision 63abd08
Protocol version:       10
Connection:             Localhost via UNIX socket
Server characterset:    utf8mb4
Db     characterset:    utf8mb4
Client characterset:    utf8mb4
Conn.  characterset:    utf8mb4
UNIX socket:            /tmp/mysql_sandbox8015.sock
Uptime:                 13 hours 34 min 17 sec

Threads: 2  Questions: 71  Slow queries: 0  Opens: 142  Flush tables: 2  Open tables: 118  Queries per second avg: 0.001
--------------

saving msb_ps8_0_15 variables to /home/dbdeployer/msb_ps8_0_15-variables.txt
/root/sandboxes/msb_ps8_0_15/my sqladmin var
---------------------------------------------------------------
```