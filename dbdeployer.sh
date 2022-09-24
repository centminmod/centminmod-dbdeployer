#!/bin/bash
####################################################
# dbdeployer setup
####################################################
DEBUG=n
DBDEPLOY_HOMEDIR='/home/dbdeployer'
INSTALL_DIR='/svr-setup'
dbdeploy_ver=1.69.2
percona_ver_latest=8.0.29-21
percona_ver=5.7.39-42
mdb_ver_eleven=10.11.1
mdb_ver_ten=10.10.1
mdb_ver_nine=10.9.3
mdb_ver_eight=10.8.5
mdb_ver_seven=10.7.6
mdb_ver_six=10.6.10
mdb_ver_five=10.5.17
mdb_ver_four=10.4.26
mdb_ver_three=10.3.36
mdb_ver_two=10.2.44
mdb_ver_one=10.1.48
oracle_ver_latest=8.0.30
oracle_ver=5.7.38

MARIADB_MIRROR='mirror.rackspace.com'
####################################################
if [ ! -d "$DBDEPLOY_HOMEDIR" ]; then
  mkdir -p "$DBDEPLOY_HOMEDIR"
fi
if [ ! -d "$INSTALL_DIR" ]; then
  mkdir -p "$INSTALL_DIR"
fi
if [ ! -f /usr/bin/tar ]; then
  yum -q -y install tar
fi
if [[ "$DBEUG" = [yY] ]]; then
  VERBOSE_OPT=' --verbosity 1'
else
  VERBOSE_OPT=' --verbosity 0'
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
  if [[ ! -f "dbdeployer-${dbdeploy_ver}.linux.tar.gz" || ! -f /usr/local/bin/dbdeployer ]]; then
    wget -4 -q https://github.com/datacharmer/dbdeployer/releases/download/v${dbdeploy_ver}/dbdeployer-${dbdeploy_ver}.linux.tar.gz
    tar xzvf dbdeployer-${dbdeploy_ver}.linux.tar.gz
    chmod +x dbdeployer-${dbdeploy_ver}.linux
    mv -f dbdeployer-${dbdeploy_ver}.linux /usr/local/bin/dbdeployer
    chown root:root /usr/local/bin/dbdeployer
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
  GLIBC_VER=$(rpm -qa glibc | awk -F '-' '{print $2}' | head -n1)
  echo
  echo "installing Percona binary tarballs"
  cd "$INSTALL_DIR"
  wget -4 -q https://downloads.percona.com/downloads/Percona-Server-LATEST/Percona-Server-${percona_ver_latest}/binary/tarball/Percona-Server-${percona_ver_latest}-Linux.x86_64.glibc${GLIBC_VER}-minimal.tar.gz -O Percona-Server-${percona_ver_latest}-Linux.x86_64.glibc${GLIBC_VER}-minimal.tar.gz
  dbdeployer unpack${VERBOSE_OPT} --prefix=ps Percona-Server-${percona_ver_latest}-Linux.x86_64.glibc${GLIBC_VER}-minimal.tar.gz
  # pushd /root/sandboxes/msb_ps8_0_15
  # ./my sqladmin var | tr -s ' '
  # ./my sql -e '\s'
  # ./metadata help
  # ./metadata version
  # ./metadata flavor
  # popd

  GLIBC_VER=2.17
  wget -4 -q https://downloads.percona.com/downloads/Percona-Server-5.7/Percona-Server-${percona_ver}/binary/tarball/Percona-Server-${percona_ver}-Linux.x86_64.glibc${GLIBC_VER}-minimal.tar.gz -O Percona-Server-${percona_ver}-Linux.x86_64.glibc${GLIBC_VER}-minimal.tar.gz
  dbdeployer unpack${VERBOSE_OPT} --prefix=ps Percona-Server-${percona_ver}-Linux.x86_64.glibc${GLIBC_VER}-minimal.tar.gz
  echo "dbdeployer versions"
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
  # mdb_ver_array=("${mdb_ver_eleven}" "${mdb_ver_ten}" "${mdb_ver_nine}" "${mdb_ver_eight}" "${mdb_ver_seven}" "${mdb_ver_six}" "${mdb_ver_five}" "${mdb_ver_four}" "${mdb_ver_three}" "${mdb_ver_two}" "${mdb_ver_one}")
  mdb_ver_array=("${mdb_ver_ten}" "${mdb_ver_nine}" "${mdb_ver_eight}" "${mdb_ver_seven}" "${mdb_ver_six}" "${mdb_ver_five}" "${mdb_ver_four}" "${mdb_ver_three}")

  for mdb_v in "${mdb_ver_array[@]}"; do
    cd "$INSTALL_DIR"
    wget -4 -q https://${MARIADB_MIRROR}/mariadb/mariadb-${mdb_v}/bintar-linux-systemd-x86_64/mariadb-${mdb_v}-linux-systemd-x86_64.tar.gz -O mariadb-${mdb_v}-linux-systemd-x86_64.tar.gz
    dbdeployer unpack${VERBOSE_OPT} --prefix=maria mariadb-${mdb_v}-linux-systemd-x86_64.tar.gz
    # pushd /root/sandboxes/msb_maria${mdb_v}
    # ./my sqladmin var | tr -s ' '
    # ./my sql -e '\s'
    # ./metadata help
    # ./metadata version
    # ./metadata flavor
    # popd
  done
  echo "dbdeployer versions"
  dbdeployer versions
}

oracle_install() {
  echo
  echo "installing Oracle MySQL binary tarballs"
  cd "$INSTALL_DIR"
  wget -4 -q https://dev.mysql.com/get/Downloads/MySQL-8.0/mysql-${oracle_ver_latest}-linux-glibc2.17-x86_64-minimal.tar.xz -O mysql-${oracle_ver_latest}-linux-glibc2.17-x86_64-minimal.tar.xz
  dbdeployer unpack${VERBOSE_OPT} --prefix=oracle mysql-${oracle_ver_latest}-linux-glibc2.17-x86_64-minimal.tar.xz
  # pushd /root/sandboxes/msb_oracle8.0.16
  # ./my sqladmin var | tr -s ' '
  # ./my sql -e '\s'
  # ./metadata help
  # ./metadata version
  # ./metadata flavor
  # popd

  wget -4 -q https://downloads.mysql.com/archives/get/p/23/file/mysql-${oracle_ver}-linux-glibc2.12-x86_64.tar.gz -O mysql-${oracle_ver}-linux-glibc2.12-x86_64.tar.gz
  dbdeployer unpack${VERBOSE_OPT} --prefix=oracle mysql-${oracle_ver}-linux-glibc2.12-x86_64.tar.gz
  # pushd /root/sandboxes/msb_oracle5.7.26
  # ./my sqladmin var | tr -s ' '
  # ./my sql -e '\s'
  # ./metadata help
  # ./metadata version
  # ./metadata flavor
  # popd
  echo "dbdeployer versions"
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
  # echo -n "dbdeployer info version --flavor mariadb 10.11 = "
  # dbdeployer info version --flavor mariadb 10.11
  #echo
  echo -n "dbdeployer info version --flavor mariadb 10.10 = "
  dbdeployer info version --flavor mariadb 10.10
  #echo
  echo -n "dbdeployer info version --flavor mariadb 10.9 = "
  dbdeployer info version --flavor mariadb 10.9
  #echo
  echo -n "dbdeployer info version --flavor mariadb 10.8 = "
  dbdeployer info version --flavor mariadb 10.8
  #echo
  echo -n "dbdeployer info version --flavor mariadb 10.7 = "
  dbdeployer info version --flavor mariadb 10.7
  #echo
  echo -n "dbdeployer info version --flavor mariadb 10.6 = "
  dbdeployer info version --flavor mariadb 10.6
  #echo
  echo -n "dbdeployer info version --flavor mariadb 10.5 = "
  dbdeployer info version --flavor mariadb 10.5
  #echo
  echo -n "dbdeployer info version --flavor mariadb 10.4 = "
  dbdeployer info version --flavor mariadb 10.4
  #echo
  echo -n "dbdeployer info version --flavor mariadb 10.3 = "
  dbdeployer info version --flavor mariadb 10.3
  #echo
  # echo -n "dbdeployer info version --flavor mariadb 10.2 = "
  # dbdeployer info version --flavor mariadb 10.2
  # #echo
  # echo -n "dbdeployer info version --flavor mariadb 10.1 = "
  # dbdeployer info version --flavor mariadb 10.1
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