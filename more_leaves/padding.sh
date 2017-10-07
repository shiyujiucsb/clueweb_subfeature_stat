cat $1 | awk '{if (NF==6){printf("%s %s ",$1,$2); for(i=1;i<='$2';i++) printf("%d:0 ",i); printf("%s %s %s %s\n",$3,$4,$5,$6)} else print $0}'
