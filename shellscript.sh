# method 1: set of file names to be used in a loop
# usage: bash shellscript.sh *.csv


# usage: bash shellscript.sh wages.csv

cut -d ',' -f 1,2 wages.csv | grep [fm] | tr ',' ' ' | sort -k1,1 -k2n | uniq


