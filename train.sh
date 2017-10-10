for f in padded*shuffled
do
  echo $f
  sbatch run_map.sh $f
  sbatch run_ndcg.sh $f
done

