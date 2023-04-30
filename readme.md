# dbdeployer for centminmod.com

[dbdeployer](https://github.com/datacharmer/dbdeployer) wrapper script for [centminmod.com LEMP stack](https://centminmod.com) environments on CentOS 7.x/AlmaLinux 8 64bit OSes.

# Content

* [Usage](#usage)
  * [for dbdeployer.sh](#for-dbdeployersh)
  * [for dbdeployer binary](#for-dbdeployer-binary)
* [Install](#install)
* [Reset](#reset)
* [Deploy Single Sandbox Instances](#deploy-single-sandbox-instances)
  * [Example with binary logging disabled](#example-with-binary-logging-disabled)
  * [Example with binary logging enabled](#example-with-binary-logging-enabled)
* [Check](#check)
  * [Check Variables](#check-variables)
* [Delete Sandboxes Only](#delete-sandboxes-only)
* [Reset Binaries Only](#reset-binaries-only)

# Usage

## for dbdeployer.sh

```
./dbdeployer.sh 

usage:

./dbdeployer.sh install-all-sandboxes
./dbdeployer.sh install-all-sandboxes binlogs
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

Install sandbox singles for Oracle MySQL 8.0, MariaDB 10.3 to 10.6 and Percona 8.0.

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
        "timestamp": "Sun Apr 30 05:08:59 EDT 2023"
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
Unpacking tarball mariadb-10.11.2-linux-systemd-x86_64.tar.gz to $HOME/opt/mysql/maria10.11.2
Renaming directory /root/opt/mysql/mariadb-10.11.2-linux-systemd-x86_64 to /root/opt/mysql/maria10.11.2
Unpacking tarball mariadb-10.6.12-linux-systemd-x86_64.tar.gz to $HOME/opt/mysql/maria10.6.12
Renaming directory /root/opt/mysql/mariadb-10.6.12-linux-systemd-x86_64 to /root/opt/mysql/maria10.6.12
Unpacking tarball mariadb-10.4.28-linux-systemd-x86_64.tar.gz to $HOME/opt/mysql/maria10.4.28
Renaming directory /root/opt/mysql/mariadb-10.4.28-linux-systemd-x86_64 to /root/opt/mysql/maria10.4.28
Unpacking tarball mariadb-10.3.38-linux-systemd-x86_64.tar.gz to $HOME/opt/mysql/maria10.3.38
Renaming directory /root/opt/mysql/mariadb-10.3.38-linux-systemd-x86_64 to /root/opt/mysql/maria10.3.38
dbdeployer versions
Basedir: /root/opt/mysql
maria10.11.2  maria10.3.38  maria10.4.28  maria10.6.12  ps8.0.32      

installing Oracle MySQL binary tarballs
Unpacking tarball mysql-8.0.33-linux-glibc2.28-x86_64.tar.gz to $HOME/opt/mysql/oracle8.0.33
Renaming directory /root/opt/mysql/mysql-8.0.33-linux-glibc2.28-x86_64 to /root/opt/mysql/oracle8.0.33
dbdeployer versions
Basedir: /root/opt/mysql
maria10.11.2  maria10.3.38  maria10.4.28  maria10.6.12  oracle8.0.33  ps8.0.32      


installing Oracle MySQL Shell
8.0.33
Merging shell tarball mysql-shell-8.0.33-linux-glibc2.12-x86-64bit.tar.gz to $HOME/opt/mysql/oracle8.0.33

---------------------------------------------------------------
dbdeployer installed binaries
---------------------------------------------------------------
dbdeployer info version --flavor percona 8.0 = ps8.0.32

dbdeployer info version --flavor mariadb 10.11 = maria10.11.2

dbdeployer info version --flavor mariadb 10.6 = maria10.6.12
dbdeployer info version --flavor mariadb 10.4 = maria10.4.28
dbdeployer info version --flavor mariadb 10.3 = maria10.3.38
dbdeployer info version --flavor mysql 8.0 = oracle8.0.33
```

# Reset

Delete and remove all dbdeployer sandboxes and binaries for a fresh start.

```
./dbdeployer.sh reset
```

# Deploy Single Sandbox Instances

```
./dbdeployer.sh install-sandboxes
```
or with binary logs enabled

```
./dbdeployer.sh install-sandboxes binlogs
```

Example with binary logging disabled

```
./dbdeployer.sh install-sandboxes
dbdeployer deploy single sandboxes

creating maria10.11.2 single sandbox instance
dbdeployer deploy single maria10.11.2 --skip-library-check --socket-in-datadir --init-options '--auth-root-authentication-method=normal' --my-cnf-options=innodb_file_per_table=1 --my-cnf-options=innodb_flush_log_at_trx_commit=2 --my-cnf-options=optimizer_use_condition_selectivity=1
Database installed in $HOME/sandboxes/msb_maria10_11_2
run 'dbdeployer usage single' for basic instructions'
. sandbox server started

creating maria10.3.38 single sandbox instance
dbdeployer deploy single maria10.3.38 --skip-library-check --socket-in-datadir --init-options '--auth-root-authentication-method=normal' --my-cnf-options=innodb_file_per_table=1 --my-cnf-options=innodb_flush_log_at_trx_commit=2 --my-cnf-options=optimizer_use_condition_selectivity=1
Database installed in $HOME/sandboxes/msb_maria10_3_38
run 'dbdeployer usage single' for basic instructions'
. sandbox server started

creating maria10.4.28 single sandbox instance
dbdeployer deploy single maria10.4.28 --skip-library-check --socket-in-datadir --init-options '--auth-root-authentication-method=normal' --my-cnf-options=innodb_file_per_table=1 --my-cnf-options=innodb_flush_log_at_trx_commit=2 --my-cnf-options=optimizer_use_condition_selectivity=1
Database installed in $HOME/sandboxes/msb_maria10_4_28
run 'dbdeployer usage single' for basic instructions'
. sandbox server started

creating maria10.6.12 single sandbox instance
dbdeployer deploy single maria10.6.12 --skip-library-check --socket-in-datadir --init-options '--auth-root-authentication-method=normal' --my-cnf-options=innodb_file_per_table=1 --my-cnf-options=innodb_flush_log_at_trx_commit=2 --my-cnf-options=optimizer_use_condition_selectivity=1
Database installed in $HOME/sandboxes/msb_maria10_6_12
run 'dbdeployer usage single' for basic instructions'
. sandbox server started

creating oracle8.0.33 single sandbox instance
dbdeployer deploy single oracle8.0.33 --skip-library-check --socket-in-datadir --my-cnf-options=innodb_file_per_table=1 --my-cnf-options=innodb_flush_log_at_trx_commit=2
Database installed in $HOME/sandboxes/msb_oracle8_0_33
run 'dbdeployer usage single' for basic instructions'
. sandbox server started

creating ps8.0.32 single sandbox instance
dbdeployer deploy single ps8.0.32 --skip-library-check --socket-in-datadir --my-cnf-options=innodb_file_per_table=1 --my-cnf-options=innodb_flush_log_at_trx_commit=2
error creating sandbox: 'check directory directory /root/sandboxes/msb_ps8_0_32 already exists. Use --force to override'

dbdeployer sandboxes
 msb_maria10_11_2         :   single   maria10.11.2   [41102 ]      
 msb_maria10_3_38         :   single   maria10.3.38   [10338 ]      
 msb_maria10_4_28         :   single   maria10.4.28   [10428 ]      
 msb_maria10_6_12         :   single   maria10.6.12   [10612 ]      
 msb_oracle8_0_33         :   single   oracle8.0.33   [8033 18033 ] 

sandbox info

/root/sandboxes/msb_maria10_11_2/my.sandbox.cnf

[mysql]
prompt='mysql [\h:41102] {\u} (\d) > '
[client]
user               = msandbox
password           = msandbox
port               = 41102
socket             = /root/sandboxes/msb_maria10_11_2/data/mysql_sandbox41102.sock
[mysqld]
user               = root
port               = 41102
socket             = /root/sandboxes/msb_maria10_11_2/data/mysql_sandbox41102.sock
basedir            = /root/opt/mysql/maria10.11.2
datadir            = /root/sandboxes/msb_maria10_11_2/data
tmpdir             = /root/sandboxes/msb_maria10_11_2/tmp
pid-file           = /root/sandboxes/msb_maria10_11_2/data/mysql_sandbox41102.pid
bind-address       = 127.0.0.1
report-host=single-41102
report-port=41102
log-error=/root/sandboxes/msb_maria10_11_2/data/msandbox.err
innodb_file_per_table=1
innodb_flush_log_at_trx_commit=2
optimizer_use_condition_selectivity=1

/root/sandboxes/msb_maria10_11_2/my sql -e '\s'
--------------
/root/opt/mysql/maria10.11.2/bin/mysql  Ver 15.1 Distrib 10.11.2-MariaDB, for linux-systemd (x86_64) using readline 5.1

Connection id:          4
Current database:
Current user:           msandbox@localhost
SSL:                    Not in use
Current pager:          stdout
Using outfile:          ''
Using delimiter:        ;
Server:                 MariaDB
Server version:         10.11.2-MariaDB MariaDB Server
Protocol version:       10
Connection:             Localhost via UNIX socket
Server characterset:    latin1
Db     characterset:    latin1
Client characterset:    utf8mb3
Conn.  characterset:    utf8mb3
UNIX socket:            /root/sandboxes/msb_maria10_11_2/data/mysql_sandbox41102.sock
Uptime:                 13 sec

Threads: 1  Questions: 20  Slow queries: 0  Opens: 20  Open tables: 13  Queries per second avg: 1.538
--------------


/root/sandboxes/msb_maria10_3_38/my.sandbox.cnf

[mysql]
prompt='mysql [\h:10338] {\u} (\d) > '
[client]
user               = msandbox
password           = msandbox
port               = 10338
socket             = /root/sandboxes/msb_maria10_3_38/data/mysql_sandbox10338.sock
[mysqld]
user               = root
port               = 10338
socket             = /root/sandboxes/msb_maria10_3_38/data/mysql_sandbox10338.sock
basedir            = /root/opt/mysql/maria10.3.38
datadir            = /root/sandboxes/msb_maria10_3_38/data
tmpdir             = /root/sandboxes/msb_maria10_3_38/tmp
pid-file           = /root/sandboxes/msb_maria10_3_38/data/mysql_sandbox10338.pid
bind-address       = 127.0.0.1
report-host=single-10338
report-port=10338
log-error=/root/sandboxes/msb_maria10_3_38/data/msandbox.err
innodb_file_per_table=1
innodb_flush_log_at_trx_commit=2
optimizer_use_condition_selectivity=1

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
Uptime:                 10 sec

Threads: 6  Questions: 20  Slow queries: 0  Opens: 18  Flush tables: 1  Open tables: 11  Queries per second avg: 2.000
--------------


/root/sandboxes/msb_maria10_4_28/my.sandbox.cnf

[mysql]
prompt='mysql [\h:10428] {\u} (\d) > '
[client]
user               = msandbox
password           = msandbox
port               = 10428
socket             = /root/sandboxes/msb_maria10_4_28/data/mysql_sandbox10428.sock
[mysqld]
user               = root
port               = 10428
socket             = /root/sandboxes/msb_maria10_4_28/data/mysql_sandbox10428.sock
basedir            = /root/opt/mysql/maria10.4.28
datadir            = /root/sandboxes/msb_maria10_4_28/data
tmpdir             = /root/sandboxes/msb_maria10_4_28/tmp
pid-file           = /root/sandboxes/msb_maria10_4_28/data/mysql_sandbox10428.pid
bind-address       = 127.0.0.1
report-host=single-10428
report-port=10428
log-error=/root/sandboxes/msb_maria10_4_28/data/msandbox.err
innodb_file_per_table=1
innodb_flush_log_at_trx_commit=2
optimizer_use_condition_selectivity=1

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
Uptime:                 7 sec

Threads: 6  Questions: 20  Slow queries: 0  Opens: 20  Flush tables: 1  Open tables: 13  Queries per second avg: 2.857
--------------


/root/sandboxes/msb_maria10_6_12/my.sandbox.cnf

[mysql]
prompt='mysql [\h:10612] {\u} (\d) > '
[client]
user               = msandbox
password           = msandbox
port               = 10612
socket             = /root/sandboxes/msb_maria10_6_12/data/mysql_sandbox10612.sock
[mysqld]
user               = root
port               = 10612
socket             = /root/sandboxes/msb_maria10_6_12/data/mysql_sandbox10612.sock
basedir            = /root/opt/mysql/maria10.6.12
datadir            = /root/sandboxes/msb_maria10_6_12/data
tmpdir             = /root/sandboxes/msb_maria10_6_12/tmp
pid-file           = /root/sandboxes/msb_maria10_6_12/data/mysql_sandbox10612.pid
bind-address       = 127.0.0.1
report-host=single-10612
report-port=10612
log-error=/root/sandboxes/msb_maria10_6_12/data/msandbox.err
innodb_file_per_table=1
innodb_flush_log_at_trx_commit=2
optimizer_use_condition_selectivity=1

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


/root/sandboxes/msb_oracle8_0_33/my.sandbox.cnf

[mysql]
prompt='mysql [\h:8033] {\u} (\d) > '
[client]
user               = msandbox
password           = msandbox
port               = 8033
socket             = /root/sandboxes/msb_oracle8_0_33/data/mysql_sandbox8033.sock
[mysqld]
user               = root
port               = 8033
socket             = /root/sandboxes/msb_oracle8_0_33/data/mysql_sandbox8033.sock
basedir            = /root/opt/mysql/oracle8.0.33
datadir            = /root/sandboxes/msb_oracle8_0_33/data
tmpdir             = /root/sandboxes/msb_oracle8_0_33/tmp
pid-file           = /root/sandboxes/msb_oracle8_0_33/data/mysql_sandbox8033.pid
bind-address       = 127.0.0.1
report-host=single-8033
report-port=8033
log-error=/root/sandboxes/msb_oracle8_0_33/data/msandbox.err
innodb_file_per_table=1
innodb_flush_log_at_trx_commit=2
mysqlx-port=18033
mysqlx-socket=/root/sandboxes/msb_oracle8_0_33/data/mysqlx-18033.sock

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
Uptime:                 1 sec

Threads: 2  Questions: 42  Slow queries: 0  Opens: 149  Flush tables: 3  Open tables: 65  Queries per second avg: 42.000
--------------
```

## Example with binary logging enabled

```
./dbdeployer.sh install-sandboxes binlogs
dbdeployer deploy single sandboxes

creating maria10.11.2 single sandbox instance
dbdeployer deploy single maria10.11.2 --skip-library-check --socket-in-datadir --init-options '--auth-root-authentication-method=normal' --my-cnf-options=log-bin=mysql-bin --my-cnf-options=max_binlog_size=500M --my-cnf-options=binlog_file_cache_size=131072 --my-cnf-options=binlog_cache_size=131072 --my-cnf-options=binlog_stmt_cache_size=131072 --my-cnf-options=binlog-commit-wait-count=100 --my-cnf-options=binlog_commit_wait_usec=100000 --my-cnf-options=expire_logs_days=7 --my-cnf-options=binlog-format=row --my-cnf-options=sync-binlog=1 --my-cnf-options=innodb_file_per_table=1 --my-cnf-options=innodb_flush_log_at_trx_commit=2 --my-cnf-options=optimizer_use_condition_selectivity=1
Database installed in $HOME/sandboxes/msb_maria10_11_2
run 'dbdeployer usage single' for basic instructions'
. sandbox server started

creating maria10.3.38 single sandbox instance
dbdeployer deploy single maria10.3.38 --skip-library-check --socket-in-datadir --init-options '--auth-root-authentication-method=normal' --my-cnf-options=log-bin=mysql-bin --my-cnf-options=max_binlog_size=500M --my-cnf-options=binlog_file_cache_size=131072 --my-cnf-options=binlog_cache_size=131072 --my-cnf-options=binlog_stmt_cache_size=131072 --my-cnf-options=binlog-commit-wait-count=100 --my-cnf-options=binlog_commit_wait_usec=100000 --my-cnf-options=expire_logs_days=7 --my-cnf-options=binlog-format=row --my-cnf-options=sync-binlog=1 --my-cnf-options=innodb_file_per_table=1 --my-cnf-options=innodb_flush_log_at_trx_commit=2 --my-cnf-options=optimizer_use_condition_selectivity=1
Database installed in $HOME/sandboxes/msb_maria10_3_38
run 'dbdeployer usage single' for basic instructions'
. sandbox server started

creating maria10.4.28 single sandbox instance
dbdeployer deploy single maria10.4.28 --skip-library-check --socket-in-datadir --init-options '--auth-root-authentication-method=normal' --my-cnf-options=log-bin=mysql-bin --my-cnf-options=max_binlog_size=500M --my-cnf-options=binlog_file_cache_size=131072 --my-cnf-options=binlog_cache_size=131072 --my-cnf-options=binlog_stmt_cache_size=131072 --my-cnf-options=binlog-commit-wait-count=100 --my-cnf-options=binlog_commit_wait_usec=100000 --my-cnf-options=expire_logs_days=7 --my-cnf-options=binlog-format=row --my-cnf-options=sync-binlog=1 --my-cnf-options=innodb_file_per_table=1 --my-cnf-options=innodb_flush_log_at_trx_commit=2 --my-cnf-options=optimizer_use_condition_selectivity=1
Database installed in $HOME/sandboxes/msb_maria10_4_28
run 'dbdeployer usage single' for basic instructions'
. sandbox server started

creating maria10.6.12 single sandbox instance
dbdeployer deploy single maria10.6.12 --skip-library-check --socket-in-datadir --init-options '--auth-root-authentication-method=normal' --my-cnf-options=log-bin=mysql-bin --my-cnf-options=max_binlog_size=500M --my-cnf-options=binlog_file_cache_size=131072 --my-cnf-options=binlog_cache_size=131072 --my-cnf-options=binlog_stmt_cache_size=131072 --my-cnf-options=binlog-commit-wait-count=100 --my-cnf-options=binlog_commit_wait_usec=100000 --my-cnf-options=expire_logs_days=7 --my-cnf-options=binlog-format=row --my-cnf-options=sync-binlog=1 --my-cnf-options=innodb_file_per_table=1 --my-cnf-options=innodb_flush_log_at_trx_commit=2 --my-cnf-options=optimizer_use_condition_selectivity=1
Database installed in $HOME/sandboxes/msb_maria10_6_12
run 'dbdeployer usage single' for basic instructions'
. sandbox server started

creating oracle8.0.33 single sandbox instance
dbdeployer deploy single oracle8.0.33 --skip-library-check --socket-in-datadir --my-cnf-options=log-bin=mysql-bin --my-cnf-options=max_binlog_size=500M --my-cnf-options=binlog_cache_size=131072 --my-cnf-options=binlog_stmt_cache_size=131072 --my-cnf-options=expire_logs_days=7 --my-cnf-options=binlog-format=row --my-cnf-options=sync-binlog=1 --my-cnf-options=innodb_file_per_table=1 --my-cnf-options=innodb_flush_log_at_trx_commit=2
Database installed in $HOME/sandboxes/msb_oracle8_0_33
run 'dbdeployer usage single' for basic instructions'
. sandbox server started

creating ps8.0.32 single sandbox instance
dbdeployer deploy single ps8.0.32 --skip-library-check --socket-in-datadir --my-cnf-options=log-bin=mysql-bin --my-cnf-options=max_binlog_size=500M --my-cnf-options=binlog_cache_size=131072 --my-cnf-options=binlog_stmt_cache_size=131072 --my-cnf-options=expire_logs_days=7 --my-cnf-options=binlog-format=row --my-cnf-options=sync-binlog=1 --my-cnf-options=innodb_file_per_table=1 --my-cnf-options=innodb_flush_log_at_trx_commit=2
error creating sandbox: 'check directory directory /root/sandboxes/msb_ps8_0_32 already exists. Use --force to override'

dbdeployer sandboxes
 msb_maria10_11_2         :   single   maria10.11.2   [41102 ]      
 msb_maria10_3_38         :   single   maria10.3.38   [10338 ]      
 msb_maria10_4_28         :   single   maria10.4.28   [10428 ]      
 msb_maria10_6_12         :   single   maria10.6.12   [10612 ]      
 msb_oracle8_0_33         :   single   oracle8.0.33   [8033 18033 ] 

sandbox info

/root/sandboxes/msb_maria10_11_2/my.sandbox.cnf

[mysql]
prompt='mysql [\h:41102] {\u} (\d) > '
[client]
user               = msandbox
password           = msandbox
port               = 41102
socket             = /root/sandboxes/msb_maria10_11_2/data/mysql_sandbox41102.sock
[mysqld]
user               = root
port               = 41102
socket             = /root/sandboxes/msb_maria10_11_2/data/mysql_sandbox41102.sock
basedir            = /root/opt/mysql/maria10.11.2
datadir            = /root/sandboxes/msb_maria10_11_2/data
tmpdir             = /root/sandboxes/msb_maria10_11_2/tmp
pid-file           = /root/sandboxes/msb_maria10_11_2/data/mysql_sandbox41102.pid
bind-address       = 127.0.0.1
report-host=single-41102
report-port=41102
log-error=/root/sandboxes/msb_maria10_11_2/data/msandbox.err
log-bin=mysql-bin
max_binlog_size=500M
binlog_file_cache_size=131072
binlog_cache_size=131072
binlog_stmt_cache_size=131072
binlog-commit-wait-count=100
binlog_commit_wait_usec=100000
expire_logs_days=7
binlog-format=row
sync-binlog=1
innodb_file_per_table=1
innodb_flush_log_at_trx_commit=2
optimizer_use_condition_selectivity=1

/root/sandboxes/msb_maria10_11_2/my sql -e '\s'
--------------
/root/opt/mysql/maria10.11.2/bin/mysql  Ver 15.1 Distrib 10.11.2-MariaDB, for linux-systemd (x86_64) using readline 5.1

Connection id:          5
Current database:
Current user:           msandbox@localhost
SSL:                    Not in use
Current pager:          stdout
Using outfile:          ''
Using delimiter:        ;
Server:                 MariaDB
Server version:         10.11.2-MariaDB-log MariaDB Server
Protocol version:       10
Connection:             Localhost via UNIX socket
Server characterset:    latin1
Db     characterset:    latin1
Client characterset:    utf8mb3
Conn.  characterset:    utf8mb3
UNIX socket:            /root/sandboxes/msb_maria10_11_2/data/mysql_sandbox41102.sock
Uptime:                 15 sec

Threads: 1  Questions: 20  Slow queries: 0  Opens: 19  Open tables: 13  Queries per second avg: 1.333
--------------


/root/sandboxes/msb_maria10_3_38/my.sandbox.cnf

[mysql]
prompt='mysql [\h:10338] {\u} (\d) > '
[client]
user               = msandbox
password           = msandbox
port               = 10338
socket             = /root/sandboxes/msb_maria10_3_38/data/mysql_sandbox10338.sock
[mysqld]
user               = root
port               = 10338
socket             = /root/sandboxes/msb_maria10_3_38/data/mysql_sandbox10338.sock
basedir            = /root/opt/mysql/maria10.3.38
datadir            = /root/sandboxes/msb_maria10_3_38/data
tmpdir             = /root/sandboxes/msb_maria10_3_38/tmp
pid-file           = /root/sandboxes/msb_maria10_3_38/data/mysql_sandbox10338.pid
bind-address       = 127.0.0.1
report-host=single-10338
report-port=10338
log-error=/root/sandboxes/msb_maria10_3_38/data/msandbox.err
log-bin=mysql-bin
max_binlog_size=500M
binlog_file_cache_size=131072
binlog_cache_size=131072
binlog_stmt_cache_size=131072
binlog-commit-wait-count=100
binlog_commit_wait_usec=100000
expire_logs_days=7
binlog-format=row
sync-binlog=1
innodb_file_per_table=1
innodb_flush_log_at_trx_commit=2
optimizer_use_condition_selectivity=1

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
Server version:         10.3.38-MariaDB-log MariaDB Server
Protocol version:       10
Connection:             Localhost via UNIX socket
Server characterset:    latin1
Db     characterset:    latin1
Client characterset:    utf8
Conn.  characterset:    utf8
UNIX socket:            /root/sandboxes/msb_maria10_3_38/data/mysql_sandbox10338.sock
Uptime:                 11 sec

Threads: 7  Questions: 20  Slow queries: 0  Opens: 17  Flush tables: 1  Open tables: 11  Queries per second avg: 1.818
--------------


/root/sandboxes/msb_maria10_4_28/my.sandbox.cnf

[mysql]
prompt='mysql [\h:10428] {\u} (\d) > '
[client]
user               = msandbox
password           = msandbox
port               = 10428
socket             = /root/sandboxes/msb_maria10_4_28/data/mysql_sandbox10428.sock
[mysqld]
user               = root
port               = 10428
socket             = /root/sandboxes/msb_maria10_4_28/data/mysql_sandbox10428.sock
basedir            = /root/opt/mysql/maria10.4.28
datadir            = /root/sandboxes/msb_maria10_4_28/data
tmpdir             = /root/sandboxes/msb_maria10_4_28/tmp
pid-file           = /root/sandboxes/msb_maria10_4_28/data/mysql_sandbox10428.pid
bind-address       = 127.0.0.1
report-host=single-10428
report-port=10428
log-error=/root/sandboxes/msb_maria10_4_28/data/msandbox.err
log-bin=mysql-bin
max_binlog_size=500M
binlog_file_cache_size=131072
binlog_cache_size=131072
binlog_stmt_cache_size=131072
binlog-commit-wait-count=100
binlog_commit_wait_usec=100000
expire_logs_days=7
binlog-format=row
sync-binlog=1
innodb_file_per_table=1
innodb_flush_log_at_trx_commit=2
optimizer_use_condition_selectivity=1

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
Server version:         10.4.28-MariaDB-log MariaDB Server
Protocol version:       10
Connection:             Localhost via UNIX socket
Server characterset:    latin1
Db     characterset:    latin1
Client characterset:    utf8
Conn.  characterset:    utf8
UNIX socket:            /root/sandboxes/msb_maria10_4_28/data/mysql_sandbox10428.sock
Uptime:                 8 sec

Threads: 7  Questions: 20  Slow queries: 0  Opens: 19  Flush tables: 1  Open tables: 13  Queries per second avg: 2.500
--------------


/root/sandboxes/msb_maria10_6_12/my.sandbox.cnf

[mysql]
prompt='mysql [\h:10612] {\u} (\d) > '
[client]
user               = msandbox
password           = msandbox
port               = 10612
socket             = /root/sandboxes/msb_maria10_6_12/data/mysql_sandbox10612.sock
[mysqld]
user               = root
port               = 10612
socket             = /root/sandboxes/msb_maria10_6_12/data/mysql_sandbox10612.sock
basedir            = /root/opt/mysql/maria10.6.12
datadir            = /root/sandboxes/msb_maria10_6_12/data
tmpdir             = /root/sandboxes/msb_maria10_6_12/tmp
pid-file           = /root/sandboxes/msb_maria10_6_12/data/mysql_sandbox10612.pid
bind-address       = 127.0.0.1
report-host=single-10612
report-port=10612
log-error=/root/sandboxes/msb_maria10_6_12/data/msandbox.err
log-bin=mysql-bin
max_binlog_size=500M
binlog_file_cache_size=131072
binlog_cache_size=131072
binlog_stmt_cache_size=131072
binlog-commit-wait-count=100
binlog_commit_wait_usec=100000
expire_logs_days=7
binlog-format=row
sync-binlog=1
innodb_file_per_table=1
innodb_flush_log_at_trx_commit=2
optimizer_use_condition_selectivity=1

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
Server version:         10.6.12-MariaDB-log MariaDB Server
Protocol version:       10
Connection:             Localhost via UNIX socket
Server characterset:    latin1
Db     characterset:    latin1
Client characterset:    utf8mb3
Conn.  characterset:    utf8mb3
UNIX socket:            /root/sandboxes/msb_maria10_6_12/data/mysql_sandbox10612.sock
Uptime:                 6 sec

Threads: 1  Questions: 20  Slow queries: 0  Opens: 19  Open tables: 13  Queries per second avg: 3.333
--------------


/root/sandboxes/msb_oracle8_0_33/my.sandbox.cnf

[mysql]
prompt='mysql [\h:8033] {\u} (\d) > '
[client]
user               = msandbox
password           = msandbox
port               = 8033
socket             = /root/sandboxes/msb_oracle8_0_33/data/mysql_sandbox8033.sock
[mysqld]
user               = root
port               = 8033
socket             = /root/sandboxes/msb_oracle8_0_33/data/mysql_sandbox8033.sock
basedir            = /root/opt/mysql/oracle8.0.33
datadir            = /root/sandboxes/msb_oracle8_0_33/data
tmpdir             = /root/sandboxes/msb_oracle8_0_33/tmp
pid-file           = /root/sandboxes/msb_oracle8_0_33/data/mysql_sandbox8033.pid
bind-address       = 127.0.0.1
report-host=single-8033
report-port=8033
log-error=/root/sandboxes/msb_oracle8_0_33/data/msandbox.err
log-bin=mysql-bin
max_binlog_size=500M
binlog_cache_size=131072
binlog_stmt_cache_size=131072
expire_logs_days=7
binlog-format=row
sync-binlog=1
innodb_file_per_table=1
innodb_flush_log_at_trx_commit=2
mysqlx-port=18033
mysqlx-socket=/root/sandboxes/msb_oracle8_0_33/data/mysqlx-18033.sock

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

---------------------------------------------------------------
dbdeployer sandboxes
---------------------------------------------------------------
 msb_maria10_11_2         :   single   maria10.11.2   [41102 ]      
 msb_maria10_3_38         :   single   maria10.3.38   [10338 ]      
 msb_maria10_4_28         :   single   maria10.4.28   [10428 ]      
 msb_maria10_6_12         :   single   maria10.6.12   [10612 ]      
 msb_oracle8_0_33         :   single   oracle8.0.33   [8033 18033 ] 

---------------------------------------------------------------
sandbox info
---------------------------------------------------------------

/root/sandboxes/msb_maria10_11_2/my.sandbox.cnf

[mysql]
prompt='mysql [\h:41102] {\u} (\d) > '
[client]
user               = msandbox
password           = msandbox
port               = 41102
socket             = /root/sandboxes/msb_maria10_11_2/data/mysql_sandbox41102.sock
[mysqld]
user               = root
port               = 41102
socket             = /root/sandboxes/msb_maria10_11_2/data/mysql_sandbox41102.sock
basedir            = /root/opt/mysql/maria10.11.2
datadir            = /root/sandboxes/msb_maria10_11_2/data
tmpdir             = /root/sandboxes/msb_maria10_11_2/tmp
pid-file           = /root/sandboxes/msb_maria10_11_2/data/mysql_sandbox41102.pid
bind-address       = 127.0.0.1
report-host=single-41102
report-port=41102
log-error=/root/sandboxes/msb_maria10_11_2/data/msandbox.err
log-bin=mysql-bin
max_binlog_size=500M
binlog_file_cache_size=131072
binlog_cache_size=131072
binlog_stmt_cache_size=131072
binlog-commit-wait-count=100
binlog_commit_wait_usec=100000
expire_logs_days=7
binlog-format=row
sync-binlog=1
innodb_file_per_table=1
innodb_flush_log_at_trx_commit=2
optimizer_use_condition_selectivity=1

/root/sandboxes/msb_maria10_11_2/my sql -e '\s'
--------------
/root/opt/mysql/maria10.11.2/bin/mysql  Ver 15.1 Distrib 10.11.2-MariaDB, for linux-systemd (x86_64) using readline 5.1

Connection id:          6
Current database:
Current user:           msandbox@localhost
SSL:                    Not in use
Current pager:          stdout
Using outfile:          ''
Using delimiter:        ;
Server:                 MariaDB
Server version:         10.11.2-MariaDB-log MariaDB Server
Protocol version:       10
Connection:             Localhost via UNIX socket
Server characterset:    latin1
Db     characterset:    latin1
Client characterset:    utf8mb3
Conn.  characterset:    utf8mb3
UNIX socket:            /root/sandboxes/msb_maria10_11_2/data/mysql_sandbox41102.sock
Uptime:                 1 min 2 sec

Threads: 1  Questions: 24  Slow queries: 0  Opens: 19  Open tables: 13  Queries per second avg: 0.387
--------------

saving msb_maria10_11_2 variables to /home/dbdeployer/msb_maria10_11_2-variables.txt
/root/sandboxes/msb_maria10_11_2/my sqladmin var
---------------------------------------------------------------

/root/sandboxes/msb_maria10_3_38/my.sandbox.cnf

[mysql]
prompt='mysql [\h:10338] {\u} (\d) > '
[client]
user               = msandbox
password           = msandbox
port               = 10338
socket             = /root/sandboxes/msb_maria10_3_38/data/mysql_sandbox10338.sock
[mysqld]
user               = root
port               = 10338
socket             = /root/sandboxes/msb_maria10_3_38/data/mysql_sandbox10338.sock
basedir            = /root/opt/mysql/maria10.3.38
datadir            = /root/sandboxes/msb_maria10_3_38/data
tmpdir             = /root/sandboxes/msb_maria10_3_38/tmp
pid-file           = /root/sandboxes/msb_maria10_3_38/data/mysql_sandbox10338.pid
bind-address       = 127.0.0.1
report-host=single-10338
report-port=10338
log-error=/root/sandboxes/msb_maria10_3_38/data/msandbox.err
log-bin=mysql-bin
max_binlog_size=500M
binlog_file_cache_size=131072
binlog_cache_size=131072
binlog_stmt_cache_size=131072
binlog-commit-wait-count=100
binlog_commit_wait_usec=100000
expire_logs_days=7
binlog-format=row
sync-binlog=1
innodb_file_per_table=1
innodb_flush_log_at_trx_commit=2
optimizer_use_condition_selectivity=1

/root/sandboxes/msb_maria10_3_38/my sql -e '\s'
--------------
/root/opt/mysql/maria10.3.38/bin/mysql  Ver 15.1 Distrib 10.3.38-MariaDB, for linux-systemd (x86_64) using readline 5.1

Connection id:          11
Current database:
Current user:           msandbox@localhost
SSL:                    Not in use
Current pager:          stdout
Using outfile:          ''
Using delimiter:        ;
Server:                 MariaDB
Server version:         10.3.38-MariaDB-log MariaDB Server
Protocol version:       10
Connection:             Localhost via UNIX socket
Server characterset:    latin1
Db     characterset:    latin1
Client characterset:    utf8
Conn.  characterset:    utf8
UNIX socket:            /root/sandboxes/msb_maria10_3_38/data/mysql_sandbox10338.sock
Uptime:                 58 sec

Threads: 7  Questions: 24  Slow queries: 0  Opens: 17  Flush tables: 1  Open tables: 11  Queries per second avg: 0.413
--------------

saving msb_maria10_3_38 variables to /home/dbdeployer/msb_maria10_3_38-variables.txt
/root/sandboxes/msb_maria10_3_38/my sqladmin var
---------------------------------------------------------------

/root/sandboxes/msb_maria10_4_28/my.sandbox.cnf

[mysql]
prompt='mysql [\h:10428] {\u} (\d) > '
[client]
user               = msandbox
password           = msandbox
port               = 10428
socket             = /root/sandboxes/msb_maria10_4_28/data/mysql_sandbox10428.sock
[mysqld]
user               = root
port               = 10428
socket             = /root/sandboxes/msb_maria10_4_28/data/mysql_sandbox10428.sock
basedir            = /root/opt/mysql/maria10.4.28
datadir            = /root/sandboxes/msb_maria10_4_28/data
tmpdir             = /root/sandboxes/msb_maria10_4_28/tmp
pid-file           = /root/sandboxes/msb_maria10_4_28/data/mysql_sandbox10428.pid
bind-address       = 127.0.0.1
report-host=single-10428
report-port=10428
log-error=/root/sandboxes/msb_maria10_4_28/data/msandbox.err
log-bin=mysql-bin
max_binlog_size=500M
binlog_file_cache_size=131072
binlog_cache_size=131072
binlog_stmt_cache_size=131072
binlog-commit-wait-count=100
binlog_commit_wait_usec=100000
expire_logs_days=7
binlog-format=row
sync-binlog=1
innodb_file_per_table=1
innodb_flush_log_at_trx_commit=2
optimizer_use_condition_selectivity=1

/root/sandboxes/msb_maria10_4_28/my sql -e '\s'
--------------
/root/opt/mysql/maria10.4.28/bin/mysql  Ver 15.1 Distrib 10.4.28-MariaDB, for linux-systemd (x86_64) using readline 5.1

Connection id:          11
Current database:
Current user:           msandbox@localhost
SSL:                    Not in use
Current pager:          stdout
Using outfile:          ''
Using delimiter:        ;
Server:                 MariaDB
Server version:         10.4.28-MariaDB-log MariaDB Server
Protocol version:       10
Connection:             Localhost via UNIX socket
Server characterset:    latin1
Db     characterset:    latin1
Client characterset:    utf8
Conn.  characterset:    utf8
UNIX socket:            /root/sandboxes/msb_maria10_4_28/data/mysql_sandbox10428.sock
Uptime:                 55 sec

Threads: 7  Questions: 24  Slow queries: 0  Opens: 19  Flush tables: 1  Open tables: 13  Queries per second avg: 0.436
--------------

saving msb_maria10_4_28 variables to /home/dbdeployer/msb_maria10_4_28-variables.txt
/root/sandboxes/msb_maria10_4_28/my sqladmin var
---------------------------------------------------------------

/root/sandboxes/msb_maria10_6_12/my.sandbox.cnf

[mysql]
prompt='mysql [\h:10612] {\u} (\d) > '
[client]
user               = msandbox
password           = msandbox
port               = 10612
socket             = /root/sandboxes/msb_maria10_6_12/data/mysql_sandbox10612.sock
[mysqld]
user               = root
port               = 10612
socket             = /root/sandboxes/msb_maria10_6_12/data/mysql_sandbox10612.sock
basedir            = /root/opt/mysql/maria10.6.12
datadir            = /root/sandboxes/msb_maria10_6_12/data
tmpdir             = /root/sandboxes/msb_maria10_6_12/tmp
pid-file           = /root/sandboxes/msb_maria10_6_12/data/mysql_sandbox10612.pid
bind-address       = 127.0.0.1
report-host=single-10612
report-port=10612
log-error=/root/sandboxes/msb_maria10_6_12/data/msandbox.err
log-bin=mysql-bin
max_binlog_size=500M
binlog_file_cache_size=131072
binlog_cache_size=131072
binlog_stmt_cache_size=131072
binlog-commit-wait-count=100
binlog_commit_wait_usec=100000
expire_logs_days=7
binlog-format=row
sync-binlog=1
innodb_file_per_table=1
innodb_flush_log_at_trx_commit=2
optimizer_use_condition_selectivity=1

/root/sandboxes/msb_maria10_6_12/my sql -e '\s'
--------------
/root/opt/mysql/maria10.6.12/bin/mysql  Ver 15.1 Distrib 10.6.12-MariaDB, for linux-systemd (x86_64) using readline 5.1

Connection id:          6
Current database:
Current user:           msandbox@localhost
SSL:                    Not in use
Current pager:          stdout
Using outfile:          ''
Using delimiter:        ;
Server:                 MariaDB
Server version:         10.6.12-MariaDB-log MariaDB Server
Protocol version:       10
Connection:             Localhost via UNIX socket
Server characterset:    latin1
Db     characterset:    latin1
Client characterset:    utf8mb3
Conn.  characterset:    utf8mb3
UNIX socket:            /root/sandboxes/msb_maria10_6_12/data/mysql_sandbox10612.sock
Uptime:                 53 sec

Threads: 1  Questions: 24  Slow queries: 0  Opens: 19  Open tables: 13  Queries per second avg: 0.452
--------------

saving msb_maria10_6_12 variables to /home/dbdeployer/msb_maria10_6_12-variables.txt
/root/sandboxes/msb_maria10_6_12/my sqladmin var
---------------------------------------------------------------

/root/sandboxes/msb_oracle8_0_33/my.sandbox.cnf

[mysql]
prompt='mysql [\h:8033] {\u} (\d) > '
[client]
user               = msandbox
password           = msandbox
port               = 8033
socket             = /root/sandboxes/msb_oracle8_0_33/data/mysql_sandbox8033.sock
[mysqld]
user               = root
port               = 8033
socket             = /root/sandboxes/msb_oracle8_0_33/data/mysql_sandbox8033.sock
basedir            = /root/opt/mysql/oracle8.0.33
datadir            = /root/sandboxes/msb_oracle8_0_33/data
tmpdir             = /root/sandboxes/msb_oracle8_0_33/tmp
pid-file           = /root/sandboxes/msb_oracle8_0_33/data/mysql_sandbox8033.pid
bind-address       = 127.0.0.1
report-host=single-8033
report-port=8033
log-error=/root/sandboxes/msb_oracle8_0_33/data/msandbox.err
log-bin=mysql-bin
max_binlog_size=500M
binlog_cache_size=131072
binlog_stmt_cache_size=131072
expire_logs_days=7
binlog-format=row
sync-binlog=1
innodb_file_per_table=1
innodb_flush_log_at_trx_commit=2
mysqlx-port=18033
mysqlx-socket=/root/sandboxes/msb_oracle8_0_33/data/mysqlx-18033.sock

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
Uptime:                 48 sec

Threads: 2  Questions: 47  Slow queries: 0  Opens: 149  Flush tables: 3  Open tables: 65  Queries per second avg: 0.979
--------------

saving msb_oracle8_0_33 variables to /home/dbdeployer/msb_oracle8_0_33-variables.txt
/root/sandboxes/msb_oracle8_0_33/my sqladmin var
---------------------------------------------------------------
```

## Check Variables

The `check` option also saves the instance's MySQL variables to a file at `/home/dbdeployer`

```
ls -lAh /home/dbdeployer
total 144K
-rw-r--r-- 1 root root 23K Apr 30 05:15 msb_maria10_11_2-variables.txt
-rw-r--r-- 1 root root 22K Apr 30 05:15 msb_maria10_3_38-variables.txt
-rw-r--r-- 1 root root 23K Apr 30 05:15 msb_maria10_4_28-variables.txt
-rw-r--r-- 1 root root 23K Apr 30 02:04 msb_maria10_5_19-variables.txt
-rw-r--r-- 1 root root 23K Apr 30 05:15 msb_maria10_6_12-variables.txt
-rw-r--r-- 1 root root 23K Apr 30 05:15 msb_oracle8_0_33-variables.txt
```

MariaDB 10.11.2 variables from `/home/dbdeployer/msb_maria10_11_2-variables.txt`

```
| Variable_name | Value |
| allow_suspicious_udfs | OFF |
| alter_algorithm | DEFAULT |
| analyze_sample_percentage | 100.000000 |
| aria_block_size | 8192 |
| aria_checkpoint_interval | 30 |
| aria_checkpoint_log_activity | 1048576 |
| aria_encrypt_tables | OFF |
| aria_force_start_after_recovery_failures | 0 |
| aria_group_commit | none |
| aria_group_commit_interval | 0 |
| aria_log_file_size | 1073741824 |
| aria_log_purge_type | immediate |
| aria_max_sort_file_size | 9223372036853727232 |
| aria_page_checksum | ON |
| aria_pagecache_age_threshold | 300 |
| aria_pagecache_buffer_size | 134217728 |
| aria_pagecache_division_limit | 100 |
| aria_pagecache_file_hash_size | 512 |
| aria_recover_options | BACKUP,QUICK |
| aria_repair_threads | 1 |
| aria_sort_buffer_size | 268434432 |
| aria_stats_method | nulls_unequal |
| aria_sync_log_dir | NEWFILE |
| aria_used_for_temp_tables | ON |
| auto_increment_increment | 1 |
| auto_increment_offset | 1 |
| autocommit | ON |
| automatic_sp_privileges | ON |
| back_log | 80 |
| basedir | /root/opt/mysql/maria10.11.2 |
| big_tables | OFF |
| bind_address | 127.0.0.1 |
| binlog_alter_two_phase | OFF |
| binlog_annotate_row_events | ON |
| binlog_cache_size | 131072 |
| binlog_checksum | CRC32 |
| binlog_commit_wait_count | 100 |
| binlog_commit_wait_usec | 100000 |
| binlog_direct_non_transactional_updates | OFF |
| binlog_expire_logs_seconds | 604800 |
| binlog_file_cache_size | 131072 |
| binlog_format | ROW |
| binlog_optimize_thread_scheduling | ON |
| binlog_row_image | FULL |
| binlog_row_metadata | NO_LOG |
| binlog_stmt_cache_size | 131072 |
| bulk_insert_buffer_size | 8388608 |
| character_set_client | latin1 |
| character_set_connection | latin1 |
| character_set_database | latin1 |
| character_set_filesystem | binary |
| character_set_results | latin1 |
| character_set_server | latin1 |
| character_set_system | utf8mb3 |
| character_sets_dir | /root/opt/mysql/maria10.11.2/share/charsets/ |
| check_constraint_checks | ON |
| collation_connection | latin1_swedish_ci |
| collation_database | latin1_swedish_ci |
| collation_server | latin1_swedish_ci |
| column_compression_threshold | 100 |
| column_compression_zlib_level | 6 |
| column_compression_zlib_strategy | DEFAULT_STRATEGY |
| column_compression_zlib_wrap | OFF |
| completion_type | NO_CHAIN |
| concurrent_insert | AUTO |
| connect_timeout | 10 |
| core_file | OFF |
| datadir | /root/sandboxes/msb_maria10_11_2/data/ |
| date_format | %Y-%m-%d |
| datetime_format | %Y-%m-%d %H:%i:%s |
| deadlock_search_depth_long | 15 |
| deadlock_search_depth_short | 4 |
| deadlock_timeout_long | 50000000 |
| deadlock_timeout_short | 10000 |
| debug_no_thread_alarm | OFF |
| default_password_lifetime | 0 |
| default_regex_flags | |
| default_storage_engine | InnoDB |
| default_tmp_storage_engine | |
| default_week_format | 0 |
| delay_key_write | ON |
| delayed_insert_limit | 100 |
| delayed_insert_timeout | 300 |
| delayed_queue_size | 1000 |
| disconnect_on_expired_password | OFF |
| div_precision_increment | 4 |
| encrypt_binlog | OFF |
| encrypt_tmp_disk_tables | OFF |
| encrypt_tmp_files | OFF |
| enforce_storage_engine | |
| eq_range_index_dive_limit | 200 |
| event_scheduler | OFF |
| expensive_subquery_limit | 100 |
| expire_logs_days | 7.000000 |
| explicit_defaults_for_timestamp | ON |
| extra_max_connections | 1 |
| extra_port | 0 |
| flush | OFF |
| flush_time | 0 |
| foreign_key_checks | ON |
| ft_boolean_syntax | + -><()~*:""&| |
| ft_max_word_len | 84 |
| ft_min_word_len | 4 |
| ft_query_expansion_limit | 20 |
| ft_stopword_file | (built-in) |
| general_log | OFF |
| general_log_file | inc2.log |
| group_concat_max_len | 1048576 |
| gtid_binlog_pos | 0-1-12 |
| gtid_binlog_state | 0-1-12 |
| gtid_cleanup_batch_size | 64 |
| gtid_current_pos | 0-1-12 |
| gtid_domain_id | 0 |
| gtid_ignore_duplicates | OFF |
| gtid_pos_auto_engines | |
| gtid_slave_pos | |
| gtid_strict_mode | OFF |
| have_compress | YES |
| have_crypt | YES |
| have_dynamic_loading | YES |
| have_geometry | YES |
| have_openssl | NO |
| have_profiling | YES |
| have_query_cache | YES |
| have_rtree_keys | YES |
| have_ssl | DISABLED |
| have_symlink | YES |
| histogram_size | 254 |
| histogram_type | DOUBLE_PREC_HB |
| host_cache_size | 279 |
| hostname | hostname |
| idle_readonly_transaction_timeout | 0 |
| idle_transaction_timeout | 0 |
| idle_write_transaction_timeout | 0 |
| ignore_builtin_innodb | OFF |
| ignore_db_dirs | |
| in_predicate_conversion_threshold | 1000 |
| init_connect | |
| init_file | |
| init_slave | |
| innodb_adaptive_flushing | ON |
| innodb_adaptive_flushing_lwm | 10.000000 |
| innodb_adaptive_hash_index | OFF |
| innodb_adaptive_hash_index_parts | 8 |
| innodb_autoextend_increment | 64 |
| innodb_autoinc_lock_mode | 1 |
| innodb_buf_dump_status_frequency | 0 |
| innodb_buffer_pool_chunk_size | 2097152 |
| innodb_buffer_pool_dump_at_shutdown | ON |
| innodb_buffer_pool_dump_now | OFF |
| innodb_buffer_pool_dump_pct | 25 |
| innodb_buffer_pool_filename | ib_buffer_pool |
| innodb_buffer_pool_load_abort | OFF |
| innodb_buffer_pool_load_at_startup | ON |
| innodb_buffer_pool_load_now | OFF |
| innodb_buffer_pool_size | 134217728 |
| innodb_change_buffer_max_size | 25 |
| innodb_change_buffering | none |
| innodb_checksum_algorithm | full_crc32 |
| innodb_cmp_per_index_enabled | OFF |
| innodb_compression_algorithm | zlib |
| innodb_compression_default | OFF |
| innodb_compression_failure_threshold_pct | 5 |
| innodb_compression_level | 6 |
| innodb_compression_pad_pct_max | 50 |
| innodb_data_file_path | ibdata1:12M:autoextend |
| innodb_data_home_dir | |
| innodb_deadlock_detect | ON |
| innodb_deadlock_report | full |
| innodb_default_encryption_key_id | 1 |
| innodb_default_row_format | dynamic |
| innodb_defragment | OFF |
| innodb_defragment_fill_factor | 0.900000 |
| innodb_defragment_fill_factor_n_recs | 20 |
| innodb_defragment_frequency | 40 |
| innodb_defragment_n_pages | 7 |
| innodb_defragment_stats_accuracy | 0 |
| innodb_disable_sort_file_cache | OFF |
| innodb_doublewrite | ON |
| innodb_encrypt_log | OFF |
| innodb_encrypt_tables | OFF |
| innodb_encrypt_temporary_tables | OFF |
| innodb_encryption_rotate_key_age | 1 |
| innodb_encryption_rotation_iops | 100 |
| innodb_encryption_threads | 0 |
| innodb_fast_shutdown | 1 |
| innodb_fatal_semaphore_wait_threshold | 600 |
| innodb_file_per_table | ON |
| innodb_fill_factor | 100 |
| innodb_flush_log_at_timeout | 1 |
| innodb_flush_log_at_trx_commit | 2 |
| innodb_flush_method | O_DIRECT |
| innodb_flush_neighbors | 1 |
| innodb_flush_sync | ON |
| innodb_flushing_avg_loops | 30 |
| innodb_force_primary_key | OFF |
| innodb_force_recovery | 0 |
| innodb_ft_aux_table | |
| innodb_ft_cache_size | 8000000 |
| innodb_ft_enable_diag_print | OFF |
| innodb_ft_enable_stopword | ON |
| innodb_ft_max_token_size | 84 |
| innodb_ft_min_token_size | 3 |
| innodb_ft_num_word_optimize | 2000 |
| innodb_ft_result_cache_limit | 2000000000 |
| innodb_ft_server_stopword_table | |
| innodb_ft_sort_pll_degree | 2 |
| innodb_ft_total_cache_size | 640000000 |
| innodb_ft_user_stopword_table | |
| innodb_immediate_scrub_data_uncompressed | OFF |
| innodb_instant_alter_column_allowed | add_drop_reorder |
| innodb_io_capacity | 200 |
| innodb_io_capacity_max | 2000 |
| innodb_lock_wait_timeout | 50 |
| innodb_log_buffer_size | 16777216 |
| innodb_log_file_buffering | ON |
| innodb_log_file_size | 100663296 |
| innodb_log_group_home_dir | ./ |
| innodb_lru_flush_size | 32 |
| innodb_lru_scan_depth | 1536 |
| innodb_max_dirty_pages_pct | 90.000000 |
| innodb_max_dirty_pages_pct_lwm | 0.000000 |
| innodb_max_purge_lag | 0 |
| innodb_max_purge_lag_delay | 0 |
| innodb_max_purge_lag_wait | 4294967295 |
| innodb_max_undo_log_size | 10485760 |
| innodb_monitor_disable | |
| innodb_monitor_enable | |
| innodb_monitor_reset | |
| innodb_monitor_reset_all | |
| innodb_old_blocks_pct | 37 |
| innodb_old_blocks_time | 1000 |
| innodb_online_alter_log_max_size | 134217728 |
| innodb_open_files | 2000 |
| innodb_optimize_fulltext_only | OFF |
| innodb_page_size | 16384 |
| innodb_prefix_index_cluster_optimization | ON |
| innodb_print_all_deadlocks | OFF |
| innodb_purge_batch_size | 300 |
| innodb_purge_rseg_truncate_frequency | 128 |
| innodb_purge_threads | 4 |
| innodb_random_read_ahead | OFF |
| innodb_read_ahead_threshold | 56 |
| innodb_read_io_threads | 4 |
| innodb_read_only | OFF |
| innodb_read_only_compressed | OFF |
| innodb_rollback_on_timeout | OFF |
| innodb_sort_buffer_size | 1048576 |
| innodb_spin_wait_delay | 4 |
| innodb_stats_auto_recalc | ON |
| innodb_stats_include_delete_marked | OFF |
| innodb_stats_method | nulls_equal |
| innodb_stats_modified_counter | 0 |
| innodb_stats_on_metadata | OFF |
| innodb_stats_persistent | ON |
| innodb_stats_persistent_sample_pages | 20 |
| innodb_stats_traditional | ON |
| innodb_stats_transient_sample_pages | 8 |
| innodb_status_output | OFF |
| innodb_status_output_locks | OFF |
| innodb_strict_mode | ON |
| innodb_sync_spin_loops | 30 |
| innodb_table_locks | ON |
| innodb_temp_data_file_path | ibtmp1:12M:autoextend |
| innodb_tmpdir | |
| innodb_undo_directory | ./ |
| innodb_undo_log_truncate | OFF |
| innodb_undo_tablespaces | 0 |
| innodb_use_atomic_writes | ON |
| innodb_use_native_aio | ON |
| innodb_write_io_threads | 4 |
| interactive_timeout | 28800 |
| join_buffer_size | 262144 |
| join_buffer_space_limit | 2097152 |
| join_cache_level | 2 |
| keep_files_on_create | OFF |
| key_buffer_size | 134217728 |
| key_cache_age_threshold | 300 |
| key_cache_block_size | 1024 |
| key_cache_division_limit | 100 |
| key_cache_file_hash_size | 512 |
| key_cache_segments | 0 |
| large_files_support | ON |
| large_page_size | 0 |
| large_pages | OFF |
| lc_messages | en_US |
| lc_messages_dir | |
| lc_time_names | en_US |
| license | GPL |
| local_infile | ON |
| lock_wait_timeout | 86400 |
| locked_in_memory | OFF |
| log_bin | ON |
| log_bin_basename | /root/sandboxes/msb_maria10_11_2/data/mysql-bin |
| log_bin_compress | OFF |
| log_bin_compress_min_len | 256 |
| log_bin_index | /root/sandboxes/msb_maria10_11_2/data/mysql-bin.index |
| log_bin_trust_function_creators | OFF |
| log_disabled_statements | sp |
| log_error | /root/sandboxes/msb_maria10_11_2/data/msandbox.err |
| log_output | FILE |
| log_queries_not_using_indexes | OFF |
| log_slave_updates | OFF |
| log_slow_admin_statements | ON |
| log_slow_disabled_statements | sp |
| log_slow_filter | admin,filesort,filesort_on_disk,filesort_priority_queue,full_join,full_scan,query_cache,query_cache_miss,tmp_table,tmp_table_on_disk |
| log_slow_min_examined_row_limit | 0 |
| log_slow_query | OFF |
| log_slow_query_file | inc2-slow.log |
| log_slow_query_time | 10.000000 |
| log_slow_rate_limit | 1 |
| log_slow_slave_statements | ON |
| log_slow_verbosity | |
| log_tc_size | 24576 |
| log_warnings | 2 |
| long_query_time | 10.000000 |
| low_priority_updates | OFF |
| lower_case_file_system | OFF |
| lower_case_table_names | 0 |
| master_verify_checksum | OFF |
| max_allowed_packet | 16777216 |
| max_binlog_cache_size | 18446744073709547520 |
| max_binlog_size | 524288000 |
| max_binlog_stmt_cache_size | 18446744073709547520 |
| max_connect_errors | 100 |
| max_connections | 151 |
| max_delayed_threads | 20 |
| max_digest_length | 1024 |
| max_error_count | 64 |
| max_heap_table_size | 16777216 |
| max_insert_delayed_threads | 20 |
| max_join_size | 18446744073709551615 |
| max_length_for_sort_data | 1024 |
| max_password_errors | 4294967295 |
| max_prepared_stmt_count | 16382 |
| max_recursive_iterations | 1000 |
| max_relay_log_size | 524288000 |
| max_rowid_filter_size | 131072 |
| max_seeks_for_key | 4294967295 |
| max_session_mem_used | 9223372036854775807 |
| max_sort_length | 1024 |
| max_sp_recursion_depth | 0 |
| max_statement_time | 0.000000 |
| max_tmp_tables | 32 |
| max_user_connections | 0 |
| max_write_lock_count | 4294967295 |
| metadata_locks_cache_size | 1024 |
| metadata_locks_hash_instances | 8 |
| min_examined_row_limit | 0 |
| mrr_buffer_size | 262144 |
| myisam_block_size | 1024 |
| myisam_data_pointer_size | 6 |
| myisam_max_sort_file_size | 9223372036853727232 |
| myisam_mmap_size | 18446744073709551615 |
| myisam_recover_options | BACKUP,QUICK |
| myisam_repair_threads | 1 |
| myisam_sort_buffer_size | 134216704 |
| myisam_stats_method | NULLS_UNEQUAL |
| myisam_use_mmap | OFF |
| mysql56_temporal_format | ON |
| net_buffer_length | 16384 |
| net_read_timeout | 30 |
| net_retry_count | 10 |
| net_write_timeout | 60 |
| old | OFF |
| old_alter_table | DEFAULT |
| old_mode | UTF8_IS_UTF8MB3 |
| old_passwords | OFF |
| open_files_limit | 32184 |
| optimizer_extra_pruning_depth | 8 |
| optimizer_max_sel_arg_weight | 32000 |
| optimizer_prune_level | 2 |
| optimizer_search_depth | 62 |
| optimizer_selectivity_sampling_limit | 100 |
| optimizer_switch | index_merge=on,index_merge_union=on,index_merge_sort_union=on,index_merge_intersection=on,index_merge_sort_intersection=off,engine_condition_pushdown=off,index_condition_pushdown=on,derived_merge=on,derived_with_keys=on,firstmatch=on,loosescan=on,materialization=on,in_to_exists=on,semijoin=on,partial_match_rowid_merge=on,partial_match_table_scan=on,subquery_cache=on,mrr=off,mrr_cost_based=off,mrr_sort_keys=off,outer_join_with_cache=on,semijoin_with_cache=on,join_cache_incremental=on,join_cache_hashed=on,join_cache_bka=on,optimize_join_buffer_size=on,table_elimination=on,extended_keys=on,exists_to_in=on,orderby_uses_equalities=on,condition_pushdown_for_derived=on,split_materialized=on,condition_pushdown_for_subquery=on,rowid_filter=on,condition_pushdown_from_having=on,not_null_range_scan=off |
| optimizer_trace | enabled=off |
| optimizer_trace_max_mem_size | 1048576 |
| optimizer_use_condition_selectivity | 1 |
| performance_schema | OFF |
| performance_schema_accounts_size | -1 |
| performance_schema_digests_size | -1 |
| performance_schema_events_stages_history_long_size | -1 |
| performance_schema_events_stages_history_size | -1 |
| performance_schema_events_statements_history_long_size | -1 |
| performance_schema_events_statements_history_size | -1 |
| performance_schema_events_transactions_history_long_size | -1 |
| performance_schema_events_transactions_history_size | -1 |
| performance_schema_events_waits_history_long_size | -1 |
| performance_schema_events_waits_history_size | -1 |
| performance_schema_hosts_size | -1 |
| performance_schema_max_cond_classes | 90 |
| performance_schema_max_cond_instances | -1 |
| performance_schema_max_digest_length | 1024 |
| performance_schema_max_file_classes | 80 |
| performance_schema_max_file_handles | 32768 |
| performance_schema_max_file_instances | -1 |
| performance_schema_max_index_stat | -1 |
| performance_schema_max_memory_classes | 320 |
| performance_schema_max_metadata_locks | -1 |
| performance_schema_max_mutex_classes | 210 |
| performance_schema_max_mutex_instances | -1 |
| performance_schema_max_prepared_statements_instances | -1 |
| performance_schema_max_program_instances | -1 |
| performance_schema_max_rwlock_classes | 50 |
| performance_schema_max_rwlock_instances | -1 |
| performance_schema_max_socket_classes | 10 |
| performance_schema_max_socket_instances | -1 |
| performance_schema_max_sql_text_length | 1024 |
| performance_schema_max_stage_classes | 160 |
| performance_schema_max_statement_classes | 222 |
| performance_schema_max_statement_stack | 10 |
| performance_schema_max_table_handles | -1 |
| performance_schema_max_table_instances | -1 |
| performance_schema_max_table_lock_stat | -1 |
| performance_schema_max_thread_classes | 50 |
| performance_schema_max_thread_instances | -1 |
| performance_schema_session_connect_attrs_size | -1 |
| performance_schema_setup_actors_size | -1 |
| performance_schema_setup_objects_size | -1 |
| performance_schema_users_size | -1 |
| pid_file | /root/sandboxes/msb_maria10_11_2/data/mysql_sandbox41102.pid |
| plugin_dir | /root/opt/mysql/maria10.11.2/lib/plugin/ |
| plugin_maturity | gamma |
| port | 41102 |
| preload_buffer_size | 32768 |
| profiling | OFF |
| profiling_history_size | 15 |
| progress_report_time | 5 |
| protocol_version | 10 |
| proxy_protocol_networks | |
| query_alloc_block_size | 16384 |
| query_cache_limit | 1048576 |
| query_cache_min_res_unit | 4096 |
| query_cache_size | 1048576 |
| query_cache_strip_comments | OFF |
| query_cache_type | OFF |
| query_cache_wlock_invalidate | OFF |
| query_prealloc_size | 24576 |
| range_alloc_block_size | 4096 |
| read_binlog_speed_limit | 0 |
| read_buffer_size | 131072 |
| read_only | OFF |
| read_rnd_buffer_size | 262144 |
| relay_log | |
| relay_log_basename | |
| relay_log_index | |
| relay_log_info_file | relay-log.info |
| relay_log_purge | ON |
| relay_log_recovery | OFF |
| relay_log_space_limit | 0 |
| replicate_annotate_row_events | ON |
| replicate_do_db | |
| replicate_do_table | |
| replicate_events_marked_for_skip | REPLICATE |
| replicate_ignore_db | |
| replicate_ignore_table | |
| replicate_rewrite_db | |
| replicate_wild_do_table | |
| replicate_wild_ignore_table | |
| report_host | single-41102 |
| report_password | |
| report_port | 41102 |
| report_user | |
| require_secure_transport | OFF |
| rowid_merge_buff_size | 8388608 |
| rpl_semi_sync_master_enabled | OFF |
| rpl_semi_sync_master_timeout | 10000 |
| rpl_semi_sync_master_trace_level | 32 |
| rpl_semi_sync_master_wait_no_slave | ON |
| rpl_semi_sync_master_wait_point | AFTER_COMMIT |
| rpl_semi_sync_slave_delay_master | OFF |
| rpl_semi_sync_slave_enabled | OFF |
| rpl_semi_sync_slave_kill_conn_timeout | 5 |
| rpl_semi_sync_slave_trace_level | 32 |
| secure_auth | ON |
| secure_file_priv | |
| secure_timestamp | NO |
| server_id | 1 |
| session_track_schema | ON |
| session_track_state_change | OFF |
| session_track_system_variables | autocommit,character_set_client,character_set_connection,character_set_results,time_zone |
| session_track_transaction_info | OFF |
| skip_external_locking | ON |
| skip_grant_tables | OFF |
| skip_name_resolve | OFF |
| skip_networking | OFF |
| skip_show_database | OFF |
| slave_compressed_protocol | OFF |
| slave_ddl_exec_mode | IDEMPOTENT |
| slave_domain_parallel_threads | 0 |
| slave_exec_mode | STRICT |
| slave_load_tmpdir | /root/sandboxes/msb_maria10_11_2/tmp |
| slave_max_allowed_packet | 1073741824 |
| slave_max_statement_time | 0.000000 |
| slave_net_timeout | 60 |
| slave_parallel_max_queued | 131072 |
| slave_parallel_mode | optimistic |
| slave_parallel_threads | 0 |
| slave_parallel_workers | 0 |
| slave_run_triggers_for_rbr | NO |
| slave_skip_errors | OFF |
| slave_sql_verify_checksum | ON |
| slave_transaction_retries | 10 |
| slave_transaction_retry_errors | 1158,1159,1160,1161,1205,1213,1429,2013,12701 |
| slave_transaction_retry_interval | 0 |
| slave_type_conversions | |
| slow_launch_time | 2 |
| slow_query_log | OFF |
| slow_query_log_file | inc2-slow.log |
| socket | /root/sandboxes/msb_maria10_11_2/data/mysql_sandbox41102.sock |
| sort_buffer_size | 2097152 |
| sql_auto_is_null | OFF |
| sql_big_selects | ON |
| sql_buffer_result | OFF |
| sql_if_exists | OFF |
| sql_log_bin | ON |
| sql_log_off | OFF |
| sql_mode | STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION |
| sql_notes | ON |
| sql_quote_show_create | ON |
| sql_safe_updates | OFF |
| sql_select_limit | 18446744073709551615 |
| sql_slave_skip_counter | 0 |
| sql_warnings | OFF |
| ssl_ca | |
| ssl_capath | |
| ssl_cert | |
| ssl_cipher | |
| ssl_crl | |
| ssl_crlpath | |
| ssl_key | |
| standard_compliant_cte | ON |
| storage_engine | InnoDB |
| stored_program_cache | 256 |
| strict_password_validation | ON |
| sync_binlog | 1 |
| sync_frm | ON |
| sync_master_info | 10000 |
| sync_relay_log | 10000 |
| sync_relay_log_info | 10000 |
| system_time_zone | EDT |
| system_versioning_alter_history | ERROR |
| system_versioning_asof | DEFAULT |
| system_versioning_insert_history | OFF |
| table_definition_cache | 400 |
| table_open_cache | 2000 |
| table_open_cache_instances | 8 |
| tcp_keepalive_interval | 0 |
| tcp_keepalive_probes | 0 |
| tcp_keepalive_time | 0 |
| tcp_nodelay | ON |
| thread_cache_size | 151 |
| thread_handling | one-thread-per-connection |
| thread_pool_dedicated_listener | OFF |
| thread_pool_exact_stats | OFF |
| thread_pool_idle_timeout | 60 |
| thread_pool_max_threads | 65536 |
| thread_pool_oversubscribe | 3 |
| thread_pool_prio_kickup_timer | 1000 |
| thread_pool_priority | auto |
| thread_pool_size | 2 |
| thread_pool_stall_limit | 500 |
| thread_stack | 299008 |
| time_format | %H:%i:%s |
| time_zone | SYSTEM |
| tls_version | TLSv1.1,TLSv1.2,TLSv1.3 |
| tmp_disk_table_size | 18446744073709551615 |
| tmp_memory_table_size | 16777216 |
| tmp_table_size | 16777216 |
| tmpdir | /root/sandboxes/msb_maria10_11_2/tmp |
| transaction_alloc_block_size | 8192 |
| transaction_prealloc_size | 4096 |
| tx_isolation | REPEATABLE-READ |
| tx_read_only | OFF |
| unique_checks | ON |
| updatable_views_with_limit | YES |
| use_stat_tables | PREFERABLY_FOR_QUERIES |
| userstat | OFF |
| version | 10.11.2-MariaDB-log |
| version_comment | MariaDB Server |
| version_compile_machine | x86_64 |
| version_compile_os | linux-systemd |
| version_malloc_library | system |
| version_source_revision | cafba8761af55ae16cc69c9b53a341340a845b36 |
| version_ssl_library | WolfSSL 5.5.4 |
| wait_timeout | 28800 |
| wsrep_osu_method | TOI |
| wsrep_sr_store | table |
| wsrep_allowlist | |
| wsrep_auto_increment_control | ON |
| wsrep_causal_reads | OFF |
| wsrep_certification_rules | strict |
| wsrep_certify_nonpk | ON |
| wsrep_cluster_address | |
| wsrep_cluster_name | my_wsrep_cluster |
| wsrep_convert_lock_to_trx | OFF |
| wsrep_data_home_dir | /root/sandboxes/msb_maria10_11_2/data/ |
| wsrep_dbug_option | |
| wsrep_debug | NONE |
| wsrep_desync | OFF |
| wsrep_dirty_reads | OFF |
| wsrep_drupal_282555_workaround | OFF |
| wsrep_forced_binlog_format | NONE |
| wsrep_gtid_domain_id | 0 |
| wsrep_gtid_mode | OFF |
| wsrep_ignore_apply_errors | 7 |
| wsrep_load_data_splitting | OFF |
| wsrep_log_conflicts | OFF |
| wsrep_max_ws_rows | 0 |
| wsrep_max_ws_size | 2147483647 |
| wsrep_mode | |
| wsrep_mysql_replication_bundle | 0 |
| wsrep_node_address | |
| wsrep_node_incoming_address | AUTO |
| wsrep_node_name | hostname |
| wsrep_notify_cmd | |
| wsrep_on | OFF |
| wsrep_patch_version | wsrep_26.22 |
| wsrep_provider | none |
| wsrep_provider_options | |
| wsrep_recover | OFF |
| wsrep_reject_queries | NONE |
| wsrep_restart_slave | OFF |
| wsrep_retry_autocommit | 1 |
| wsrep_slave_fk_checks | ON |
| wsrep_slave_uk_checks | OFF |
| wsrep_slave_threads | 1 |
| wsrep_sst_auth | |
| wsrep_sst_donor | |
| wsrep_sst_donor_rejects_queries | OFF |
| wsrep_sst_method | rsync |
| wsrep_sst_receive_address | AUTO |
| wsrep_start_position | 00000000-0000-0000-0000-000000000000:-1 |
| wsrep_status_file | |
| wsrep_sync_wait | 0 |
| wsrep_trx_fragment_size | 0 |
| wsrep_trx_fragment_unit | bytes |
```

# Delete Sandboxes Only

```
./dbdeployer.sh delete-sandboxes

delete sandboxes only

dbdeployer delete all
List of deployed sandboxes:
/root/sandboxes/msb_maria10_11_2 
/root/sandboxes/msb_maria10_3_38 
/root/sandboxes/msb_maria10_4_28 
/root/sandboxes/msb_maria10_6_12 
/root/sandboxes/msb_oracle8_0_33 
Do you confirm? y/[N] Proceeding with deletion
Running /root/sandboxes/msb_maria10_11_2/send_kill destroy
Terminating the server immediately --- kill -9 1454892
Running rm -rf /root/sandboxes/msb_maria10_11_2
Directory /root/sandboxes/msb_maria10_11_2 deleted
Running /root/sandboxes/msb_maria10_3_38/send_kill destroy
Terminating the server immediately --- kill -9 1455129
Running rm -rf /root/sandboxes/msb_maria10_3_38
Directory /root/sandboxes/msb_maria10_3_38 deleted
Running /root/sandboxes/msb_maria10_4_28/send_kill destroy
Terminating the server immediately --- kill -9 1455388
Running rm -rf /root/sandboxes/msb_maria10_4_28
Directory /root/sandboxes/msb_maria10_4_28 deleted
Running /root/sandboxes/msb_maria10_6_12/send_kill destroy
Terminating the server immediately --- kill -9 1455650
Running rm -rf /root/sandboxes/msb_maria10_6_12
Directory /root/sandboxes/msb_maria10_6_12 deleted
Running /root/sandboxes/msb_oracle8_0_33/send_kill destroy
Terminating the server immediately --- kill -9 1455984
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