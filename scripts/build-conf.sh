#!/bin/bash

# This script creates the configuration for a Babble testnet with a variable
# number of nodes. It will generate crytographic key pairs and assemble a
# peers.json file in the format used by Babble. The files are copied into
# individual folders for each node so that these folders can be used as the
# datadir that Babble reads configuration from.


set -e

N=${1:-4}
DEST=${3:-"$PWD/conf"}
IPBASE=${4:-172.77.5.}
PORT=${5:-26656}



rm -rf ~/.nameservice*
nameserviced config keyring-backend test
nameserviced config chain-id 200812
nameserviced config output json
# nameserviced config indent true
# nameserviced config trust-node true



for i in $(seq 0 $N)
do
    if [ $i -eq 0 ] ; then
      nameserviced keys add mykey$i
    else
      nameserviced keys add mykey$i
      dest=$DEST/node$i
      mkdir -p $dest
      echo "Generating and init node dir for node$i"
      nameserviced init node$i --chain-id 200812 --home $dest
    fi
done

# add genesis accounts to genesis.json
for i in $(seq 1 $N)
do

  dest=$DEST/node$i
  if [ $i -eq 1 ] ; then
    for k in $(seq 1 $(($N+20)))
    do
      if [ $k -gt $N ] ; then
        nameserviced keys add mykey$k
      fi
      nameserviced add-genesis-account $(nameserviced keys show mykey$k -a) 100000000000000000000000000token,1000000000000000000stake --home $dest
    done
      nameserviced add-genesis-account $(nameserviced keys show mykey0 -a)  1000000000000000000000000000000000000000000token,1000000000000000000stake --home $dest
  else
      nameserviced add-genesis-account $(nameserviced keys show mykey$i -a) 100000000000000000000000000token,1000000000000000000stake --home $dest
  fi
done



# create gentxs

Node1Dir=""

for i in $(seq 1 $N)
do
  dest=$DEST/node$i

    if [ $i -eq $N ] ; then
       nameserviced gentx mykey$i  --keyring-dir ~/.nameservice 5000000stake --home $dest --ip $IPBASE$i --node-id $(nameserviced tendermint show-node-id --home $dest) --keyring-backend test --amount 5000000stake  --chain-id 200812
    else
       nameserviced gentx  mykey$i  --keyring-dir ~/.nameservice 6000000stake --home $dest --ip $IPBASE$i --node-id $(nameserviced tendermint show-node-id --home $dest) --keyring-backend test --amount 6000000stake  --chain-id 200812
    fi
    if [ $i -eq 1 ] ; then
      Node1Dir=$dest
    else
      cp $dest/config/gentx/*  $Node1Dir/config/gentx/
    fi
done


nameserviced collect-gentxs --home $Node1Dir


for i in $(seq 1 $N)
do
    dest=$DEST/node$i
    if [ $i -ne 1 ] ; then
      rm -f $dest/config/genesis.json
      cp $Node1Dir/config/genesis.json  $dest/config/
    fi
done


peers=""

for i in $(seq 1 $N)
do
    dest=$DEST/node$i
    peer=$(nameserviced tendermint show-node-id --home $dest)
    if [ $i -eq 1 ] ; then
      peers=${peer}@${IPBASE}${i}:${PORT}
    else
      peers=${peers},${peer}@${IPBASE}${i}:${PORT}
    fi
done

os=`uname -a`
mac='Darwin'

for i in $(seq 1 $N)
do
  dest=$DEST/node$i
  if [[ $os =~ $mac ]];then
        gsed -i '174,174d' $dest/config/config.toml
        gsed -i "174a persistent_peers = \"$peers\"" $dest/config/config.toml
        gsed -i 's/addr_book_strict = true/addr_book_strict = false/g' $dest/config/config.toml
        #gsed -i 's/fast_sync = true/fast_sync = false/g' $dest/config/config.toml
        gsed -i 's/"max_validators": 100,/"max_validators": 100,/g' $dest/config/genesis.json
    else
      sed -i '174,174d' $dest/config/config.toml
      sed -i "174a persistent_peers = \"$peers\"" $dest/config/config.toml
      sed -i 's/addr_book_strict = true/addr_book_strict = false/g' $dest/config/config.toml
      #sed -i 's/fast_sync = true/fast_sync = false/g' $dest/config/config.toml
      sed -i 's/"max_validators": 100,/"max_validators": 100,/g' $dest/config/genesis.json
  fi
done



mkdir -p $DEST/clicfg
cp -R ~/.nameservice/* $DEST/clicfg

# 10. start each node, hashrsd start --home node* --rpc.unsafe --log_level "main:info,state:info,mempool:info"
echo -e "\n------Enjoy it!------"
