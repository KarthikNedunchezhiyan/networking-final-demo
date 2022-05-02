#!/bin/bash

COUNT=`ls /sys/class/net/ | wc -l`

echo "cleaning iperf3"
killall iperf3
echo "cleaning firecracker"
killall firecracker

for ((i=0; i<COUNT; i++))
do
  ip link del fc-$i-tap0 2> /dev/null &
done

rm -rf output/*
rm -rf /tmp/firecracker-sb*
