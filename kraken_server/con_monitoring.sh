#!/bin/bash

conntrack -E -o timestamp |
while IFS= read -r line; do
    if [[ "$line" != *"dst=192.168.0.2 "* ]]; then
        continue
    fi

    if [[ "$line" == *"src=192.168.0.2 dst=192.168.0.1"* && "$line" == *"dport=53"* ]]; then
        continue
    fi

    printf '%s %s\n' "$(date '+%Y-%m-%d %H:%M:%S')" "$line"
#done
done >> /tmp/conntrack.log
