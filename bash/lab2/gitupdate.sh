#!/bin/bash
#
#
git add -A
read -p "Message for update:" message
git commit -m "$message"
git push
