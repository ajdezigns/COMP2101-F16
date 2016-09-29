#!/bin/bash
#This Script backs up my personal bin to my backup direcotry!

rsync -avr ~/bin/ ~/backup
