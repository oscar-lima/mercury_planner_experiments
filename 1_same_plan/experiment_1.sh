#!/bin/bash

# check for correct arguments
if [[ $# != 1 ]]; then
    echo 'USAGE ./experiment_1.sh problem_number'
    exit 1
fi

DOMAIN='btt_domain_w_cost'
PROBLEM=${1}

# setup paths
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DOMAIN_BASE_DIR=$CURRENT_DIR/../domains
DOMAIN_PATH=$DOMAIN_BASE_DIR/$DOMAIN/domain.pddl
PROBLEM_PATH=$DOMAIN_BASE_DIR/$DOMAIN/problems/p$PROBLEM.pddl
MERCURY_BASE_PATH=$CURRENT_DIR/../mercury_planner/seq-sat-mercury
SCRIPT_PATH=$CURRENT_DIR/../scripts
TIMEOUT='10.0'
SEARCH_TYPE='true' # parametrized
NUMBER_OF_RUNS='10'

# delete previous data if any
# if [ -d "$CURRENT_DIR/runs" ]; then
#     rm -rf $CURRENT_DIR/runs
# fi

function compare_plans(){
python $SCRIPT_PATH/is_file_content_same.py $CURRENT_DIR/runs/p$PROBLEM/$3/mercury.plan.$1 $CURRENT_DIR/runs/p$PROBLEM/$3/mercury.plan.$2
}

function run(){
    # run planner
    echo '[EXPERIMENTS] 1. run planner'
    bash $SCRIPT_PATH'/mercury_planner.sh' $DOMAIN_PATH $PROBLEM_PATH $MERCURY_BASE_PATH $TIMEOUT $SEARCH_TYPE

    mkdir -p runs/p$PROBLEM/$1/local_results
    mv elapsed.time mercury.plan.* runs/p$PROBLEM/$1

    # compare files
    echo '[EXPERIMENTS] 2. comparing files'

    # generate comparison results
    for i in `seq 2 $NUMBER_OF_RUNS`;
    do
        compare_plans 1 $i $1 >> $CURRENT_DIR/runs/p$PROBLEM/$1/local_results/are_plans_equal_result.txt
    done

    echo '[EXPERIMENTS] 3. generating plan lengths'
    python $SCRIPT_PATH/calc_lenght.py $CURRENT_DIR/runs/p$PROBLEM/$1 > $CURRENT_DIR/runs/p$PROBLEM/$1/local_results/plan_lengths.txt

    echo '[EXPERIMENTS] 4. generating planning times'
    python $SCRIPT_PATH/calc_time.py $CURRENT_DIR/runs/p$PROBLEM/$1 > $CURRENT_DIR/runs/p$PROBLEM/$1/local_results/planning_times.txt
}


for i in `seq 1 $NUMBER_OF_RUNS`;
do
    run $i
done

# global analysis, with 10 runs
mkdir -p runs/p$PROBLEM/global_results/are_plans_equal

# global results base directory
GR_BASE_DIR=$CURRENT_DIR/runs/p$PROBLEM

for i in `seq 1 $NUMBER_OF_RUNS`;
do
    for j in `seq 2 $NUMBER_OF_RUNS`;
    do
        python $SCRIPT_PATH/is_file_content_same.py $GR_BASE_DIR/1/mercury.plan.$i $GR_BASE_DIR/$j/mercury.plan.$i >> $GR_BASE_DIR/global_results/are_plans_equal/$i.txt
    done
done

# cat all are_plans_equal files to a single one
cat $GR_BASE_DIR/global_results/are_plans_equal/* > $GR_BASE_DIR/global_results/are_plans_equal/combined.txt

# analyse if plans are equal
python $SCRIPT_PATH/is_content_all_true.py $GR_BASE_DIR/global_results/are_plans_equal/combined.txt > $GR_BASE_DIR/global_results/are_plans_equal.txt

# calculate average times
python $SCRIPT_PATH/average_times.py $GR_BASE_DIR > $GR_BASE_DIR/global_results/average_times.txt

# calculate plan length
python $SCRIPT_PATH/calc_lenght.py $GR_BASE_DIR/1/ > $GR_BASE_DIR/global_results/plan_lengths.txt

# are plans solving the goal? -> VAL
mkdir -p runs/p$PROBLEM/global_results/does_plan_solve_goal
for i in `seq 1 $NUMBER_OF_RUNS`;
do
    command $CURRENT_DIR/../plan_validation/build/plan_validator $DOMAIN_PATH $PROBLEM_PATH $GR_BASE_DIR/1/mercury.plan.$i >> runs/p$PROBLEM/global_results/does_plan_solve_goal/plan_solve_goal.txt
done

python $SCRIPT_PATH/is_content_all_true.py $GR_BASE_DIR/global_results/does_plan_solve_goal/plan_solve_goal.txt > $GR_BASE_DIR/global_results/all_plans_solve_goal.txt



