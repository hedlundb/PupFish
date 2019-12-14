# The Devils Hole pupfish gut microbiome and its potential role in paradoxical anaerobism

**Overview**

The Devils Hole Pupfish (*Cyprinodon diabolis*) frequently enters paradoxical anaerobism in response to endogenously produced or exogenously supplied ethanol in a dose-dependent manner. To decipher the role of the gut microbiota in ethanol-associated paradoxical anaerobism, gut microbial communities were depleted using a cocktail of antibiotics and profiled using 16S rRNA gene sequencing. Compared to the control group (n=12), microbiota-depleted fish (n=12) spent more time in paradoxical anaerobism. Our analysis indicated that the bacterial phyla *Proteobacteria*, *Fusobacteria*, *Bacteroidetes*, *Firmicutes*, *Actinobacteria*, *Patescibacteria*, and *Dependentiae* dominated the pupfish gut, which is consistent with other fish gut microbiota. Although the gut microbial communities with and without antibiotic treatment were similarly diverse, they were distinct and the greatest contribution to the dissimilarity (27.38%) was the common fish commensal *Cetobacterium*. We speculate that *Cetobacterium*, a primary fermenter, also consumes ethanol through secondary fermentation via an alcohol dehydrogenase and therefore regulates the transition from paradoxical anaerobism to aerobic respiration in fish. This study reports the first characterization of gut microbial communities of critically endangered pupfish and suggests the microbiome may play a critical role in regulating metabolic strategies that are critical for survival in extremes of temperature and oxygen concentration. Given the wide distribution and abundance of *Cetobacterium* in warm-water fishes, this process may be of broad importance, and suggests that the microbiome be carefully considered for both conservation and aquaculture.

The raw sequences are deposited in the NCBI Sequence Read Archive (SRA) under the BioProject accession PRJNA561361

This repository contains following folders -
- data                     # raw data generated using QIIME2-2018.6

  - filtered-table.qza     # OTU table
  - tax.txt                # OTU taxonomy
  - metadata.txt           # metadata file
  - rooted-tree.qza        # OTU tree

- code/                    # QIIME commands and phyloseq scripts
  - analysis.sh            # QIIME2-2018.6 analysis steps
  - PupFish.RMD            # Phyloseq scripts
  
