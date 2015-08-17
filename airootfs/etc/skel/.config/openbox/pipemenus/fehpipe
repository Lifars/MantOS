#!/bin/bash
# ArchBang wallpaper changer using feh
# by Mr Green

function feh_pipe()
{
for f in ${1}/*
do
	echo "<item label=\"$(basename ${f%.*})\">
	<action name=\"Execute\">
	<command>feh --bg-scale \"$f\"</command>
	</action>
	</item>"
done
}

echo "<openbox_pipe_menu>"
# Simply change path to suit
#feh_pipe ${HOME}/Backgrounds # add what folders you have backgrounds in
feh_pipe /usr/share/wallpapers
echo "</openbox_pipe_menu>"

