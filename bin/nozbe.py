#!/usr/bin/env python
#
# nozbe.py
#
# Copyright (c) 2012 Seiichi SATO <seiichisato@gmail.com>
# Licensed under the BSD 2.0 new license, which can be found at:
#
#   http://www.opensource.org/licenses/bsd-license.php
#
# Setup:
#
#  $ echo YOUR_API_KEY > ~/.nozbe_api_key
#
# Usage:
#
# - show next actions:
#   $ nozbe.py
#
# - add new action:
#   $ nozbe.py NEW ACTION
#

import os
import sys
import urllib.request, urllib.parse, urllib.error
import urllib.request, urllib.error, urllib.parse
import json

_BASE_URL = 'https://webapp.nozbe.com/api'
_API_KEY = '%s/.nozbe_api_key' % (os.path.expanduser('~'))

def apikey():
    return open(_API_KEY).read().strip()

def add_new_action(key, name):
    name = urllib.parse.quote(name)
    url = '%s/newaction/name-%s/what-next/key-%s' % (_BASE_URL, name, key)
    try:
        u = urllib.request.urlopen(url)
        json.loads(u.read().decode())
    except urllib.error.URLError as e:
        print('failed to access the server [%s]' % (e))
    except ValueError as e:
        print('failed to add new action [%s]' % (e))

def show_next_actions(key):
    url = '%s/actions/what-next/key-%s' % (_BASE_URL, key)
    try:
        u = urllib.request.urlopen(url)
        actions = json.loads(u.read().decode())
        for i, act in enumerate(actions):
            if act['done']:
                continue
            print(act['name'])
    except urllib.error.URLError as e:
        print('failed to access the server [%s]' % (e))
    except ValueError as e:
        print('failed to get next actions [%s]' % (e))

if __name__ == '__main__':
    key = apikey()
    if len(sys.argv) > 1:
        add_new_action(key, ' '.join(sys.argv[1:]))
    else:
        show_next_actions(key)
