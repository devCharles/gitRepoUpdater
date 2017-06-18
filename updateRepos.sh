#!/bin/bash

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
  echo -e "$text"
}

update(){
  dir=$1;
  cd $dir ;
  if [ -d .git ]; then
    cecho b ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    cecho b ">>>>>>>>>>>>>>> UPDATING => $dir ";
    cecho c "$(git fetch)";
    git rev-parse --verify develop
    if [ "$?" == "0" ]; then
      cecho c "$(git checkout 'develop')";
      cecho c "branch develop will be updated"
    else
      git rev-parse --verify develop
      # git rev-parse --verify master
      if [ "$?" == "0" ]; then
        cecho c "$(git checkout 'master')";
        cecho c "branch master will be updated"
      fi
    fi
    cecho c "$(git pull)";
    cecho b "<<<<<<<<<<<<<<< UPDATED => $dir "
    cecho b "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<\n"
  else
    cecho y "#### $PWD does not contains a git repositori"
  fi
  cd .. ;
}

finish(){
  cecho g "########################################";
  cecho g "············ FINISHED ··················";
  cecho g "########################################";
  cecho g "\nSEE YOU LATER BRO..."
}

gitName=".git";
clear
cecho g "\t\t---- GIT UPDATER ----"
if [ "$1" == "-a" ] || [ "$1" == "all" ]; then
  cecho p "\tALL GIT REPOS WILL BE UPDATED\n"
  for d in */ ; do
    echo "X"
    update $d;
  done
  finish
elif [ "$1" == "-e" ] || [ "$1" == "each" ]; then
  for d in */ ; do
    cecho y "Do you want to update => $d  (yes/no)"
    read -p ">>> " res
    while [ "$res" != "yes" ] && [ "$res" != "no" ]; do
      cecho r "please write 'yes' or 'no'"
      read -p ">>> " res
    done
    if [ "$res" == "$yes" ]; then
      update $d;
    else
      cecho y "$d Was not updated"
    fi
  done
  finish
else

  cecho y "Do you want to update your repos in folder  ${PWD} ? (yes/no)";
  read -p ">>> " resp
  while [ "$resp" != "yes" ] && [ "$resp" != "no" ]; do
    cecho r "please write 'yes' or 'no'"
    read -p ">>> " resp
  done

  if [ "$resp" == "yes" ]; then
    clear
    cecho y "Do you want to update all repositories or want to decide per folder?"
    cecho y "1) update all"
    cecho y "2) ask me for each one"
    read -p ">>> " op;
    opone="1";
    optwo="2"
    while [ "$op" != "$opone" ] && [ "$op" != "$optwo" ]; do
      cecho r "please choose a valid option"
      read -p ">>> " op;
    done
    if [ "$op" == "$opone" ]; then
      for d in */ ; do
        update $d;
      done
    finish;
    elif [ "$op" == "$optwo" ];then
      for d in */ ; do
        cecho y "Do you want to update => $d  (yes/no)"
        read -p ">>> " res
        while [ "$res" != "yes" ] && [ "$res" != "no" ]; do
          cecho r "please write 'yes' or 'no'"
          read -p ">>> " res
        done
        if [ "$res" == "yes" ]; then
          update $d;
        else
          cecho y "$d Was not updated"
        fi
      done
    finish
    fi
  elif [ "$resp" == "no" ]; then
    cecho p "WELL.. see you later bro!!!"
  else
    cecho r "please write 'yes' or 'no'";
  fi
fi
