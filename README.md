![image](https://github.com/erg6437/RSV-Molecular-Epidemiology/assets/53444914/3caa2023-d542-433b-b4b3-f8ea2d4be1b3)


# Functional Characterization of RSV Clades associated with Prophylactic Breakthrough Infections in Pediatric Transmission Clusters

Estefany Rios-Guzman, Ria Almohtadi, Seth H. Borrowman, Tien Doan, Charles R. Boyle, Dulce Garcia, Margarita Rzhetskaya, Lacy M. Simons, Jacob Class, Alexa Mendoza, Molly Schnieders, Anna Pawlowski, Sameer J. Patel, Ramon Lorenzo-Redondo, & Judd F. Hultquist

# Table of Contents 
* [Introduction](#Introduction)
* [Significance and Findings](#Significance-and-Findings)
* [Study Design](#Study-Design)  
* [Dependencies](#Dependencies)
* [Epidemiological Data Sets](#Epidemiological-Data-Sets)
* [Phylogenetic Data Sets](#Phylogenetic-Data-Sets)
* [Phylogenetic Analysis](#Phylogenetic-Analysis)

# Introduction #
This repository was created to share the metadata and accompanying .R and .ipynb scripts that were used to created main and supplementary figures in Rios-Guzman & Almohtadi 2026 (submitted). The following types of information are provided in this GitHub:

1. List of NCBI Accession Numbers and fasta files used for phylogenetic and temporal phylodynamic analysis
2. Code (.ipynb & .R) used for the analysis and visualization of the figures

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

### R Dependecies 
* tabplot
* readxl (v.1.4.3)
* dplyr (v.1.1.2)
* lubridate (v.1.9.2)
* ggplot2 (v.3.4.3)
* tidyr (v.1.3.0)
* ggsci (v.3.0.0)
* ggpubr (v.0.6.0)
* FastaUtils
* ape (v.5.7-1)
* TreeTools (v.1.10.0)
* phylotools (v.1.9-16)
* gtsummary (v.1.7.2)
* MASS (v.7.3-58.2)
* car (v.3.1-2)
* gt (v.0.9.0)
* OddsPlotty (v.1.0.2)
* effectsize (v.0.8.5)

# Epidemiological Data Sets #
### Figure 1A
<a href="https://github.com/erg6437/RSV-Molecular-Epidemiology/blob/main/Epidemiology-Data/Fig-1-NREVSS-2010-2020.csv"> CDC (NREVSS) National RSV Epidemiology Dataset [July 2010 - June 2020] </a> 

<a href="https://github.com/erg6437/RSV-Molecular-Epidemiology/blob/main/Epidemiology-Data/Fig-1-NREVSS-062020-062021-test-det-pp.zip"> CDC (NREVSS) National RSV Epidemiology Dataset [June 2020 - June 2021] </a> 

<a href="https://github.com/erg6437/RSV-Molecular-Epidemiology/blob/main/Epidemiology-Data/Fig-1-NREVSS-062021-present-test-det-pp.zip"> CDC (NREVSS) National RSV Epidemiology Dataset [June 2021 - March 2023] </a> 

### Figure 1B
<a href="https://github.com/erg6437/RSV-Molecular-Epidemiology/blob/main/Epidemiology-Data/Fig1-RSVNET-Hospitalization.csv.zip">Chicago Department of Public Health (CDPH) Weekly Aggregated Respiratory Virus Data </a> 

### Figure 5
<a href="https://github.com/erg6437/RSV-Molecular-Epidemiology/blob/main/Positive-Selection/102423-RSVB-F-USA.MEME.csv"> RSV-B 1957 - 2023 Fusion MEME data </a> 

<a href="https://github.com/erg6437/RSV-Molecular-Epidemiology/blob/main/Positive-Selection/102423-RSVB-F-USA.MEME.csv"> RSV-B 1957 - 2023 Fusion FUBAR data </a> 

<a href="https://github.com/erg6437/RSV-Molecular-Epidemiology/blob/main/Positive-Selection/102423-RSVB-F-5yr.MEME.csv"> RSV-B 2018 - 2023 Fusion MEME data </a> 

<a href="https://github.com/erg6437/RSV-Molecular-Epidemiology/blob/main/Positive-Selection/102423-RSVB-F-5yr.FUBAR.csv"> RSV-B 2018 - 2023 Fusion FUBAR data </a> 


### Supplementary Figure 5
<a href="https://github.com/erg6437/RSV-Molecular-Epidemiology/blob/main/Positive-Selection/080223-M2-1-MEME.csv"> RSV-B M2-1 MEME data </a> 

<a href="https://github.com/erg6437/RSV-Molecular-Epidemiology/blob/main/Positive-Selection/080223-M2-2-MEME.csv"> RSV-B M2-2 MEME data </a> 

<a href="https://github.com/erg6437/RSV-Molecular-Epidemiology/blob/main/Positive-Selection/07192022-G-MEME-RSVB.csv"> RSV-B Attachment Glycoprotein (G) MEME data</a> 

<a href="https://github.com/erg6437/RSV-Molecular-Epidemiology/blob/main/Positive-Selection/080223-L-MEME.csv"> RSV-B Attachment Polymerase (L) MEME data </a> 

# Phylogenetic Data Sets #
<a href="https://github.com/erg6437/RSV-Molecular-Epidemiology/blob/main/Sequence-Info/041223-RSVA-USA-NMH-metadata.csv"> USA RSV-A NCBI WGS Information </a> 

<a href="https://github.com/erg6437/RSV-Molecular-Epidemiology/blob/main/Sequence-Info/041223-RSVA-Global-NMH-metadata-location.csv"> Global RSV-A NCBI WGS Information </a> 

<a href="https://github.com/erg6437/RSV-Molecular-Epidemiology/blob/main/Sequence-Info/041223-RSVB-USA-metadata.csv"> USA RSV-B NCBI WGS Information </a> 

<a href="https://github.com/erg6437/RSV-Molecular-Epidemiology/blob/main/Sequence-Info/102223-RSVB-Global-NMH-metadata-dates%20(2).csv"> Global RSV-B NCBI WGS Information - Dates </a> 

<a href="https://github.com/erg6437/RSV-Molecular-Epidemiology/blob/main/Sequence-Info/111623-RSVF_G%202.zip"> Global RSV-B NCBI Fusion Information </a> 

<a href="https://github.com/erg6437/RSV-Molecular-Epidemiology/blob/main/Sequence-Info/111623-RSVF_G%202.zip"> Global RSV-B NCBI Attachment Glycoprotein (G) Information </a> 

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
