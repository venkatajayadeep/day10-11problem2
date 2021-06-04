#!/bin/bash

echo $'\n'Welcome to Coin Flip Simulator$'\n'

head=0
tail=0
flag=0

while [ $head != 21 ] && [ $tail != 21 ]; do
	toss=$((RANDOM%2))
	if [[ toss -eq 0 ]]; then
		head=$(($head+1))
	else
		tail=$(($tail+1))
	fi

	if [[ $head -eq 20 ]] && [[ $tail -eq 20 ]]; then
		flag=1
		break
	fi

done

if [[ $head -eq 21 ]] && [[ $flag -eq 0 ]]; then
	echo $'\n'"Head Wins $head times"
	echo "Head wins by $(($head-$tail)) tosses"
elif [[ $tail -eq 21 ]] && [[ $flag -eq 0 ]]; then
	echo $'\n'"Tail Wins $tail times"
	echo "Tail wins by $(($tail-$head)) tosses"
elif [[ $flag -eq 1 ]]; then
	echo $'\n'"Both are Tied"
fi
