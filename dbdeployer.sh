#!/bin/bash
##########################
# dbdeployer setup
##########################
INSTALL_DIR='/svr-setup'
dbdeploy_ver=1.30.1
percona_ver_latest=8.0.15-6
percona_ver=5.7.26-29
mdb_ver_four=10.4.5
mdb_ver_three=10.3.15
mdb_ver_two=10.2.24
mdb_ver_one=10.1.40
oracle_ver_latest=8.0.16
oracle_ver=5.7.26

dbdeploy_install() {
  mode=$1
  if [[ "$mode" = 'update' ]]; then
    installtxt=updating
  else
    installtxt=installing
  fi
  echo
  echo "$installtxt dbdeployer"
  cd "$INSTALL_DIR"
  if [ ! -f "dbdeployer-${dbdeploy_ver}.linux.tar.gz" ]; then
    wget -4 https://github.com/datacharmer/dbdeployer/releases/download/v${dbdeploy_ver}/dbdeployer-${dbdeploy_ver}.linux.tar.gz
    tar xzvf dbdeployer-${dbdeploy_ver}.linux.tar.gz
    chmod +x dbdeployer-${dbdeploy_ver}.linux
  fi
  mv -f dbdeployer-${dbdeploy_ver}.linux /usr/local/bin/dbdeployer
  mkdir -p /root/opt/mysql
  echo
  echo "dbdeployer defaults show"
  dbdeployer defaults show
  echo
  echo "dbdeployer remote list"
  dbdeployer remote list
  echo
  echo "dbdeployer -h"
  dbdeployer -h
  echo
  echo "dbdeployer --version"
  dbdeployer --version
}

percona_install() {
  echo
  echo "installing Percona source tarballs"
  cd "$INSTALL_DIR"
  wget -4 https://www.percona.com/downloads/Percona-Server-LATEST/Percona-Server-${percona_ver_latest}/binary/tarball/Percona-Server-${percona_ver_latest}-Linux.x86_64.ssl.tar.gz -O Percona-Server-${percona_ver_latest}-Linux.x86_64.ssl.tar.gz
  dbdeployer unpack --prefix=ps Percona-Server-${percona_ver_latest}-Linux.x86_64.ssl.tar.gz
  # pushd /root/sandboxes/msb_ps8_0_15
  # ./my sqladmin var | tr -s ' '
  # ./my sqladmin ver
  # ./metadata help
  # ./metadata version
  # ./metadata flavor
  # popd

  wget -4 https://www.percona.com/downloads/Percona-Server-5.7/Percona-Server-${percona_ver}/binary/tarball/Percona-Server-${percona_ver}-Linux.x86_64.ssl101.tar.gz -O Percona-Server-${percona_ver}-Linux.x86_64.ssl101.tar.gz
  dbdeployer unpack --prefix=ps Percona-Server-${percona_ver}-Linux.x86_64.ssl101.tar.gz
  dbdeployer versions
  # pushd /root/sandboxes/msb_ps5.7.26
  # ./my sqladmin var | tr -s ' '
  # ./my sqladmin ver
  # ./metadata help
  # ./metadata version
  # ./metadata flavor
  # popd
}

mariadb_install() {
  echo
  echo "installing MariaDB source tarballs"
  cd "$INSTALL_DIR"
  wget -4 https://downloads.mariadb.org/interstitial/mariadb-${mdb_ver_four}/bintar-linux-glibc_214-x86_64/mariadb-${mdb_ver_four}-linux-glibc_214-x86_64.tar.gz/from/http%3A//nyc2.mirrors.digitalocean.com/mariadb/ -O mariadb-${mdb_ver_four}-linux-glibc_214-x86_64.tar.gz
  dbdeployer unpack --prefix=maria mariadb-${mdb_ver_four}-linux-glibc_214-x86_64.tar.gz
  # pushd /root/sandboxes/msb_maria10.4.5
  # ./my sqladmin var | tr -s ' '
  # ./my sqladmin ver
  # ./metadata help
  # ./metadata version
  # ./metadata flavor
  # popd

  wget -4 https://downloads.mariadb.org/interstitial/mariadb-${mdb_ver_three}/bintar-linux-x86_64/mariadb-${mdb_ver_three}-linux-x86_64.tar.gz/from/http%3A//sfo1.mirrors.digitalocean.com/mariadb/ -O mariadb-${mdb_ver_three}-linux-x86_64.tar.gz
  dbdeployer unpack --prefix=maria mariadb-${mdb_ver_three}-linux-x86_64.tar.gz
  # pushd /root/sandboxes/msb_maria10.3.15
  # ./my sqladmin var | tr -s ' '
  # ./my sqladmin ver
  # ./metadata help
  # ./metadata version
  # ./metadata flavor
  # popd

  wget -4 https://downloads.mariadb.org/interstitial/mariadb-${mdb_ver_two}/bintar-linux-x86_64/mariadb-${mdb_ver_two}-linux-x86_64.tar.gz/from/http%3A//sfo1.mirrors.digitalocean.com/mariadb/ -O mariadb-${mdb_ver_two}-linux-x86_64.tar.gz
  dbdeployer unpack --prefix=maria mariadb-${mdb_ver_two}-linux-x86_64.tar.gz
  # pushd /root/sandboxes/msb_maria10.2.24
  # ./my sqladmin var | tr -s ' '
  # ./my sqladmin ver
  # ./metadata help
  # ./metadata version
  # ./metadata flavor
  # popd

  wget -4 https://downloads.mariadb.org/interstitial/mariadb-${mdb_ver_one}/bintar-linux-x86_64/mariadb-${mdb_ver_one}-linux-x86_64.tar.gz/from/http%3A//sfo1.mirrors.digitalocean.com/mariadb/ -O mariadb-${mdb_ver_one}-linux-x86_64.tar.gz
  dbdeployer unpack --prefix=maria mariadb-${mdb_ver_one}-linux-x86_64.tar.gz
  # pushd /root/sandboxes/msb_maria10.1.40
  # ./my sqladmin var | tr -s ' '
  # ./my sqladmin ver
  # ./metadata help
  # ./metadata version
  # ./metadata flavor
  # popd
  dbdeployer versions
}

oracle_install() {
  echo
  echo "installing Oracle MySQL source tarballs"
  cd "$INSTALL_DIR"
  dbdeployer remote download mysql-${oracle_ver_latest}
  dbdeployer unpack --prefix=oracle mysql-${oracle_ver_latest}.tar.xz
  # pushd /root/sandboxes/msb_oracle8.0.16
  # ./my sqladmin var | tr -s ' '
  # ./my sqladmin ver
  # ./metadata help
  # ./metadata version
  # ./metadata flavor
  # popd

  dbdeployer remote download mysql-${oracle_ver}
  dbdeployer unpack --prefix=oracle mysql-${oracle_ver}.tar.xz
  # pushd /root/sandboxes/msb_oracle5.7.26
  # ./my sqladmin var | tr -s ' '
  # ./my sqladmin ver
  # ./metadata help
  # ./metadata version
  # ./metadata flavor
  # popd
  dbdeployer versions
}

cmds() {
  echo
  echo "dbdeployer info version --flavor percona 8.0"
  dbdeployer info version --flavor percona 8.0
  echo
  echo "dbdeployer info version --flavor percona 5.7"
  dbdeployer info version --flavor percona 5.7
  echo
  echo "dbdeployer info version --flavor mariadb 10.4"
  dbdeployer info version --flavor mariadb 10.4
  echo
  echo "dbdeployer info version --flavor mariadb 10.3"
  dbdeployer info version --flavor mariadb 10.3
  echo
  echo "dbdeployer info version --flavor mariadb 10.2"
  dbdeployer info version --flavor mariadb 10.2
  echo
  echo "dbdeployer info version --flavor mariadb 10.1"
  dbdeployer info version --flavor mariadb 10.1
  echo
  echo "dbdeployer info version --flavor mysql 8.0"
  dbdeployer info version --flavor mysql 8.0
  echo
  echo "dbdeployer info version --flavor mysql 5.7"
  dbdeployer info version --flavor mysql 5.7
  echo
  if [[ "$(dbdeployer sandboxes)" ]]; then
    dbdeployer global use "select @@server_id, @@port, @@server_uuid"
  fi
}

resetall() {
  echo
  echo "resetting all"
  echo
  echo "dbdeployer delete all"
  dbdeployer delete all
  dbdeploy_bins=$(dbdeployer versions| grep -v 'Basedir' | xargs)
  declare -a arrays
  arrays=(${dbdeploy_bins})
  for b in "${arrays[@]}"; do
    echo
    echo "dbdeployer delete-binaries $b"
    echo y | dbdeployer delete-binaries $b
  done
}

case "$1" in
  install )
    dbdeploy_install
    percona_install
    mariadb_install
    oracle_install
    cmds
    ;;
  update )
    dbdeploy_install update
    ;;
  reset )
    resetall
    ;;
  check )
    cmds
    ;;
  * )
    echo
    echo "usage:"
    echo
    echo "$0 {install|update|reset|check}"
    ;;
esac