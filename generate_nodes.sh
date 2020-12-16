#!/bin/sh

arr=(node1 node2 node3 node4)
basefolder="nodes"
for ((i=0; i < ${#arr[@]}; i++))
do
  echo "mkdir -p ${basefolder}/${arr[$i]}/orion"
  mkdir -p ${basefolder}/${arr[$i]}/orion
  echo "mkdir ${basefolder}/${arr[$i]}/data"
  mkdir ${basefolder}/${arr[$i]}/data
  echo "cp configs/${arr[$i]}.toml ${basefolder}/${arr[$i]}/conf.toml"
  cp configs/${arr[$i]}.toml ${basefolder}/${arr[$i]}/conf.toml
done

echo "cp networkFiles/genesis.json ${basefolder}"
cp networkFiles/genesis.json ${basefolder}


x=0
for entry in ./networkFiles/keys/*
do
  echo "cp $entry/* ${basefolder}/${arr[x]}/data"
  cp $entry/* ${basefolder}/${arr[x]}/data
  x=$((x + 1))
done
