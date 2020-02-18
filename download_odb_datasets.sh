#!/usr/bin/env bash

set -eux

(
cd test_data || exit 1

wget https://busco-data.ezlab.org/v4/data/lineages/hymenoptera_odb10.2019-11-20.tar.gz
tar -zxvpf hymenoptera_odb10.2019-11-20.tar.gz && rm hymenoptera_odb10.2019-11-20.tar.gz

wget https://busco-archive.ezlab.org/v3/datasets/hymenoptera_odb9.tar.gz
tar -zxvpf hymenoptera_odb9.tar.gz && rm hymenoptera_odb9.tar.gz
)