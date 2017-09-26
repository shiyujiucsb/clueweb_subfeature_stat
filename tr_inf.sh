# convert inf to 0

cat $1 | sed 's/inf/0/g'
