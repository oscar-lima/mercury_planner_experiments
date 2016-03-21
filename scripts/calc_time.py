#!/usr/bin/python

# this python script opens a textfile containing numbers on it
# and sums them up, is useful to calculate the time that it took to
# plan for mercury_planner

import sys

def parse_string_to_number(string):
    try:
        return float(string)
    except:
        return -1

def calculate_time(filename="elapsed.time"):
    translate_time = 0
    preprocess_time = 0
    param1_time = 0
    param2_time = 0
    param3_time = 0
    param4_time = 0
    param5_time = 0
    param6_time = 0
    param7_time = 0
    param8_time = 0
    param9_time = 0
    param10_time = 0
    count = 0
    with open(filename) as f:
        for line in f:  #Line is a string
            count = count + 1
            if count == 1 or count == 2:
                translate_time += parse_string_to_number(line)
            elif count == 3 or count == 6 or count == 9 or count == 12 or count == 15 or count == 18 or count == 21 or count == 24 or count == 27 or count == 30 or count == 33:
                continue
            elif count == 4 or count == 5:
                preprocess_time += parse_string_to_number(line)
            elif count == 7 or count == 8:
                param1_time += parse_string_to_number(line)
            elif count == 10 or count == 11:
                param2_time += parse_string_to_number(line)
            elif count == 13 or count == 14:
                param3_time += parse_string_to_number(line)
            elif count == 16 or count == 17:
                param4_time += parse_string_to_number(line)
            elif count == 19 or count == 20:
                param5_time += parse_string_to_number(line)
            elif count == 22 or count == 23:
                param6_time += parse_string_to_number(line)
            elif count == 25 or count == 26:
                param7_time += parse_string_to_number(line)
            elif count == 28 or count == 29:
                param8_time += parse_string_to_number(line)
            elif count == 31 or count == 32:
                param9_time += parse_string_to_number(line)
            elif count == 34 or count == 35:
                param10_time += parse_string_to_number(line)
    print '1,', translate_time + preprocess_time + param1_time
    print '2,', translate_time + preprocess_time + param2_time
    print '3,', translate_time + preprocess_time + param3_time
    print '4,', translate_time + preprocess_time + param4_time
    print '5,', translate_time + preprocess_time + param5_time
    print '6,', translate_time + preprocess_time + param6_time
    print '7,', translate_time + preprocess_time + param7_time
    print '8,', translate_time + preprocess_time + param8_time
    print '9,', translate_time + preprocess_time + param9_time
    print '10,', translate_time + preprocess_time + param10_time
    return

if len(sys.argv) == 2:
    calculate_time(filename=sys.argv[1] + '/elapsed.time')
else:
    print 'USAGE : python calc_time.py path/elapsed.time'
