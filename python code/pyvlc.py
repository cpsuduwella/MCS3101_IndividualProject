#!/usr/bin/python
import serial
import syslog
import time
import os

#The following line is for serial over GPIO
port = '/dev/ttyACM0'
ard = serial.Serial(port,115200,timeout=50)

mm = ''
while(True):
    mm = ard.readline()
    print mm
exit()
