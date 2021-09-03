#!/bin/bash

# Artitst - Title
playing=$(mpc current)

# Artist
# playing=$(mpc current | awk '{print $1}')

# Title
# playing=$(mpc current | awk '{print $3}')

status=$(mpc status | grep '^\[p' | awk '{print $1}' | sed 's/\[//' | sed 's/\]//')

case $status in
    'paused')
        icon=" "
        ;;

    'playing')
        icon=" "
        ;;

    *)
        icon=" "
        playing="Stopped"
        ;;
esac

echo $icon $playing
