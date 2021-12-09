#!/bin/bash  

nameserviced  q  nameservice   list-whois --count-total  --limit 10  #-o json


# nameserviced  q block 5065 | jq '.block.data.txs'| jq 'length'

