![image](https://github.com/erg6437/RSV-Molecular-Epidemiology/assets/53444914/3caa2023-d542-433b-b4b3-f8ea2d4be1b3)


# Functional Characterization of RSV Clades associated with Prophylactic Breakthrough Infections in Pediatric Transmission Clusters

Estefany Rios-Guzman, Ria Almohtadi, Seth H. Borrowman, Tien Doan, Charles R. Boyle, Dulce Garcia, Margarita Rzhetskaya, Lacy M. Simons, Jacob Class, Alexa Mendoza, Molly Schnieders, Anna Pawlowski, Sameer J. Patel, Ramon Lorenzo-Redondo, & Judd F. Hultquist

# Table of Contents 
* [Introduction](#Introduction)
* [Significance and Findings](#Significance-and-Findings)
* [Study Design](#Study-Design)  
* [Dependencies](#Dependencies)
* [Phylogenetic Data Sets](#Phylogenetic-Data-Sets)
* [Phylogenetic Analysis](#Phylogenetic-Analysis)

# Introduction #
This repository was created to share the metadata and accompanying .R and .ipynb scripts that were used to created main and supplementary figures in Rios-Guzman & Almohtadi 2026 (submitted). The following types of information are provided in this GitHub:

1. Trees and fasta files used for phylogenetic and temporal phylodynamic analysis
2. Code (.ipynb & .R) used for the analysis and visualization of the figures
3. Figure images

Note: Clinical metadata and demographic information used for analysis and generated figures are not provided as per IRB constraints

# Significance and Findings #

* Breakthrough infections in our retrospective cohort study were associated with only a few select clades.

* Paired genotyping and clinical metadata revealed a trend towards increased hospitalization in infants with nirsevimab administration who had an RSV infection in their second RSV season.

* Temporal phylodynamics revealed potential viral kinetic differences among transmission clusters comprised of the predominant RSV-A clades in the 2024-2025 RSV season.

* Transmission clusters, as defined by more than 15 sequences with stringent genetic distance cutoffs, were only apparent in our pediatric cohort.

* Most clades circulating in the 2024-2025 RSV season had minimal variation in cell entry function and monoclonal antibody susceptibility.

# Study Design


Through a dual-center retrospective cohort study, we characterized RSV viral population dynamics over 2 years (2023-2025) in Chicago, Illinois, USA. We conducted this study among adult and pediatric patients who tested positive for RSV via PCR diagnostic tests at Northwestern Medicine (NM) hospital systems and Lurie Children's Hospital (LCH). From the NM system, we collected 209 RSV-positive residual nasopharyngeal swab diagnostic specimens from June 2023 through February 2025. From LCH, we collected 1,235 RSV-positive residual diagnostic specimens from November 2024 to April 2025, from which we sub-sampled 591 specimens by age, sex, and epidemiological week for sample processing and sequencing. Overall, we generated 420 RSV whole-genome sequences which were used for subsequent analysis. 


# Dependencies
### Python Dependencies
* Pandas (v.1.1.3)
* Numpy (v.1.19.2)
* matplotlib (v.3.3.2)
* seaborn (v.0.11.0)
* tableone (v.0.7.12)
* bio (v.1.79)
* scipy (v.1.5.2)
* lifelines (v.0.27.7)

### R Dependencies ( R (version 4.4.1) )
* RColorBrewer_1.1-3 
* scales_1.4.0       
* ggtreeExtra_1.14.0 
* ggtree_3.12.0      
* treeio_1.28.0      
* forcats_1.0.1     
* stringr_1.5.1      
* purrr_1.2.1        
* readr_2.2.0        
* tibble_3.2.1       
* tidyverse_2.0.0    
* effects_4.2-5     
* OddsPlotty_1.0.2   
* gt_1.3.0           
* car_3.1-3          
* carData_3.0-5      
* MASS_7.3-61        
* gtsummary_2.5.0   
* TreeTools_2.1.0    
* ape_5.8            
* ggpubr_0.6.0       
* ggsci_3.2.0        
* tidyr_1.3.1        
* ggplot2_4.0.2     
* lubridate_1.9.4    
* dplyr_1.2.0        
* readxl_1.4.5       
* performance_0.16.0


### Other Software Used in this Study
* GraphPad Prism (version 11.0.0 (93))


# Phylogenetic Analysis
#### Note: the timing to run the phylogenetic analysis is dependent on the number of sequences in the alignment. Run time has varied from 30 minutes to 3 days from alignment to ML phylogenetic construction

### Installing Packages and Activating Environment
```
module load anaconda3
module load gcc/9.2.0
conda create -c bioconda -n environment_for_RSV_analysis mafft=7.490 iqtree2=2.2 treetime=0.8.5 hyphy vigor4
conda activate environment_for_RSV_analysis
```

### Alignment
```
mafft --auto --thread -auto XXX.fasta > XXX.mafft.fa
```

### Maximum Likelihood (ML) Phylogenetic Construction (IQTree2)

```
iqtree2 --alrt 1000 --B 1000 --s XXX.mafft.fa
```

### Temporal ML Phylogenetic Construction (with Coalescent)
```
treetime --aln alignment.file.mafft.fa --tree treefile.nwk --dates datefile.csv -outdir /path/to/output/directory --coalescent skyline --max-iter 10
```
