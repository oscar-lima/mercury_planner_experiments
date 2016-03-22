#!/usr/bin/env python

# difflib_test

import difflib
import sys
import os.path

if len(sys.argv) != 3:
    print 'Error : Received incorrects number of arguments -> ', len(sys.argv)-1
    print 'USAGE : python is_file_content_same.py file1.txt file2.txt'
    sys.exit()

#check file existance
def check_file_existance(file_):
    if not os.path.isfile(file_):
        sys.exit()

check_file_existance(sys.argv[1])
check_file_existance(sys.argv[2])

file1_length = sum(1 for line in open(sys.argv[1]))
file2_length = sum(1 for line in open(sys.argv[2]))

if file1_length != file2_length:
    print "false"
    sys.exit()

file1 = open(sys.argv[1], 'r')
file2 = open(sys.argv[2], 'r')

diff = difflib.ndiff(file1.readlines(), file2.readlines())
delta = ''.join(x[2:] for x in diff if x.startswith('- '))
if delta == "":
    print "true"
else:
    print "false"

file1.close
file2.close
