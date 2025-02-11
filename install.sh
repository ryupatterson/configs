#!/bin/bash
script_path=${0%/*}
script_path=${script_path#.}


config_dir_path="${PWD}/${script_path}/conf/"

echo "Getting configs from $config_dir_path"
for f in $config_dir_path/*
do
	filename=$( echo $f | awk -F/ '{ print $NF }')
	link_name="$HOME/.${filename}"
	
	while true; do
    		read -p "Do you wish to replace $link_name?  (y/n)  " yn
    		case $yn in
        		[Yy]* ) cp -f $f $link_name; break;;
        		[Nn]* ) exit;;
        		* ) echo "Please answer yes or no.";;
    		esac
	done
done


