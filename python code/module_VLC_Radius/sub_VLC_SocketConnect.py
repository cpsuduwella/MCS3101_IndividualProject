#!/usr/bin/env n

import socket

TCP_IP = '192.168.1.33'
TCP_PORT = 21
BUFFER_SIZE = 1024
MSG_ON = '1'
MSG_DATA = '12345678'

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect((TCP_IP, TCP_PORT))
print("connected")
s.send(MSG_ON)
d1 = s.recv(BUFFER_SIZE)
print("on")
s.send(MSG_DATA)
d2 = s.recv(BUFFER_SIZE)
s.close()
print("send data")
exit(0)
