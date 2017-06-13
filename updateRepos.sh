#!/bin/bash

# function to print in color
cecho() {
  local code="\033["
  case "$1" in
    black  | bk) color="${code}0;30m";;
    red    |  r) color="${code}1;31m";;
    green  |  g) color="${code}1;32m";;
    yellow |  y) color="${code}1;33m";;
    blue   |  b) color="${code}1;34m";;
    purple |  p) color="${code}1;35m";;
    cyan   |  c) color="${code}1;36m";;
    gray   | gr) color="${code}0;37m";;
    *) local text="$1"
  esac
  [ -z "$text" ] && local text="$color$2${code}0m"
  echo "$text"
}

current=${PWD}
yes="yes";
no="no";
clear
echo
cecho g "\n\t\t\t\t\t---- GIT UPDATER ----\n"
echo "Do you want to update your repos in folder  $current ? (yes/no)";
read -p ">>> " resp
while [ "$resp" != "$yes" ] && [ "$resp" != "$no" ]; do
  echo "please write 'yes' or 'no'"
  read -p ">>> " resp
done
if [ "$resp" == "$yes" ]; then
  clear
  echo "Do you want to update all repositories or want to decide per folder?"
  echo "1) update all"
  echo "2) ask me for each one"
  read -p ">>> " op;
  opone="1";
  optwo="2"
  while [ "$op" != "$opone" ] && [ "$op" != "$optwo" ]; do
    echo "please choose a valid option"
    read -p ">>> " op;
  done
  if [ "$op" == "$opone" ]; then
    for d in */ ; do
      cecho b "---------------------------------------";
      cecho b ">>>>>>>>>>>>>>> UPDATING => $d ";
      cecho b "---------------------------------------";
      cd $d ;
      git fetch | echo ;
      git checkout develop | echo ;
      git pull | echo ;
      cecho g "<<<< UPDATED => $d "
      cd .. ;
    done
    cecho g "########################################";
    cecho g "············ FINISHED ··················";
    cecho g "########################################";
    cecho g "\nSEE YOU LATER BRO..."
  elif [ "$op" == "$optwo" ];then
    for d in */ ; do
      echo "Do you want to update => $d  (yes/no)"
      read -p ">>> " res
      while [ "$res" != "$yes" ] && [ "$res" != "$no" ]; do
        echo "please write 'yes' or 'no'"
        read -p ">>> " res
      done
      if [ "$res" == "$yes" ]; then
        cecho b "---------------------------------------";
        cecho b ">>>>>>>>>>>>>>> UPDATING => $d ";
        cecho b "---------------------------------------";
        cd $d ;
        git fetch | echo ;
        git checkout develop | echo  ;
        git pull | echo  ;
        cecho g "<<<< UPDATED => $d "
        cd .. ;
      else
        echo "$d Was not updated"
      fi
    done
    echo "########################################";
    echo "············ FINISHED ··················";
    echo "########################################";
  fi
elif [ "$resp" == "$no" ]; then
  echo "WELL.. see you later bro!!!"
else
  echo "please write 'yes' or 'no'";
fi
