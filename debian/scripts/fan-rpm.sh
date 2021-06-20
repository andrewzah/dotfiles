#!/bin/sh

speed1=$(sensors | grep "fan1" | awk '{printf $2}')
speed2=$(sensors | grep "fan3" | awk '{printf $2}')

echo "${speed1} | ${speed2} RPM"
