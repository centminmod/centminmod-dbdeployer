#!/bin/bash
####################################################
# dbdeployer setup
####################################################
DBDEPLOY_HOMEDIR='/home/dbdeployer'
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
####################################################
if [ ! -d "$DBDEPLOY_HOMEDIR" ]; then
  mkdir -p "$DBDEPLOY_HOMEDIR"
fi
####################################################
# functions

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
    wget -4 -q https://github.com/datacharmer/dbdeployer/releases/download/v${dbdeploy_ver}/dbdeployer-${dbdeploy_ver}.linux.tar.gz
    tar xzvf dbdeployer-${dbdeploy_ver}.linux.tar.gz
    chmod +x dbdeployer-${dbdeploy_ver}.linux
    mv -f dbdeployer-${dbdeploy_ver}.linux /usr/local/bin/dbdeployer
  fi
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
  echo "installing Percona binary tarballs"
  cd "$INSTALL_DIR"
  wget -4 -q https://www.percona.com/downloads/Percona-Server-LATEST/Percona-Server-${percona_ver_latest}/binary/tarball/Percona-Server-${percona_ver_latest}-Linux.x86_64.ssl.tar.gz -O Percona-Server-${percona_ver_latest}-Linux.x86_64.ssl.tar.gz
  dbdeployer unpack --prefix=ps Percona-Server-${percona_ver_latest}-Linux.x86_64.ssl.tar.gz
  # pushd /root/sandboxes/msb_ps8_0_15
  # ./my sqladmin var | tr -s ' '
  # ./my sql -e '\s'
  # ./metadata help
  # ./metadata version
  # ./metadata flavor
  # popd

  wget -4 -q https://www.percona.com/downloads/Percona-Server-5.7/Percona-Server-${percona_ver}/binary/tarball/Percona-Server-${percona_ver}-Linux.x86_64.ssl101.tar.gz -O Percona-Server-${percona_ver}-Linux.x86_64.ssl101.tar.gz
  dbdeployer unpack --prefix=ps Percona-Server-${percona_ver}-Linux.x86_64.ssl101.tar.gz
  dbdeployer versions
  # pushd /root/sandboxes/msb_ps5.7.26
  # ./my sqladmin var | tr -s ' '
  # ./my sql -e '\s'
  # ./metadata help
  # ./metadata version
  # ./metadata flavor
  # popd
}

mariadb_install() {
  echo
  echo "installing MariaDB binary tarballs"
  cd "$INSTALL_DIR"
  wget -4 -q https://downloads.mariadb.org/interstitial/mariadb-${mdb_ver_four}/bintar-linux-glibc_214-x86_64/mariadb-${mdb_ver_four}-linux-glibc_214-x86_64.tar.gz/from/http%3A//nyc2.mirrors.digitalocean.com/mariadb/ -O mariadb-${mdb_ver_four}-linux-glibc_214-x86_64.tar.gz
  dbdeployer unpack --prefix=maria mariadb-${mdb_ver_four}-linux-glibc_214-x86_64.tar.gz
  # pushd /root/sandboxes/msb_maria10.4.5
  # ./my sqladmin var | tr -s ' '
  # ./my sql -e '\s'
  # ./metadata help
  # ./metadata version
  # ./metadata flavor
  # popd

  wget -4 -q https://downloads.mariadb.org/interstitial/mariadb-${mdb_ver_three}/bintar-linux-x86_64/mariadb-${mdb_ver_three}-linux-x86_64.tar.gz/from/http%3A//sfo1.mirrors.digitalocean.com/mariadb/ -O mariadb-${mdb_ver_three}-linux-x86_64.tar.gz
  dbdeployer unpack --prefix=maria mariadb-${mdb_ver_three}-linux-x86_64.tar.gz
  # pushd /root/sandboxes/msb_maria10.3.15
  # ./my sqladmin var | tr -s ' '
  # ./my sql -e '\s'
  # ./metadata help
  # ./metadata version
  # ./metadata flavor
  # popd

  wget -4 -q https://downloads.mariadb.org/interstitial/mariadb-${mdb_ver_two}/bintar-linux-x86_64/mariadb-${mdb_ver_two}-linux-x86_64.tar.gz/from/http%3A//sfo1.mirrors.digitalocean.com/mariadb/ -O mariadb-${mdb_ver_two}-linux-x86_64.tar.gz
  dbdeployer unpack --prefix=maria mariadb-${mdb_ver_two}-linux-x86_64.tar.gz
  # pushd /root/sandboxes/msb_maria10.2.24
  # ./my sqladmin var | tr -s ' '
  # ./my sql -e '\s'
  # ./metadata help
  # ./metadata version
  # ./metadata flavor
  # popd

  wget -4 -q https://downloads.mariadb.org/interstitial/mariadb-${mdb_ver_one}/bintar-linux-x86_64/mariadb-${mdb_ver_one}-linux-x86_64.tar.gz/from/http%3A//sfo1.mirrors.digitalocean.com/mariadb/ -O mariadb-${mdb_ver_one}-linux-x86_64.tar.gz
  dbdeployer unpack --prefix=maria mariadb-${mdb_ver_one}-linux-x86_64.tar.gz
  # pushd /root/sandboxes/msb_maria10.1.40
  # ./my sqladmin var | tr -s ' '
  # ./my sql -e '\s'
  # ./metadata help
  # ./metadata version
  # ./metadata flavor
  # popd
  dbdeployer versions
}

oracle_install() {
  echo
  echo "installing Oracle MySQL binary tarballs"
  cd "$INSTALL_DIR"
  dbdeployer remote download mysql-${oracle_ver_latest}
  dbdeployer unpack --prefix=oracle mysql-${oracle_ver_latest}.tar.xz
  # pushd /root/sandboxes/msb_oracle8.0.16
  # ./my sqladmin var | tr -s ' '
  # ./my sql -e '\s'
  # ./metadata help
  # ./metadata version
  # ./metadata flavor
  # popd

  dbdeployer remote download mysql-${oracle_ver}
  dbdeployer unpack --prefix=oracle mysql-${oracle_ver}.tar.xz
  # pushd /root/sandboxes/msb_oracle5.7.26
  # ./my sqladmin var | tr -s ' '
  # ./my sql -e '\s'
  # ./metadata help
  # ./metadata version
  # ./metadata flavor
  # popd
  dbdeployer versions
}

cmds() {
  echo
  echo "---------------------------------------------------------------"
  echo "dbdeployer installed binaries"
  echo "---------------------------------------------------------------"
  echo -n "dbdeployer info version --flavor percona 8.0 = "
  dbdeployer info version --flavor percona 8.0
  #echo
  echo -n "dbdeployer info version --flavor percona 5.7 = "
  dbdeployer info version --flavor percona 5.7
  #echo
  echo -n "dbdeployer info version --flavor mariadb 10.4 = "
  dbdeployer info version --flavor mariadb 10.4
  #echo
  echo -n "dbdeployer info version --flavor mariadb 10.3 = "
  dbdeployer info version --flavor mariadb 10.3
  #echo
  echo -n "dbdeployer info version --flavor mariadb 10.2 = "
  dbdeployer info version --flavor mariadb 10.2
  #echo
  echo -n "dbdeployer info version --flavor mariadb 10.1 = "
  dbdeployer info version --flavor mariadb 10.1
  #echo
  echo -n "dbdeployer info version --flavor mysql 8.0 = "
  dbdeployer info version --flavor mysql 8.0
  #echo
  echo -n "dbdeployer info version --flavor mysql 5.7 = "
  dbdeployer info version --flavor mysql 5.7
  #echo
  if [[ "$(dbdeployer sandboxes)" ]]; then
    echo
    echo "---------------------------------------------------------------"
    echo "dbdeployer sandboxes"
    echo "---------------------------------------------------------------"
    dbdeployer sandboxes
    echo
    echo "---------------------------------------------------------------"
    echo "sandbox info"
    echo "---------------------------------------------------------------"
    dbdeployer sandboxes | awk '{print $1}' | while read d; do
      echo
      echo "/root/sandboxes/$d/my sql -e '\s'"
      /root/sandboxes/$d/my sql -e '\s'
      # echo
      echo "saving $d variables to $DBDEPLOY_HOMEDIR/${d}-variables.txt"
      echo "/root/sandboxes/$d/my sqladmin var"
      /root/sandboxes/$d/my sqladmin var | tr -s ' ' | sed -e 's|+-||g' -e 's|-+||g' -e 's|--||g' > "$DBDEPLOY_HOMEDIR/${d}-variables.txt"
      echo "---------------------------------------------------------------"
    done
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

install_bins() {
  echo "dbdeployer deploy single sandboxes"
  dbdeploy_bins=$(dbdeployer versions| grep -v 'Basedir' | xargs)
  declare -a arrays
  arrays=(${dbdeploy_bins})
  for b in "${arrays[@]}"; do
    echo
    echo "creating $b single sandbox instance"
    echo "dbdeployer deploy single $b"
    dbdeployer deploy single $b
  done
  echo
  echo "dbdeployer sandboxes"
  dbdeployer sandboxes
  echo
  echo "sandbox info"
  dbdeployer sandboxes | awk '{print $1}' | while read d; do
    echo
    echo "/root/sandboxes/$d/my sql -e '\s'"
    /root/sandboxes/$d/my sql -e '\s'
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
  install-sandboxes )
    install_bins
    ;;
  * )
    echo
    echo "usage:"
    echo
    echo "$0 {install|update|reset|check|install-sandboxes}"
    ;;
esac