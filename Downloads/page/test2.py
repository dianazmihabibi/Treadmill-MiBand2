import os
f = open('txt.txt', 'r', os.O_NONBLOCK)
while 1:
    print f.read()