#!/usr/bin/env python

import sys
import io
import re

import requests
from bs4 import BeautifulSoup

html = io.open(sys.argv[1], 'r', encoding='utf8').read()

rignore = re.compile(r'(?i)<meta\shttp-equiv="?x-ua-compatible"?.+?>')

payload = {
    'fragment': rignore.sub('', html),
    'charset': 'utf-8',
    'doctype': 'HTML5',
    'group': 0,
    'user-agent': 'W3C_Validator/1.3 http://validator.w3.org/services',
}

for i in range(0, 3):
    r = requests.post('http://validator.w3.org/check', data=payload)
    if r.status_code == 200:
        break

soup = BeautifulSoup(r.text)
title = soup.title.contents[0]
# extract Valid or Invalid
result = re.sub('(?ms).*\[(.*)\].*', r'\1', title)

#print(r.text.encode('utf8'))

if result == 'Valid':
    color = 32 # green
else:
    color = 31 # red
print('\x1b[{0}m{1}\x1b[0m'.format(color, result))

for err in soup.find_all('li', class_='msg_err'):
    pos = re.sub('(?ms)\s+', ' ', err.em.get_text())
    msg = err.find('span', class_='msg').get_text()
    code = err.find('pre').get_text()
    print(u'\x1b[1m{0}\x1b[0m: {1}\n\x1b[34m{2}\x1b[0m'.format(pos, msg, code))

if result != 'Valid':
    sys.exit(result)
