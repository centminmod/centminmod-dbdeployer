#!/bin/bash
####################################################
# dbdeployer setup
####################################################
DEBUG=n
DBDEPLOY_PARENT_DIR='/root/opt/mysql'
DBDEPLOY_HOMEDIR='/home/dbdeployer'
INSTALL_DIR='/svr-setup'
dbdeploy_ver=1.72.0
percona_ver_latest=8.0.32-24
percona_ver=5.7.41-44
mdb_ver_eleven=10.11.2
mdb_ver_ten=10.10.3
mdb_ver_nine=10.9.5
mdb_ver_eight=10.8.7
mdb_ver_seven=10.7.8
mdb_ver_six=10.6.12
mdb_ver_five=10.5.19
mdb_ver_four=10.4.28
mdb_ver_three=10.3.38
mdb_ver_two=10.2.44
mdb_ver_one=10.1.48
oracle_ver_latest=8.0.33
oracle_ver=5.7.41

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
if [ ! -f /usr/lib/libncurses.so ]; then
  yum -q -y install ncurses-devel ncurses
fi
if [ ! -f /usr/lib64/libaio.so ]; then
  yum -q -y install libaio-devel libaio numactl-libs ncurses-compat-libs procps
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
  mkdir -p "$DBDEPLOY_PARENT_DIR"
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
  percona_ver_latest_short=$(echo "$percona_ver_latest" | awk -F '-' '{print $1}')
  percona_ver_short=$(echo "$percona_ver" | awk -F '-' '{print $1}')
  if [ ! -d "${DBDEPLOY_PARENT_DIR}/ps${percona_ver_latest_short}" ]; then
    echo
    echo "installing Percona binary tarballs"
    cd "$INSTALL_DIR"
    wget -4 -q https://downloads.percona.com/downloads/Percona-Server-LATEST/Percona-Server-${percona_ver_latest}/binary/tarball/Percona-Server-${percona_ver_latest}-Linux.x86_64.glibc${GLIBC_VER}-minimal.tar.gz -O Percona-Server-${percona_ver_latest}-Linux.x86_64.glibc${GLIBC_VER}-minimal.tar.gz
    dbdeployer unpack${VERBOSE_OPT} --prefix=ps Percona-Server-${percona_ver_latest}-Linux.x86_64.glibc${GLIBC_VER}-minimal.tar.gz
  fi

  # if [ ! -d "${DBDEPLOY_PARENT_DIR}/ps${percona_ver_short}" ]; then
  #   GLIBC_VER=2.17
  #   wget -4 -q https://downloads.percona.com/downloads/Percona-Server-5.7/Percona-Server-${percona_ver}/binary/tarball/Percona-Server-${percona_ver}-Linux.x86_64.glibc${GLIBC_VER}-minimal.tar.gz -O Percona-Server-${percona_ver}-Linux.x86_64.glibc${GLIBC_VER}-minimal.tar.gz
  #   dbdeployer unpack${VERBOSE_OPT} --prefix=ps Percona-Server-${percona_ver}-Linux.x86_64.glibc${GLIBC_VER}-minimal.tar.gz
  #   echo "dbdeployer versions"
  #   dbdeployer versions
  # fi
}


mariadb_install() {
  echo
  echo "installing MariaDB binary tarballs"
  # mdb_ver_array=("${mdb_ver_eleven}" "${mdb_ver_ten}" "${mdb_ver_nine}" "${mdb_ver_eight}" "${mdb_ver_seven}" "${mdb_ver_six}" "${mdb_ver_five}" "${mdb_ver_four}" "${mdb_ver_three}" "${mdb_ver_two}" "${mdb_ver_one}")
  mdb_ver_array=("${mdb_ver_six}" "${mdb_ver_five}" "${mdb_ver_four}" "${mdb_ver_three}")

  for mdb_v in "${mdb_ver_array[@]}"; do
    if [ ! -d "${DBDEPLOY_PARENT_DIR}/maria${mdb_v}" ]; then
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
    fi
  done
  echo "dbdeployer versions"
  dbdeployer versions
}

oracle_install() {
  GLIBC_VER=$(rpm -qa glibc | awk -F '-' '{print $2}' | head -n1)
  if [ ! -d "${DBDEPLOY_PARENT_DIR}/oracle${oracle_ver_latest}" ]; then
    echo
    echo "installing Oracle MySQL binary tarballs"
    cd "$INSTALL_DIR"

    if [[ "$GLIBC_VER" = '2.28' ]]; then
      wget -4 -q https://cdn.mysql.com/Downloads/MySQL-8.0/mysql-${oracle_ver_latest}-linux-glibc${GLIBC_VER}-x86_64.tar.gz -O mysql-${oracle_ver_latest}-linux-glibc${GLIBC_VER}-x86_64.tar.gz
      dbdeployer unpack${VERBOSE_OPT} --prefix=oracle mysql-${oracle_ver_latest}-linux-glibc${GLIBC_VER}-x86_64.tar.gz
    else
      wget -4 -q https://cdn.mysql.com/Downloads/MySQL-8.0/mysql-${oracle_ver_latest}-linux-glibc${GLIBC_VER}-x86_64-minimal.tar.xz -O mysql-${oracle_ver_latest}-linux-glibc${GLIBC_VER}-x86_64-minimal.tar.xz
      dbdeployer unpack${VERBOSE_OPT} --prefix=oracle mysql-${oracle_ver_latest}-linux-glibc${GLIBC_VER}-x86_64-minimal.tar.xz
    fi
    # pushd /root/sandboxes/msb_oracle8.0.16
    # ./my sqladmin var | tr -s ' '
    # ./my sql -e '\s'
    # ./metadata help
    # ./metadata version
    # ./metadata flavor
    # popd
  fi

  # GLIBC_VER=2.17
  # if [ ! -d "${DBDEPLOY_PARENT_DIR}/oracle${oracle_ver}" ]; then
  #   wget -4 -q https://downloads.mysql.com/archives/get/p/23/file/mysql-${oracle_ver}-linux-glibc${GLIBC_VER}-x86_64.tar.gz -O mysql-${oracle_ver}-linux-glibc${GLIBC_VER}-x86_64.tar.gz
  #   dbdeployer unpack${VERBOSE_OPT} --prefix=oracle mysql-${oracle_ver}-linux-glibc${GLIBC_VER}-x86_64.tar.gz
  #   # pushd /root/sandboxes/msb_oracle5.7.26
  #   # ./my sqladmin var | tr -s ' '
  #   # ./my sql -e '\s'
  #   # ./metadata help
  #   # ./metadata version
  #   # ./metadata flavor
  #   # popd
  # fi
  echo "dbdeployer versions"
  dbdeployer versions
}

oracle_shell() {
  if [ ! -f "${DBDEPLOY_PARENT_DIR}/oracle${oracle_ver_latest}/bin/mysqlsh" ]; then
    echo
    echo "installing Oracle MySQL Shell"
    cd "$INSTALL_DIR"
    GLIBC_VER=$(rpm -qa glibc | awk -F '-' '{print $2}' | head -n1)
    wget -4 -q https://cdn.mysql.com/Downloads/MySQL-Shell/mysql-shell-${oracle_ver_latest}-linux-glibc2.12-x86-64bit.tar.gz -O mysql-shell-${oracle_ver_latest}-linux-glibc2.12-x86-64bit.tar.gz
    dbdeployer unpack${VERBOSE_OPT} --shell --prefix=oracle mysql-shell-${oracle_ver_latest}-linux-glibc2.12-x86-64bit.tar.gz
  elif [ -f "${DBDEPLOY_PARENT_DIR}/oracle${oracle_ver_latest}/bin/mysqlsh" ]; then
    echo "${DBDEPLOY_PARENT_DIR}/oracle${oracle_ver_latest}/bin/mysqlsh already installed"
  fi
}

cmds() {
  mode="$1"
  echo
  echo "---------------------------------------------------------------"
  echo "dbdeployer installed binaries"
  echo "---------------------------------------------------------------"
  if [[ "$mode" = 'percona' || "$mode" = 'all' ]]; then
    echo -n "dbdeployer info version --flavor percona 8.0 = "
    dbdeployer info version --flavor percona 8.0
    #echo
    # echo -n "dbdeployer info version --flavor percona 5.7 = "
    # dbdeployer info version --flavor percona 5.7
  fi
  if [[ "$mode" = 'mariadb' || "$mode" = 'all' ]]; then
    #echo
    # echo -n "dbdeployer info version --flavor mariadb 10.11 = "
    # dbdeployer info version --flavor mariadb 10.11
    #echo
    # echo -n "dbdeployer info version --flavor mariadb 10.10 = "
    # dbdeployer info version --flavor mariadb 10.10
    # #echo
    # echo -n "dbdeployer info version --flavor mariadb 10.9 = "
    # dbdeployer info version --flavor mariadb 10.9
    # #echo
    # echo -n "dbdeployer info version --flavor mariadb 10.8 = "
    # dbdeployer info version --flavor mariadb 10.8
    # #echo
    # echo -n "dbdeployer info version --flavor mariadb 10.7 = "
    # dbdeployer info version --flavor mariadb 10.7
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
  fi
  if [[ "$mode" = 'oracle' || "$mode" = 'all' ]]; then
    echo -n "dbdeployer info version --flavor mysql 8.0 = "
    dbdeployer info version --flavor mysql 8.0
    #echo
    # echo -n "dbdeployer info version --flavor mysql 5.7 = "
    # dbdeployer info version --flavor mysql 5.7
    #echo
  fi
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

wipeall() {
  echo
  echo "wipe and restart"
  echo
  dbdeployer sandboxes | awk '{print $1}' | while read b; do
    echo
    echo "/root/sandboxes/$b/wipe_and_restart"
    /root/sandboxes/$b/wipe_and_restart
  done
}

resetbins() {
  echo
  echo "resetting bins"
  echo
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
  forced=$1
  if [[ "$forced" = force ]]; then
    force_opt=' --force'
  else
    force_opt=""
  fi
  echo "dbdeployer deploy single sandboxes"
  dbdeploy_bins=$(dbdeployer versions| grep -v 'Basedir' | xargs)
  declare -a arrays
  arrays=(${dbdeploy_bins})
  for b in "${arrays[@]}"; do
    echo
    echo "creating $b single sandbox instance"
    echo "dbdeployer deploy single $b --skip-library-check${force_opt} --socket-in-datadir"
    dbdeployer deploy single $b --skip-library-check${force_opt} --socket-in-datadir
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
    oracle_shell
    cmds all
    ;;
  install-mariadb )
    dbdeploy_install
    mariadb_install
    cmds mariadb
    ;;
  install-percona )
    dbdeploy_install
    percona_install
    cmds percona
    ;;
  install-oracle )
    dbdeploy_install
    oracle_install
    oracle_shell
    cmds oracle
    ;;
  update )
    dbdeploy_install update
    ;;
  wipe )
    wipeall
    ;;
  reset )
    resetall
    ;;
  reset-binary )
    resetbins
    ;;
  check )
    cmds
    ;;
  install-sandboxes )
    install_bins
    ;;
  install-sandboxes-force )
    install_bins force
    ;;
  * )
    echo
    echo "usage:"
    echo
    echo "$0 {install|install-mariadb|install-percona|install-oracle|update|wipe|reset|reset-binary|check|install-sandboxes|install-sandboxes-force}"
    ;;
esac