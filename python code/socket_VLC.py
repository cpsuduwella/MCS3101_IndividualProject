import socket
import time
import sys

TCP_IP = '192.168.1.33'
TCP_PORT = 21
print('begin socket connection')
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
print('.....')
s.connect((TCP_IP,TCP_PORT))
print('connected')
s.send('1\10\13')
time.sleep(0.001)
#s.send('\10\13')
s.send(sys.argv[1]+'\10\13')
s.close()
