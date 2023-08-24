run:
	nextflow run nextNEOpi.nf --batchFile batchFile_TESLA.csv -profile singularity -config conf/params.config --accept_license

resume:
	nextflow run nextNEOpi.nf --batchFile batchFile_TESLA.csv -profile singularity -config conf/params.config --accept_license -resume
