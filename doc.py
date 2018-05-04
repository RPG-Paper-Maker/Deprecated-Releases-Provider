#!/usr/bin/env python3

import json
import sys
import datetime
import os
from pprint import pprint

with open('../RPG-Paper-Maker/versions.json') as f:
    data = json.load(f)

l = data['versions-2.0']
version = sys.argv[1]
versionSpecial = version.replace(".", "-")
date = datetime.datetime.now().strftime("%d/%m/%y")
os.mkdir('result')
for x in l : 
	if x['v'] == version :
		g = open('result/git.txt',"w")
		g.write("**New features:**\n\n")
		for feature in x['features'] :
			g.write("* " + feature + "\n")
		g.write("\n**Bugs corrections:**\n\n")
		for bug in x['bugs'] :
			g.write("* " + bug + "\n")
		g.close()
		g = open('result/downloads.txt',"w")
		g.write('<h3>RPG Paper Maker :</h3><p>&nbsp;Check all the last releases <a href="https://github.com/Wano-k/RPG-Paper-Maker/releases" target="_blank">here</a>.</p><h4>For Windows</h4><h2><a class="btn btn-info" style="margin: 0; width: 15%;" href="https://github.com/RPG-Paper-Maker/RPG-Paper-Maker/releases/download/v-' + version + '-beta/RPG-Paper-Maker-v-' + versionSpecial + '-WIN.zip" target="_blank">[BETA] DOWNLOAD BETA v.'+ version + ' [120Mo]</a></h2><pre>Last version : ' + date + ' v.' + version + '.</pre><h4>For Linux</h4><h2><a class="btn btn-info" style="margin: 0; width: 15%;" href="https://github.com/RPG-Paper-Maker/RPG-Paper-Maker/releases/download/v-' + version + '-beta/RPG-Paper-Maker-v-' + versionSpecial + '-LINUX.tar.gz" target="_blank">[BETA] DOWNLOAD BETA v.' + version + ' [160Mo]</a></h2><pre>Last version : ' + date + ' v.' + version + '.</pre><h4>For Mac OSX</h4><p>- No Downloads -</p><p>&nbsp;</p>')
		g.close()
		g = open('result/news.txt',"w")
		g.write('<p>Release notes:</p><h3>New features:</h3><ul>');
		for feature in x['features'] :
			g.write("<li>" + feature + "</li>")
		g.write('</ul><h3>Bugs corrections:</h3><ul>');
		for bug in x['bugs'] :
			g.write("<li>" + bug + "</li>")
		g.write('</ul><p>&nbsp;</p><h4>For Windows</h4><h2><a class="btn btn-info" style="margin: 0; width: 15%;" href="https://github.com/RPG-Paper-Maker/RPG-Paper-Maker/releases/download/v-' + version + '-beta/RPG-Paper-Maker-v-' + versionSpecial + '-WIN.zip" target="_blank">[BETA] DOWNLOAD BETA v.' + version + ' [120Mo]</a></h2><h4>For Linux</h4><h2><a class="btn btn-info" style="margin: 0; width: 15%;" href="https://github.com/RPG-Paper-Maker/RPG-Paper-Maker/releases/download/v-' + version + '-beta/RPG-Paper-Maker-v-' + versionSpecial + '-LINUX.tar.gz" target="_blank">[BETA] DOWNLOAD BETA v.' + version + ' [160Mo]</a></h2>')
		g.close()