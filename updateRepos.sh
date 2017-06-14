#!/bin/bash

update(){
  dir=$1;
  echo "---------------------------------------";
  echo ">>>>>>>>>>>>>>> UPDATING => $dir ";
  echo "---------------------------------------";
  cd $dir ;
  echo ${PWD}
  git fetch | echo ;
  git checkout develop | echo ;
  git pull | echo ;
  echo "<<<< UPDATED => $dir "
  cd .. ;
}

current=${PWD}
yes="yes";
no="no";
clear

if [ "$1" == "-a" ] || [ "$1" == "all" ]; then
  echo "all :D"
elif [ "$1" == "-e" ] || [ "$1" == "each" ]; then
  echo "each :D"
else
  echo "ninguno :("
fi

echo "---- GIT UPDATER ----"
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
      update $d;
    done
    echo "########################################";
    echo "············ FINISHED ··················";
    echo "########################################";
    echo "\nSEE YOU LATER BRO..."
  elif [ "$op" == "$optwo" ];then
    for d in */ ; do
      echo "Do you want to update => $d  (yes/no)"
      read -p ">>> " res
      while [ "$res" != "$yes" ] && [ "$res" != "$no" ]; do
        echo "please write 'yes' or 'no'"
        read -p ">>> " res
      done
      if [ "$res" == "$yes" ]; then
        update $d;
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
