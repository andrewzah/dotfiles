#!/bin/bash 
NCMP=$(mpc -h ~/.config/mpd/socket | grep "^\[playing\]" | awk '{print $1}')
NUM_NCMP=$(mpc -h ~/.config/mpd/socket | head -1 | wc -c )
S_NCMP=$(mpc -h ~/.config/mpd/socket | head -1 | head -c 100)

if [ "$NCMP" = "[playing]" ]; then 
    if [ "$NUM_NCMP" -lt 100 ]; then 
        echo -e ": $(mpc -h ~/.config/mpd/socket current)"
    else
        echo -e ": $S_NCMP..."
    fi
fi
