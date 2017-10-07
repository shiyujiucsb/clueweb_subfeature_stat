cat $1 | tr -cs 'a-zA-Z0-9\n' ' ' | awk '{print $1"\t"NF-1}' > $2
