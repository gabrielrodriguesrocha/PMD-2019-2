#!/bin/bash

mkdir -p results/4-nodes/couchbase/workloadq1_couchbase_custom

bin/ycsb load couchbase2 -s -P workloads/workloadq1_couchbase_custom -threads 10 -p exportfile=./results/4-nodes/couchbase/workloadq1_couchbase_custom/not_bounded/load.txt -p statsexportfile=./results/4-nodes/couchbase/workloadq1_couchbase_custom/not_bounded/load.csv

sudo docker exec -it db cbq -u=Administrator -p=123456 -s="CREATE PRIMARY INDEX \`ycsb-primary\` on \`ycsb-workload-q\` USING GSI"

sudo docker exec -it db cbq -u=Administrator -p=123456 -s="CREATE INDEX \`ycsb_address_country\` on \`ycsb-workload-q\` (address.country) USING GSI"
