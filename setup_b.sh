#!/bin/bash

mkdir -p results/4-nodes/couchbase/workloadb_couchbase_custom

bin/ycsb load couchbase2 -s -P workloads/workloadb_couchbase_custom -threads 10 -p exportfile=./results/4-nodes/couchbase/workloadb_couchbase_custom/load.txt -p statsexportfile=./results/4-nodes/couchbase/workloadb_couchbase_custom/load.csv

