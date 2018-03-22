import os
import random
import socket
import time

TCP_IP = '192.168.1.33'
TCP_PORT = 21
print('begin socket connection')
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
print('....')
s.connect((TCP_IP, TCP_PORT))
print('connected')
while 1:
    print ("..")
    x = random.random()
    strx = str(x)
    u = "\r\n\"VLC001\" Cleartext-Password := \"" + str(x) + "\"\r\n"
    print(u)
    f = open('/etc/freeradius/users','r+')
    f.seek(0,0)
    f.write(u)
    f.close()
    
    cmd = 'sudo service freeradius restart'
    os.system(cmd)
    print('end')
    s.send(strx)
    time.sleep(1)
    s.send(' ')
    time.sleep(60)

#s.close()
