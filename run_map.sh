#!/bin/bash


filename=$1
for i in 10 20 50 100 200 
do
  time java -Xmx32000m -jar ./RankLib-2.1-patched.jar -shrinkage 0.1 -train $filename -ranker 6 -kcv 3 -kcvmd models/ -kcvmn ca -tree $i -leaf 10 -metric2t MAP -metric2T MAP > MAP_rankres_$(i)_$1.txt
done
