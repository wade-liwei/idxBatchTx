#!/bin/bash  

nameserviced  q  nameservice   list-whois --count-total  --limit 10  #-o json


# nameserviced  q block 28 | jq '.block.data.txs'| jq 'length'

