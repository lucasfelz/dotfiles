#!/bin/bash
# Volume bar otimizado (sem loop)
VOLUME=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2*100)}')
MUTED=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -q MUTED && echo "true" || echo "false")

if [ "$MUTED" = "true" ]; then
    echo '{"text":"󰝟","tooltip":"Muted"}'
else
    echo "{\"text\":\"󰕾 ${VOLUME}%\",\"tooltip\":\"Volume: ${VOLUME}%\"}"
fi
