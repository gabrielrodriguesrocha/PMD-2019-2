#!/bin/bash

mkdir -p results/4-nodes/couchbase/workloadc_couchbase_custom

bin/ycsb load couchbase2 -s -P workloads/workloadc_couchbase_custom -threads 10 -p exportfile=./results/4-nodes/couchbase/workloadc_couchbase_custom/load.txt -p statsexportfile=./results/4-nodes/couchbase/workloadc_couchbase_custom/load.csv

sudo docker exec -it db cbq -u=Administrator -p=123456 -s="CREATE PRIMARY INDEX \`ycsb-primary\` on \`ycsb-workload-c\` USING GSI"

