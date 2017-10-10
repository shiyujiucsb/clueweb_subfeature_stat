#!/bin/bash


filename=$1
for nTrees in 100 200 500 1000
do
  for nLeaves in 10 20 30 40 50 
  do
    echo $nTrees $nLeaves $filename
    time java -Xmx32000m -jar ./RankLib-2.1-patched.jar -shrinkage 0.1 -train $filename -ranker 6 -kcv 5 -kcvmd models/ -kcvmn ca -tree $nTrees -leaf $nLeaves -metric2t NDCG@20 -metric2T NDCG@20 > 'NDCG20_rankres_'$1'_'$nTrees'_'$nLeaves'.txt' 
  done
done

