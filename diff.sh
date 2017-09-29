(( j=2 ))
for i in 0 1 2 3 4 5 6 7 24 25 26 27 28 29
do
  (( j++ ))
  echo $((i+3)) $j
  diff <(cat small_sample_1word_combined_features.txt | cut -d ' ' -f $((i+3)) | cut -d ':' -f 2) <(cat small_sample_1word_subfeatures.txt | cut -d ' ' -f $j | cut -d ':' -f 2)
done

