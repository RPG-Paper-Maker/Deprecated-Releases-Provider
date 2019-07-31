#!/usr/bin/env python3

import json
import sys
import os
from pprint import pprint

path = '../Game-Scripts'

for root, dirs, files in os.walk(path):
    if not root.endswith("Loaders"):
        for name in files:
            if not name.endswith("three.js") and not name.endswith("includes.js"):
                if name.endswith((".cpp", ".h", ".qml", ".js")):
                    filepath = root + "/" + name
                    print(filepath)
                    with open(filepath, 'r') as fin:
                        data = fin.read().splitlines(True)
                    if data[0].rstrip() == "/*":
                        with open(filepath, 'w') as fout:
                            fout.writelines(data[8:])
