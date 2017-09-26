#echo "Extracting combined features..."

cat $1 | awk -F ' ' '{
  fn = 1
  for (i=1; i<=NF; i++){
    if (match($i, ":") && \
       !match($i, "qid") && \
       !match($i, "docid")){
      if (!match($i, "_")){
        split($i, f, ":");
        printf("%d:%s ", fn++, f[2]);
      }
    }else{
      printf("%s ", $i);
    }
  }
  print "";
}'
  

