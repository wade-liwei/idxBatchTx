#!/bin/bash

N=${1}
DEST=${4:-"$PWD/conf"}
#dest=$DEST/node$N

offsetN=$(ls -l ${DEST} |grep "^d" | grep "node*" |  wc -l)

endN=$(($offsetN + $N))



for((i=$(hashrscli status | jq '.sync_info.latest_block_height' | bc);$i < 2;i=$(hashrscli status | jq '.sync_info.latest_block_height' | bc)));
do
  echo "waiting for chain up...... $i < 2"
  sleep 2
done


for i in $(seq $(($offsetN+1)) $endN)
do

      dest=$DEST/node$i
      mkdir -p $dest
      echo "Generating and init node dir for node$i"
      hashrsd init node$i --chain-id 200812 --home $dest
done


Node1Dir=$DEST/node1

for i in $(seq  $(($offsetN+1)) $endN)
do
    dest=$DEST/node$i
    if [ $i -ne 1 ] ; then
      rm -f $dest/config/genesis.json
      rm -f $dest/config/config.toml
      cp $Node1Dir/config/genesis.json  $dest/config/
      cp $Node1Dir/config/config.toml   $dest/config/
    fi
done
