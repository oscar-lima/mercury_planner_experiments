#!/usr/bin/python

import sys

# checks if all content of the file is filled with 'true'

#base_path='/home/oscar/mercury_planner_experiments/1_same_plan/runs/p1'
if len(sys.argv) != 2:
    print 'USAGE : python is_content_all_true.py file_path'
    sys.exit(1)

file_path = sys.argv[1]

temp = open(file_path,'r').read().split('\n')

i = 0
for each in temp:
    if each != 'true':
        i = i + 1

if i == 1:
    print 'true'
else:
    print 'false'
