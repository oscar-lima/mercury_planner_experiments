#!/usr/bin/python

# calculate automatically plan lenght of a mercury.plan plan file

import sys

def calculate_length(filename="mercury.plan"):
    plan_length = 0
    try:
        with open(filename) as f:
            for line in f:  #Line is a string
                plan_length = plan_length + 1
        return plan_length
    except:
        return 'could not perform'

if len(sys.argv) == 2:
    folder = sys.argv[1]
    print 'parameters,plan_length'
    print '1,', calculate_length(folder + "/mercury.plan.1")
    print '2,', calculate_length(folder + "/mercury.plan.2")
    print '3,', calculate_length(folder + "/mercury.plan.3")
    print '4,', calculate_length(folder + "/mercury.plan.4")
    print '5,', calculate_length(folder + "/mercury.plan.5")
    #
    print '6,', calculate_length(folder + "/mercury.plan.6")
    print '7,', calculate_length(folder + "/mercury.plan.7")
    print '8,', calculate_length(folder + "/mercury.plan.8")
    print '9,', calculate_length(folder + "/mercury.plan.9")
    print '10,', calculate_length(folder + "/mercury.plan.10")
else:
    print 'USAGE : python calc_length.py folder'
