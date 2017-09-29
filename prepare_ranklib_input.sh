bash tr_inf_nan.sh $1 > no_inf_nan_results09mq.txt

bash extract_combined_features.sh no_inf_nan_results09mq.txt > all_combined_features.txt
bash padding.sh all_combined_features.txt 36 > padded_all_combined_features.txt

python divide.py qid_length.txt no_inf_nan_results09mq.txt

for i in 2 3 4
do
  bash extract_combined_features.sh "$i"word_query_results.txt > "$i"word_combined_features.txt 
  bash padding.sh "$i"word_combined_features.txt 36 > padded_"$i"word_combined_features.txt
  bash shuf.sh padded_"$i"word_combined_features.txt

  bash extract_subfeatures.sh "$i"word_query_results.txt > "$i"word_subfeatures.txt
  if [ $i -eq 2 ]; then 
    let n=50
  fi
  if [ $i -eq 3 ]; then 
    let n=108 
  fi
  if [ $i -eq 4 ]; then 
    let n=188 
  fi
  bash padding.sh "$i"word_subfeatures.txt $n > padded_"$i"word_subfeatures.txt
  bash shuf.sh padded_"$i"word_subfeatures.txt
done
