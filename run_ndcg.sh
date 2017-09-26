#!/bin/bash


filename=$1
for i in 10 20 50 100 200 
do
  time java -Xmx32000m -jar ./RankLib-2.1-patched.jar -shrinkage 0.1 -train $filename -ranker 6 -kcv 5 -kcvmd models/ -kcvmn ca -tree $i -leaf 10 -metric2t NDCG@10 -metric2T NDCG@10 > NDCG_rankres_$1_$i.txt
done

