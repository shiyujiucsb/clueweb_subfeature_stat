#echo "Extracting combined features..."

cat $1 | awk -F ' ' '{
  for (i=1; i<=NF; i++){
    if (match($i, ":")){
      if (!match($i, "_")){
        printf("%s ", $i);
      }
    }else{
      printf("%s ", $i);
    }
  }
  print "";
}'
  

