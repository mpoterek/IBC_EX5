# method 1: set of file names to be used in a loop
# usage: bash shellscript.sh *.csv


# usage: bash shellscript.sh

cut -d ',' -f 1,2 wages.csv | grep [fm] | tr ',' ' ' | sort -k1,1 -k2n | 
uniq > wages_sorted.txt



echo "Lowest wage earner: " 
cut -d ',' -f 1,2,4 wages.csv | grep [fm] | tr ',' ' ' | sort -k3,3 | head -n 1

echo "Highest wage earner: "
cut -d ',' -f 1,2,4 wages.csv | grep [fm] | tr ',' ' ' | sort -k3,3 | tail -n 1

echo "Number of females in top ten earners: "
cut -d ',' -f 1,2,4 wages.csv | grep [fm] | tr ',' ' ' | sort -k3,3 | tail -n 10 | grep "female" | wc -l



# find average wage of non-college graduates (12 school years) from wages.csv
# set that equal to variable no_col_wage
echo "This is the average of all wages for non-college grads: "
no_col_wage = (cut -d ',' -f 3,4 wages.csv | grep '12,' | cut -d ',' -f 2 | awk '{total += $1}')
# find average wage of college graduates (16 school years) from wages.csv
# set that equal to variable col_wage 
echo "This is the average of all wages for college grads: "
cut -d ',' -f 3,4 wages.csv | grep '16,' | cut -d ',' -f 2 |awk '{total += $1} END {print total/NR}'
