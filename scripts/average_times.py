#!/usr/bin/python

import sys

def parse_string_to_number(string):
    try:
        return float(string)
    except:
        return -1

#base_path="/home/oscar/mercury_planner_experiments/1_same_plan/runs/p1"
if len(sys.argv) != 2:
    print 'USAGE : python average_times.py base_path'
    sys.exit(1)

base_path = sys.argv[1]

time_paths=[]
for i in range(1, 11):
    #print i
    time_paths.append(base_path + '/' + str(i) + '/local_results/planning_times.txt')


global_times = []

for i in range(0, 10):
    local_times = []
    with open(time_paths[i]) as f:
        for line in f:  #Line is a string
            local_times.append(parse_string_to_number(line))
    global_times.append(local_times)

#print global_times
#print '-------'

global_average_list = []
for i in range(0, 10):
    local_average_list = []
    for each in global_times:
        local_average_list.append(each[i])
    global_average_list.append(local_average_list)

#print global_average_list

#print "---------"
print 'problem, average_time'

i = 0
for each in global_average_list:
    print str(i+1) + ', ' + str(sum(each)/len(each))
    i = i + 1
