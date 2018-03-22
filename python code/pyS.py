import time
import serial

# configure the serial connections (the parameters differs on the device you are connecting to)
ser = serial.Serial(
    port='/dev/ttyUSB0',
    baudrate=115200,
    parity=serial.PARITY_ODD,
    stopbits=serial.STOPBITS_TWO,
    bytesize=serial.SEVENBITS
)

ser.isOpen()


#input=1
while 1 :
    # get keyboard input
    #input = raw_input(">> ")
        # Python 3 users
        # input = input(">> ")
    ##if input == 'exit':
    #    ser.close()
    #    exit()
    #else:
        # send the character to the device
        # (note that I happend a \r\n carriage return and line feed to the characters - this is requested by my device)
        #ser.write(input + '\r\n')
        out = ''
        # let's wait one second before reading output (let's give device time to answer)
        #time.sleep(0)
        while ser.inWaiting() > 0:
            print hex.encode(ser.read(1))
