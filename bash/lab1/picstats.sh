#!/bin/bash
#
#display how many regular files there are in the Pictures directory and how much disk space they use. It should also show the sizes and names of the 3 largest files in that directory.

echo -n "In the ~/Pictures directory number of files is: "
find ~/Pictures -type f |wc -l

echo -n "And they are using "
du -h ~/Pictures |awk '{print $1}'

echo ""
echo "Of these files the 3 largest files are"
echo "--------------------------------------"
du -h ~/Pictures/* |sort -h |tail -3
