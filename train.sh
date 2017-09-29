for f in padded*shuffled
do
  bash run_map.sh $f
  bash run_ndcg.sh $f
done

