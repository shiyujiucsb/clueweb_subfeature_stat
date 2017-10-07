#echo "Extracting subfeatures..."

cat $1 | awk -F ' ' '{
  fn = 1;
  for (i=1; i<=NF; i++){
    if (match($i, "_")){
      split($i, f, ":");
      split(f[1], g, "_");
      if (g[1] == 8  || \
          g[1] == 9  || \
          g[1] == 10 || \
          g[1] == 12 || \
          g[1] == 13 || \
          g[1] == 14 || \
          g[1] == 27 || \
          g[1] == 28 || \
          g[1] == 29 || \
          g[1] == 32 || \
          g[1] == 33){
        printf("%d:%s ", fn++, f[2]);
      }
    } else {
      if((!match($i, ":")) || \
           match($i, "qid") || \
           match($i, "docid"))
        printf("%s ", $i);
    }
  }
  print "";
}'
  

