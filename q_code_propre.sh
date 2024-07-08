#!/bin/bash
# Nom du job
# Utiliser le shell bash
#$ -S /bin/bash
# Utiliser un chemin de travail spécifique
#$ -cwd
# Spécifier la file d'attente à utiliser
#$ -q all.q
# Nombre de threads / processus à utiliser
#$ -pe smp 1

vcftools="/./media/myriamNFS3/CHRONOS/SOFTWARE/vcftools"
dir_data="/media/stagiaireNFS3/henes/gwas_2/post_imputation/"
OUT="/media/stagiaireNFS3/henes/gwas_2/post_imputation/results/"
BATCH="/media/stagiaireNFS3/henes/gwas_2/post_imputation/BATCH/"
for i in  {1..22} ; do BATCHFILE="${BATCH}commande_filtreQC.chr${i}"; echo "${vcftools} --gzvcf ${dir_data}chr${i}.dose.vcf.gz --maf 0.01 --min-r2 0.8 --recode --out ${OUT}chr${i}_filtered && gzip ${OUT}chr${i}_filtered.recode.vcf" > ${BATCHFILE}; qsub -q ALL ${BATCHFILE}; done 
