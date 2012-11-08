#!/usr/bin/env python

import sys

images = [
    {
        'file': 'u-boot.bin',
        'offset': 0x0
    }, {
        'file': 'uImage',
        'offset': 0x40000
    }, {
        'file': 'rootfs.ubi',
        'offset': 0x300000
    }
]


f = open(sys.argv[1], 'wb')
size = 16*1024*1024

f.write(chr(0xff) * size)

for img in images:
    f.seek(img['offset'])
    i = open(img['file'], 'rb')
    while 1:
        b = i.read(1)
        if b == '':
            break
        f.write(b)

f.close()
