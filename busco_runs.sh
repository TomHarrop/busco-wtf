#!/usr/bin/env bash

set -eux

nohup singularity exec \
    -B /cifs,/media,${PWD},${TMPDIR} \
    -H $(mktemp -d) \
    --pwd ${PWD} \
    --containall --cleanenv \
    --writable-tmpfs \
    img/busco_3.0.2.sif \
    run_BUSCO.py \
    --force \
    --tmp_path "$(mktemp -d)" \
    --in test_data/NC_037638.fasta \
    --out busco_v302 \
    --lineage test_data/hymenoptera_odb9 \
    --cpu 8 \
    --species honeybee1 \
    --mode genome \
    &> busco_v302.log &

nohup singularity exec \
    -B /cifs,/media,${PWD},${TMPDIR} \
    -H $(mktemp -d) \
    --pwd ${PWD} \
    --containall --cleanenv \
    --writable-tmpfs \
    docker://ezlabgva/busco:v4.0.4_cv1 \
    busco \
    --force \
    --in test_data/NC_037638.fasta \
    --out busco_404_docker \
    --lineage_dataset test_data/hymenoptera_odb10 \
    --cpu 8 \
    --augustus_species honeybee1 \
    --mode genome \
    &> busco_404_docker.log &
