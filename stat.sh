echo "-- Small sampled data --"
echo "# records:"
wc -l $1

echo "# queries:"
cat $1 | cut -d ' ' -f 2 | sort | uniq | wc -l

echo "# docs:"
cat $1 | cut -d '#' -f 2 | sort | uniq | wc -l


