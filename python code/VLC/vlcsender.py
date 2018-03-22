import os
import random
import socket
import time
import sys

TCP_IP = '192.168.1.33'
TCP_PORT = 21
print('begin socket connection')
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
print('....')
s.connect((TCP_IP, TCP_PORT))
print('connected')

time.sleep(2)
print('...')
strssid = sys.argv[1]
strpwd = sys.argv[2]
s.send('1')
time.sleep(1)
strcmd = 'nmcli d wifi connect ' + strssid + ' password ' + strpwd + ' iface wlan4'
s.send(strcmd)
time.sleep(1)
s.close()
