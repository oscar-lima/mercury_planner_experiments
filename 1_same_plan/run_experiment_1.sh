#!/bin/bash

NUMBER_OF_PROBLEMS_TO_RUN='30'
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# delete previous data if any
if [ -d "$CURRENT_DIR/runs" ]; then
    rm -rf $CURRENT_DIR/runs
fi

for i in `seq 1 $NUMBER_OF_PROBLEMS_TO_RUN`;
do
    bash $CURRENT_DIR/experiment_1.sh $i
done
