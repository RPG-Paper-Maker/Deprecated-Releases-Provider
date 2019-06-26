#!/usr/bin/env python3

import json
import sys
import os
from pprint import pprint

path = '../RPG-Paper-Maker'

for root, dirs, files in os.walk(path):
    if not root.endswith("MathUtils"):
        for name in files:
            if name.endswith((".cpp", ".h")):
                filepath = root + "/" + name
                print(filepath)
                with open(filepath, 'r') as fin:
                    data = fin.read().splitlines(True)
                if data[0].rstrip() == "/*":
                    with open(filepath, 'w') as fout:
                        fout.writelines(data[18:])