#!/bin/bash
#PBS -j oe
#PBS -q workq
#PBS -m be
#PBS -l mem=80gb
#PBS -l walltime=744:00:00
#PBS -S /bin/bash

module load conda
source activate qiime2-2018.6

export TMPDIR=/storage/hedlundlab/shrikant/temp/
mkdir $TMPDIR

cd /storage/hedlundlab/shrikant/hedlundlab_other/Pupfish


qiime tools import --type 'SampleData[PairedEndSequencesWithQuality]' \
  --input-path data \
  --source-format CasavaOneEightSingleLanePerSampleDirFmt \
  --output-path demux.qza

qiime dada2 denoise-paired --i-demultiplexed-seqs demux.qza \
  --p-trim-left-f 10 \
  --p-trim-left-r 10 \
  --p-trunc-len-f 151 \
  --p-trunc-len-r 151 \
  --o-table table.qza \
  --o-representative-sequences rep-seqs.qza \
  --o-denoising-stats denoising-stats.qza

qiime feature-classifier classify-sklearn \
  --i-classifier /storage/hedlundlab/shrikant/classifier_training/silva-trained-classifier.qza \
  --i-reads rep-seqs.qza \
  --o-classification taxonomy.qza \
  --p-confidence 0.8 \
  --p-n-jobs 1 \
  --p-reads-per-batch 20000

qiime taxa filter-table --i-table table.qza \
  --i-taxonomy taxonomy.qza \
  --p-exclude mitochondria,chloroplast,eukaryota,unassigned \
  --o-filtered-table filtered-table.qza


qiime alignment mafft \
  --i-sequences rep-seqs.qza \
  --o-alignment aligned-rep-seqs.qza

qiime alignment mask \
  --i-alignment aligned-rep-seqs.qza \
  --o-masked-alignment masked-aligned-rep-seqs.qza

qiime phylogeny fasttree \
  --i-alignment masked-aligned-rep-seqs.qza \
  --o-tree unrooted-tree.qza

qiime phylogeny midpoint-root \
  --i-tree unrooted-tree.qza \
  --o-rooted-tree rooted-tree.qza


qiime tools export filtered-final-table.qza --output-dir forphyloseq/

qiime tools export final-taxonomy.qza --output-dir forphyloseq/

# for PICRUSt analysis
qiime vsearch cluster-features-closed-reference \
--i-sequences rep-seqs.qza \
--i-table table.qza \
--i-reference-sequences /storage/hedlundlab/shrikant/Sequencing_data_Dec2018/final/picrust/gg_13_5_otu_99.qza \
--p-perc-identity 1 \
--p-threads 0 \
--output-dir closedRef_forPICRUS
