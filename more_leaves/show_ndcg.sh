for f in 'NDCG'$2'_rankres_padded_'$1*
do 
  echo $f
  tail $f
done

