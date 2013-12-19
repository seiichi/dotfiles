#!/usr/bin/env python

import sys
import codecs

import misaka as m
from jinja2 import Template
import requests

EXTENSIONS = m.EXT_NO_INTRA_EMPHASIS | \
             m.EXT_TABLES | \
             m.EXT_FENCED_CODE | \
             m.EXT_AUTOLINK | \
             m.EXT_STRIKETHROUGH | \
             m.EXT_LAX_HTML_BLOCKS | \
             m.EXT_SPACE_HEADERS | \
             m.EXT_SUPERSCRIPT

githubcss = 'https://gist.github.com/andyferra/2554919/raw/2e66cabdafe1c9a7f354aa2ebf5bc38265e638e5/github.css'

sys.stdout = codecs.getwriter('utf8')(sys.stdout)
sys.stdin = codecs.getreader('utf8')(sys.stdin)

css = requests.get(githubcss).text
html = m.html(sys.stdin.read(), extensions=EXTENSIONS)

template = Template(u'''<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <style>{{ css }}</style>
    </head>
    <body>{{ body }}</body>
</html>''')
print(template.render(body=html, css=css))
