#!/usr/bin/env bash
#Patricia Portmann and Marya Poterek
#4 October 2018
#Exercise 5
# usage: bash shellscript.sh
# makes file with unique gender-yearsExperience combos
cut -d ',' -f 1,2 wages.csv | tr ',' ' ' | sort -k1,1 -k2n > wages_sorted.txt
#finds lowest wage earner
echo "Lowest wage earner: " 
cut -d ',' -f 1,2,4 wages.csv | tr ',' ' ' | sort -k3,3 | head -n 1 
#finds highest wage earner
echo "Highest wage earner: "
cut -d ',' -f 1,2,4 wages.csv | tr ',' ' ' | sort -k3,3  | tail -n 2 | head -n 1 
#calculates number of females in top 10 earners
echo "Number of females in top ten earners: "
cut -d ',' -f 1,2,4 wages.csv | tr ',' ' ' | sort -k3,3 | tail -n 10 | grep "female" | wc -l 
# find average wage of non-college graduates (12 school years) from wages.csv
echo "This is the average of all wages for non-college grads: "
no_college="$(cut -d ',' -f 3,4 wages.csv | grep '12' | cut -d ',' -f 2 | awk '{total += $1} END {print total/NR}')"
echo $no_college
# find average wage of college graduates (16 school years) from wages.csv
echo "This is the average of all wages for college grads: "
yes_college="$(cut -d ',' -f 3,4 wages.csv | grep '16' | cut -d ',' -f 2 | awk '{total += $1} END {print total/NR}')"
echo $yes_college
echo "The wage effect of graduating college: "
echo "$yes_college - $no_college" | bc
