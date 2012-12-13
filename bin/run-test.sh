#!/bin/bash

clear

echo $$ > /tmp/run-test.pid
trap 'clear; $@' SIGUSR1

while true; do
  sleep 0.1
done
