#!/bin/bash

# run on master
ssh-keygen -t dsa -P '' -f ~/.ssh/id_dsa

SLAVES=`ls slaves | awk '{print $1}'`
for SLAVE in $SLAVES
do
    echo "Connecting to "$F
    scp ~/.ssh/id_dsa.pub ubuntu@$SLAVE:~/.ssh/id_dsa.pub
    ssh ubuntu@$SLAVE | 'cat ~/.ssh/id_dsa.pub >> ~/.ssh/authorized_keys'
    echo "Done to "$F
done
