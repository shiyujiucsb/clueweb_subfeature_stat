for f in padded*shuffled
do
  sed -i 's/id/qid/' $f
done

