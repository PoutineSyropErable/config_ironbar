#!/bin/bash

if pgrep -x "ironbar" >/dev/null; then
	pkill -x ironbar
else
	ironbar &
fi
