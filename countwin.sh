#!/bin/bash

echo $'\n'Welcome to Coin Flip Simulator$'\n'

heads=0
tails=0

for (( i = 0; i < 20; i++ )); do
	toss=$((RANDOM%2))

	if [[ $toss -eq 0 ]]; then
		((++heads))
	else
		((++tails))
	fi

done

echo Head Won $heads times
echo Tail Won $tails times
