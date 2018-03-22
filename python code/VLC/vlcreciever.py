#!/usr/bin/python
import serial
import syslog
import time
import os

#The following line is for serial over GPIO
port = '/dev/ttyUSB0'
ard = serial.Serial(port,115200,timeout=50)

m = ''
while(True):
    m = ard.readline()
    #m = trim(m)
    print (m)
    if(len(m)>5):
    #    s = 'nmcli d wifi connect STAFF password ' + m + ' iface wlp2s0' 
	#print (m)
	os.system(m)
	m = ''

