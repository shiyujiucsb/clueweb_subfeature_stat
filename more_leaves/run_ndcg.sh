#!/bin/bash


filename=$1
for nTrees in 10 20 50 100
do
  for nLeaves in 10 20 50 100 
  do
    time java -Xmx32000m -jar ./RankLib-2.1-patched.jar -shrinkage 0.1 -train $filename -ranker 6 -kcv 5 -kcvmd models/ -kcvmn ca -tree $nTrees -leaf $nLeaves -metric2t NDCG@10 -metric2T NDCG@10 > 'NDCG10_rankres_'$1'_'$nTrees'_'$nLeaves'.txt'
    time java -Xmx32000m -jar ./RankLib-2.1-patched.jar -shrinkage 0.1 -train $filename -ranker 6 -kcv 5 -kcvmd models/ -kcvmn ca -tree $nTrees -leaf $nLeaves -metric2t NDCG@20 -metric2T NDCG@20 > 'NDCG20_rankres_'$1'_'$nTrees'_'$nLeaves'.txt'
    time java -Xmx32000m -jar ./RankLib-2.1-patched.jar -shrinkage 0.1 -train $filename -ranker 6 -kcv 5 -kcvmd models/ -kcvmn ca -tree $nTrees -leaf $nLeaves -metric2t NDCG@1 -metric2T NDCG@1 > 'NDCG01_rankres_'$1'_'$nTrees'_'$nLeaves'.txt'
  done
done

