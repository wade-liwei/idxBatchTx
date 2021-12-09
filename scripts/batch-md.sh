#!/bin/bash  
  

#$(> temp)
#for((i=1;i<=6000;i++));  
#do   
#    echo -n $(expr $i  + 1)|md5|cut -d ' ' -f1 >> temp
#done

h2=$(cat temp)
#echo $h2

nonce=$(nameserviced   query  account  $(nameserviced keys show alice  -a)  -o json  | jq '.sequence' | bc )

for((i=nonce;i<nonce+100;i++));
do

echo $i

idx=$((($i)*1000))
nameserviced tx nameservice buy-name  $idx  $h2   -s $i -y  -b  async   --from alice   --gas 200000000000 # --fees 2stake 

done