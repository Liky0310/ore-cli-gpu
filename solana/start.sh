#!/bin/bash
set -x
st="${1}"
end="${2}"
for i in $(seq "$st" "$end"); do
  ./run.sh "$i"
  sleep 1
done
