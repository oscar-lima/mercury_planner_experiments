#!/bin/bash

# check for correct arguments
if [[ $# != 1 ]]; then
    echo 'USAGE ./generated_domains.sh maximum_cost_value'
    exit 1
fi

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

MAX_COST=${1}

#delete previous data if any
if [ -d "$CURRENT_DIR/generated_domains" ]; then
    rm -rf $CURRENT_DIR/generated_domains
fi

mkdir $CURRENT_DIR/generated_domains

for i in `seq 1 $MAX_COST`;
do
    cat $CURRENT_DIR/first_half_domain.pddl >> $CURRENT_DIR/generated_domains/domain$i.pddl
    echo "                          (increase (total-cost) $i)" >> $CURRENT_DIR/generated_domains/domain$i.pddl
    cat $CURRENT_DIR/second_half_domain.pddl >> $CURRENT_DIR/generated_domains/domain$i.pddl
done
