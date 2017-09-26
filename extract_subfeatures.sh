#echo "Extracting subfeatures..."

cat $1 | awk -F ' ' '{
  fn = 1;
  for (i=1; i<=NF; i++){
    if (match($i, "_")){
      split($i, f, ":");
      printf("%d:%s ", fn++, f[2]);
    } else {
      if((!match($i, ":")) || \
           match($i, "qid") || \
           match($i, "docid"))
        printf("%s ", $i);
    }
  }
  print "";
}'
  

