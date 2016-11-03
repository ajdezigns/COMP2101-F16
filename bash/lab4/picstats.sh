#!/bin/bash

# Display how many regular files there are in the Pictures directory
# and how much disk space they use.  It should also show the sizes
# and names of the 3 largest files.

### Variables

directory=~/Pictures   # Default directory in witch to look for images
numberOfFilesToShow=3  # Default number of files to display info on

red=`tput setaf 1`     # 
green=`tput setaf 2`   #
yellow=`tput setaf 3`  #
blue=`tput setaf 4`    #
magenta=`tput setaf 5` # These set colurs for text
cyan=`tput setaf 6`    #
white=`tput setaf 7`   #
                       #
reset=`tput sgr0`      # This resets the colour of the text 

gotadirectory=no       # Default directly assumption 

### Functions

function usage {
    clear
    echo " Help Doc for: ${red}$0${reset} "
    echo "------------------------------------------------"
    echo "|-h|--help      : access this file             |"
    echo "|-c|--count     : Number of files to display   |"
    echo "|  Defaults number of files to display is 3    |"
    echo "|  Directory defaults to ~/Pictures if a       |"
    echo "|  different directory is needed simply enter  |"
    echo "|  it after the command or after the count     |"
    echo "------------------------------------------------"
}

function error-message {
    echo "$@" >&2
}


### COMMAND LINE PROCESSING 


while [ $# -gt 0 ]; do
    case "$1" in
    -h | --help ) # show help doc
        usage
        exit 0
        ;;
    -c | --count ) # specify how many big files to display
        if [[ $2 =~ ^[1-9][0-9]*$ ]]; then
            numberOfFilesToShow=$2
            shift
        else
            usage
            error-message "Count requires a nummber"
            exit 1
        fi
        ;;
    * ) # grab the directory name to work on
        if [ $gotadirectory = "no" ]; then
            directory=$1
            gotadirectory="yes"
        else
            usage
            error-message "I didn't understand '$1' as a directory, I already a directory $directory"
            exit 1
        fi
        ;;
    esac
    shift
done


### Main

echo -n "In the ${blue}$directory${reset} directory, the number of files is ${green}"
find $directory -type f |wc -l

echo -n "${reset}Those files use ${green}"
du -sh $directory |awk '{print $1}'

echo "${reset}The ${green}$numberOfFilesToShow${reset} largest files are:"
echo "${green}-------------------------------------------${red}"
du -h $directory/* |sort -h |tail -$numberOfFilesToShow
