
conda create -y -n nf-env -c conda-forge -c bioconda openjdk==11.0.20 singularity nextflow=22.10.0 git bowtie2 cxx-compiler glpk graphviz mamba

conda activate nf-env

mkdir resources
mkdir resources/v1.4

wget https://apps-01.i-med.ac.at/resources/nextneopi/nextNEOpi_1.4_resources.tar.gz

tar -xvzf nextNEOpi_1.4_resources.tar.gz

Download request: https://w3.genome.med.kyoto-u.ac.jp/HLA-HD/

wget https://w3.genome.med.kyoto-u.ac.jp/HLA-HD/filedownload/hlahd.1.7.0.tar.gz

tar -zxvf hlahd.1.7.0.tar.gz

sh install.sh

Request license for mixcr https://licensing.milaboratories.com/

export TMP="/mnt/SCS/data_2/Users/Willem/tmp"
export SINGULARITY_TMPDIR="/mnt/SCS/data_2/Users/Willem/tmp"
export NXF_SINGULARITY_CACHEDIR="/mnt/SCS/data_2/Users/Willem/tmp" 
export PATH=$PATH:/mnt/SCS/data_2/Users/Willem/EMC-Neoantigen/bin/hlahd.1.7.0/bin

<!-- NXF_WORK=/mnt/FS2/data_1/TESLA-Neoantigen/Tools/work -->

### 1.4 Testdata
If you want to test the pipeline using a working minimal test dataset you may download one from
<https://apps-01.i-med.ac.at/resources/nextneopi/nextNEOpi_testdata.tar.gz>

tar -zxvf nextNEOpi_testdata.tar.gz

# params.config
  // Directories (need to be in quotes)
  tmpDir          = "/mnt/SCS/data_2/Users/Willem/tmp"  // Please make sure that there is enough free space (~ 50G)
  // workDir         = "/mnt/FS2/data_1/TESLA-Neoantigen/Tools/work"
  outputDir       = "/mnt/SCS/data_1/TESLA-Neoantigen/Results"

# Create singularity image
sudo singularity build --sandbox pva_pvac_vt pva_pvac_vt.def
sudo singularity build pva_pvac_vt.sif pva_pvac_vt
cp pva_pvac_vt.sif apps-01.i-med.ac.at-images-singularity-pVACtools_4.0.1_icbi_4ae2625d.sif

nextflow run nextNEOpi.nf --batchFile TESLA_ID1.csv -profile singularity -config conf/params.config --accept_license -resume