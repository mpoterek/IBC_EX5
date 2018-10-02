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
cut -d ',' -f 1,2,4 wages.csv | grep [fm] | tr ',' ' ' | sort -k3,3 | 
tail -n 10 | grep "female" | wc -l
