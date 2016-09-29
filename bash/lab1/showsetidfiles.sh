#!/bin/bash
#
# Lists all the setuid and setgid regular files in the /usr directory tree.
echo "SetUID Files"
echo "-----------------"
find /usr -type f -executable -perm -4000 -ls 
cat << list

SetGID files
-----------------
list
find /usr -type f -executable -perm -2000 -ls
