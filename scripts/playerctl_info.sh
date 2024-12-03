#!/bin/bash
#----------------------------------------------------------------------------------------------------
# Requires playerctl - https://github.com/acrisci/playerctl
#----------------------------------------------------------------------------------------------------
#Exit the script if no music players running
[[ "$(playerctl status 2>&1)" = "No players found" ]] && exit 33;

# # Define cursor icons
# playIcon="";
# pauseIcon=" \u23f8\ufe0f";
# stopIcon=" \u23f9\ufe0f";


##Mouse actions for the block
#case $BLOCK_BUTTON in
#	1) playerctl $ARGUMENTS previous ;;
#	2) playerctl $ARGUMENTS play-pause ;;
#	3) playerctl $ARGUMENTS next ;;
#	4) playerctl $ARGUMENTS position 5+ ;;
#	5) playerctl $ARGUMENTS position 5- ;;
#esac

#Define song info variables
playerStatus=$(playerctl status);
songDuration="";
elapsedTime=$(playerctl metadata --format "{{ duration(position) }}");
songLength=$(playerctl metadata --format "{{ duration(mpris:length) }}");


volume=$(playerctl volume 2>/dev/null)
# Convert volume (fractional) to perce# Fetch the current volume level
volume_percent=$(awk "BEGIN {print int($volume * 100)}")


#`playerctl position` doesn't work for "Spotify"
if [[ $(playerctl -l) != "spotify" ]]; then
	songDuration="$elapsedTime/$songLength";
fi

#Display output
if [[ "${playerStatus^}" = "Paused" ]]; then
	echo "$songDuration $volume_percent%";
elif [[ "${playerStatus^}" = "Playing" ]]; then
	echo "$songDuration $volume_percent%";
elif [[ "${playerStatus^}" = "Stopped" ]]; then
	echo "Stopped";
fi

