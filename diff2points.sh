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
		diff=0
		while [ $diff != 2 ]; do
			toss=$((RANDOM%2))
			if [[ toss -eq 0 ]]; then
				head=$(($head+1))
			else
				tail=$(($tail+1))
			fi

			if [[ $head -gt $tail ]]; then
				diff=$(($head - $tail))
			else
				diff=$(($tail - $head))
			fi
		done

		break
	fi

done

if [[ $head -eq 21 ]] && [[ $flag -eq 0 ]]; then
	echo $'\n'"Head Wins $head times"
	echo "Head wins by $(($head-$tail)) tosses"
elif [[ $tail -eq 21 ]] && [[ $flag -eq 0 ]]; then
	echo $'\n'"Tail Wins $tail times"
	echo "Tail wins by $(($tail-$head)) tosses"
elif [[ $diff -eq 2 ]] && [[ $head -gt $tail ]]; then
	echo $'\n'"Both are Tied"
	echo "Tosses continued till the difference was $diff"
	echo "Head won with $head tosses"
	echo "Tail had $tail tosses"
elif [[ $diff -eq 2 ]] && [[ $head -lt $tail ]]; then
	echo $'\n'"Both are Tied"
	echo "Tosses continued till the difference was $diff"
	echo "Tail won with $tail tosses"
	echo "Head had $head tosses"
fi
