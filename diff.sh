(( j=2 ))
for i in 0 1 2 3 4 5 6 7 24 25 26 27 28 29
do
  (( j++ ))
  echo $((i+3)) $j
  diff <(cat $1 | cut -d ' ' -f $((i+3)) | cut -d ':' -f 2) <(cat $2 | cut -d ' ' -f $j | cut -d ':' -f 2)
done

