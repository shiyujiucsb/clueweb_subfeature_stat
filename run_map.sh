#!/bin/bash
#!/bin/bash
#SBATCH --job-name="runMAP"
#SBATCH --output="lambda-aqt-raw.out"
#SBATCH --partition=compute
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=24
#SBATCH --export=ALL
#SBATCH -t 24:00:00

filename=$1
for nTrees in 100 200 500 1000
do
  for nLeaves in 10 20 30 40 50
  do
    echo $nTrees $nLeaves
    time java -Xmx32000m -jar ./RankLib-2.1-patched.jar -shrinkage 0.1 -train $filename -ranker 6 -kcv 5 -kcvmd models/ -kcvmn ca -tree $nTrees -leaf $nLeaves -metric2t MAP -metric2T MAP > 'MAP_rankres_'$1'_'$nTrees'_'$nLeaves'.txt'
  done
done

