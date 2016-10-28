#!/bin/bash

echo `ifconfig enp0s5 2>/dev/null|awk '/inet addr:/ {print $2}'|sed 's/addr://'`

echo `ifconfig lo 2>/dev/null|awk '/inet addr:/ {print $2}'|sed 's/addr://'`
