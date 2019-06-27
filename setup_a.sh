#!/bin/bash

bin/ycsb load couchbase2 -s -P workloads/workloada_couchbase_custom -threads 10 -p exportfile=./results/4-nodes/couchbase/workloada_couchbase_custom/load.txt -p statsexportfile=./results/4-nodes/couchbase/workloada_couchbase_custom/load.csv

