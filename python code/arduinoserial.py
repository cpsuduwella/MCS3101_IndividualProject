from time import sleep
import serial
ser = serial.Serial('/dev/ttyACM1',115200)
counter=32
while True:
    print ser.readline()
    sleep(.1)
