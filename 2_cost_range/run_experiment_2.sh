#!/bin/bash

NUMBER_OF_DOMAINS_TO_RUN='300'

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# delete previous data if any
if [ -d "$CURRENT_DIR/runs" ]; then
    rm -rf $CURRENT_DIR/runs
fi

# generate domains
bash $CURRENT_DIR/../domains/btt_domain/domains/generate_domains.sh $NUMBER_OF_DOMAINS_TO_RUN

for i in `seq 1 $NUMBER_OF_DOMAINS_TO_RUN`;
do
    bash $CURRENT_DIR/experiment_2.sh $i
done
