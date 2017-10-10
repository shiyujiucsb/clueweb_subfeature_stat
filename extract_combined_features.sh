#echo "Extracting combined features..."

cat $1 | awk -F ' ' '{
  fn = 1
  for (i=1; i<=NF; i++){
    if (match($i, ":") && \
       !match($i, "qid") && \
       !match($i, "docid")){
      if (!match($i, "_")){
        split($i, f, ":");
        if (f[1] == 8 || \
            f[1] == 9 || \
            f[1] == 10 || \
            f[1] == 12 || \
            f[1] == 13 || \
            f[1] == 14 || \
            f[1] == 27 || \
            f[1] == 28 || \
            f[1] == 29 || \
            f[1] == 32 || \
            f[1] == 33)
          printf("%d:%s ", fn++, f[2]);
      }
    }else{
      printf("%s ", $i);
    }
  }
  print "";
}'
  

