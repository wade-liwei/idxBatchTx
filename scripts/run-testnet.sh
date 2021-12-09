#!/bin/bash

set -eux

N=${1:-4}
Join=${2:-false}
MPWD=$(pwd)
DEST=${4:-"$PWD/conf"}


endN=$(ls -l ${DEST} |grep "^d" | grep "node*" |  wc -l)
offsetN=$(($endN - $N))


if ${Join} ; then

    for i in $(seq $(($offsetN+1)) $endN)
    do
      idx=$(((($i-1))*10))
      echo $idx
      docker run -d --name=node$i --net=nameservicenet -e "ID=$i"  --ip=172.77.5.$i  -p $((26656+$idx)):26656 -p $((26657+$idx)):26657  -p $((1317+$idx)):1317 -p $((8545+$idx)):8545  -p $((8546+$idx)):8546   -v $MPWD/conf:/nameserviced   -it nameserviced/node:latest  #/usr/bin/start.sh

    done

    sleep 10

    for i in $(seq $(($offsetN+1)) $endN)
    do
      idx=$(((($i-1))*10))
      echo $idx
      while [ $(nameserviced status -n tcp://localhost:$((26657+$idx))| jq '.sync_info.catching_up' | bc) -ne 0 ]
      do
        echo '.sync_info.catching_up'
        sleep 1
      done
    done


    for i in $(seq $(($offsetN+1)) $endN)
    do

      dest=$DEST/node$i
      validatorPub=$(nameserviced tendermint show-validator  --home $dest)
      nameserviced  tx staking create-validator --chain-id 200812   --amount 10000000bitc --pubkey   $validatorPub  --moniker  node$i   --commission-rate 0.1 --commission-max-rate 0.2 --commission-max-change-rate 0.01 --min-self-delegation 1 --from  mykey$i -y

    done

    exit 0
fi



docker network prune -f
docker network create \
  --driver=bridge \
  --subnet=172.77.0.0/16 \
  --ip-range=172.77.0.0/16 \
  --gateway=172.77.5.254 \
  nameservicenet

for i in $(seq 1 $N)
do
  idx=$(((($i-1))*10))
  echo $idx
  docker run -d --name=node$i --net=nameservicenet -e "ID=$i"  --ip=172.77.5.$i  -p $((26656+$idx)):26656 -p $((26657+$idx)):26657  -p $((1317+$idx)):1317 -p $((8545+$idx)):8545  -p $((8546+$idx)):8546   -v $MPWD/conf:/nameserviced   -it nameserviced:latest  #/usr/bin/start.sh
done
