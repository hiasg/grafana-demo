#!/usr/bin/env python

import fileinput
import time
print '# DML'
print '# CONTEXT-DATABASE: workshop'

# start_ts = 1498569490
# 1728000 =~ 20 days
# 1296000 =~ 15 days
# 864000 =~ 10 days
start_ts = int(time.time()) - 864000

for line in fileinput.input():
    splited = line.rstrip().split(':',1)
    # check = splited[0] + ':' + splited[1]

    #diff_time = int(splited[-1]) - reset
    #check = str(diff_time) + ':' + splited[-2]
    time = start_ts + int(splited[0])
    print splited[1] + ' ' + str(time)

