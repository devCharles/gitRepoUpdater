current=${PWD}
yes="yes";
no="no";
clear
echo "---- GIT UPDATER ----"
echo "Do you want to update your repos in folder  $current ? (yes/no)";
read resp;
while [ "$resp" != "$yes" ] && [ "$resp" != "$no" ]; do
  echo "please write 'yes' or 'no'"
  read resp
done
if [ "$resp" == "$yes" ]; then
  clear
  echo "Do you want to update all repositories or want to decide per folder?"
  echo "1) update all"
  echo "2) ask me for each one"
  read op;
  opone="1";
  optwo="2"
  while [ "$op" != "$opone" ] && [ "$op" != "$optwo" ]; do
    echo "please choose a valid option"
    read op
  done
  if [ "$op" == "$opone" ]; then
    for d in */ ; do
      echo "---------------------------------------";
      echo ">>>>>>>>>>>>>>> UPDATING => $d ";
      echo "---------------------------------------";
      cd $d ;
      echo pwd;
      git fetch | echo ;
      git checkout develop | echo ;
      git pull | echo ;
      echo "<<<< UPDATED => $d "
      cd .. ;
    done
    echo "########################################";
    echo "············ FINISHED ··················";
    echo "########################################";
  elif [ "$op" == "$optwo" ];then
    for d in */ ; do
      echo "Do you want to update (yes/no)=> $d"
      read res;
      while [ "$res" != "$yes" ] && [ "$res" != "$no" ]; do
        echo "please write 'yes' or 'no'"
        read res
      done
      if [ "$res" == "$yes" ]; then
        echo "---------------------------------------";
        echo ">>>>>>>>>>>>>>> UPDATING => $d ";
        echo "---------------------------------------";
        cd $d ;
        echo pwd;
        git fetch | echo ;
        git checkout develop | echo ;
        git pull | echo ;
        echo "<<<< UPDATED => $d "
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
