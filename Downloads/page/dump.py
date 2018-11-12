import sys
import os
import time
import datetime
from base import MiBand2
from bluepy.btle import BTLEException

#Mi Band MAC = 'D6:EC:F2:B3:70:BA'
MAC = 'D6:EC:F2:B3:70:BA'
#filepath = sys.argv[2]
currentDT = datetime.datetime.now()

##if os.path.exists(sys.argv[2]):
##    os.remove(sys.argv[2])
##fp = open('log.txt', 'a', os.O_NONBLOCK)
 
def log(rate):
    fp = open('log.txt', 'a', os.O_NONBLOCK)
    step = band.get_steps()
    data = "%s,%s,%s\n" % (currentDT.strftime("%d-%m-%Y %H:%M:%S"), rate, step)
    fp.write(data)
    print data
    fp.close()
    return log

while True:
    try:
        band = MiBand2(MAC, debug=True)
        band.setSecurityLevel(level="medium")
        band.authenticate()
        band.start_heart_rate_realtime(heart_measure_callback=log)
        band.disconnect()
    except BTLEException:
        pass
