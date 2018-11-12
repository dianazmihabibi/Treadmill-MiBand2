import os
import sys
import time

while True:
    graph_data = open('log.txt', 'r',os.O_NONBLOCK).read()
    lines = graph_data.split('\n')
    batas = len(lines)-2

    waktu = []
    bpm = []
    step = []

    for line in lines[batas:]:
        if len(line)>= 1:
            a, b, c = line.split(',')
        waktu.append(str(a))
        bpm.append(str(b))
        step.append(str(c))
    print (bpm[1],step[1])
    time.sleep(2.3)
    
        
##while True:
##while True:
##    waktu.append(str(a))
##    bpm.append(str(b))
##    step.append(str(c))
##    print (bpm,step)
##    time.sleep(3)
##    waktu.remove(str(a))
##    bpm.remove(str(b))
##    step.remove(str(c))



