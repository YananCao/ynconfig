#!/bin/bash
######################
# 自动配置hosts内容  #
######################
if [ -d ~/git/hosts ]
then
    chdir ~/git/hosts
    git pull origin master
else
    chdir ~/git
    git clone https://github.com/racaljk/hosts.git
fi

chdir ~/git/ynconfig
cp -rf /etc/hosts hosts.bak
cat myhosts ~/git/hosts/hosts > hosts
sudo cp -rf hosts /etc/hosts
