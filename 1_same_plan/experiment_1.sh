#!/bin/bash

DOMAIN='btt_domain_w_cost'
PROBLEM='1'

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DOMAIN_BASE_DIR=$CURRENT_DIR/../domains
DOMAIN_PATH=$DOMAIN_BASE_DIR/$DOMAIN/domain.pddl
PROBLEM_PATH=$DOMAIN_BASE_DIR/$DOMAIN/problems/p$PROBLEM.pddl
MERCURY_BASE_PATH=$CURRENT_DIR/../seq-sat-mercury
TIMEOUT='10.0'
SEARCH_TYPE='true' #parametrized

./mercury_planner.sh $DOMAIN_PATH $PROBLEM_PATH $MERCURY_BASE_PATH $TIMEOUT $SEARCH_TYPE