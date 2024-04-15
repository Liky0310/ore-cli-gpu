#!/bin/bash
i=${1}
if (($i >= 0 && $i < 10)); then
    prefix="a"
elif (($i >= 10 && $i < 20)); then
    prefix="b"
elif (($i >= 20 && $i < 30)); then
    prefix="c"
else
    prefix="$i"
fi
tmux kill-session -t $prefix$i
