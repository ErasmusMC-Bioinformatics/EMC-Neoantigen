
conda create -y -n nf-env -c conda-forge -c bioconda openjdk==11.0.20 singularity nextflow=22.10.0 git bowtie2 cxx-compiler

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

export TMP="/mnt/FS2/data_1/TESLA-Neoantigen/Tools/nextNEOpie/tmp"
export SINGULARITY_TMPDIR="/mnt/FS2/data_1/TESLA-Neoantigen/Tools/nextNEOpie/tmp"
export NXF_SINGULARITY_CACHEDIR="/mnt/FS2/data_1/TESLA-Neoantigen/Tools/nextNEOpie/tmp" 
export PATH=$PATH:/home/willem/EMC-Neoantigen/bin/hlahd.1.7.0/bin
export NXF_WORK=/mnt/FS2/data_1/TESLA-Neoantigen/Tools/work

### 1.4 Testdata
If you want to test the pipeline using a working minimal test dataset you may download one from
<https://apps-01.i-med.ac.at/resources/nextneopi/nextNEOpi_testdata.tar.gz>