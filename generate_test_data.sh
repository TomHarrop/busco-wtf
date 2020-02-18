#!/usr/bin/env bash

set -eux

(
cd test_data || exit 1
wget ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/003/254/395/GCF_003254395.2_Amel_HAv3.1/GCF_003254395.2_Amel_HAv3.1_genomic.fna.gz
)

singularity exec \
    -B /cifs,/media,${PWD},${TMPDIR} \
    -H $(mktemp -d) \
    --pwd ${PWD} \
    --containall --cleanenv \
    img/bbmap_38.76.sif \
    filterbyname.sh \
    in=test_data/GCF_003254395.2_Amel_HAv3.1_genomic.fna.gz \
    names=NC_037638.1 \
    include=t \
    prefix=t \
    tws=t \
    out=test_data/NC_037638.fasta


