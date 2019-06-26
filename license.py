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
                with open(filepath, 'r+') as f:
                    content = f.read()
                    f.seek(0, 0)
                    f.write("/*" + "\n" + "    RPG Paper Maker Copyright (C) 2017-2019 Marie Laporte" + "\n\n" + "    RPG Paper Maker engine is under LGPL-3 license." + "\n\n" + "    Commercial license for commercial use of your games:" + "\n" + "        https://creativecommons.org/licenses/by-nc/4.0/." + "\n\n" + "    See more information here: http://rpg-paper-maker.com/index.php/downloads.\n*/\n" + content)
