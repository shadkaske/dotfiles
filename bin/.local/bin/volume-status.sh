VOL=$(pamixer --get-volume)
MUTE=$(pamixer --get-mute)

if [ "$VOL" -gt "70" ]; then
	ICON=""
elif [ "$VOL" -lt "30" ]; then
	ICON=""
else
	ICON=""
fi
VOL="$VOL%"

if [[ $MUTE == "true" ]]; then
   VOL="--" 
   ICON="婢"
fi

echo "$ICON $VOL"

