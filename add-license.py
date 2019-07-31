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
                    f.write("/*" + "\n" + "    RPG Paper Maker Copyright (C) 2017-2019 Marie Laporte" + "\n\n" + "    RPG Paper Maker engine is under proprietary license.\n    This source code is also copyrighted." + "\n\n" + "    Use Commercial edition for commercial use of your games.\n    See RPG Paper Maker EULA here:" + "\n" + "        http://rpg-paper-maker.com/index.php/eula.\n*/\n" + content)
