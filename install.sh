#!/bin/bash
script_path=${0%/*}/

config_dir_path="${script_path}/conf/"

echo "Getting configs from $config_dir_path"
for f in $config_dir_path/*
do
	filename=$( echo $f | awk -F/ '{ print $NF }')
	link_name="$HOME/.${filename}"
	
	echo "Making symlink: $link_name"
	ln -s $f $link_name 
done


