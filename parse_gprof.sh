#!/bin/bash

file=$1

while read pcent cumul self n_calls self_ms total_ms name
do
	if [[ "$self" != "0.00" ]]; then
		echo "$name: $pcent of the time ($self s)"
	fi
done <<< $(sed -n -r '/^ *[0-9]/{p; :loop n; /^$/q; p; b loop}' ${file})

