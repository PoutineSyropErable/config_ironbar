#!/bin/bash

# Remove the existing IPC socket
rm /run/user/1000/ironbar-ipc.sock

# Reload Hyprland (ensure Hyprland config is intact)
hyprctl reload

# Restart PipeWire for audio-related widgets
systemctl --user restart pipewire pipewire-pulse

# Restart Dunst if notifications are affected
systemctl --user restart dunst

# Kill and restart Ironbar
killall ironbar
ironbar
