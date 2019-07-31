# Releases Provider

This repository contains all scripts used in order to generate docs and releases automatically.

### Steps for publishing a new release

* Update `trees.json`
* Update last version in `versions.json`
* Generate executable binaries for each platforms:
 * Mac OSX:

 	`./binary-linux.sh`

 * Windows (TODO):

    `./binary-win.bat`
 
 * Linux:

    `./binary-linux.sh`
    

* Create all tags:

    `./tag-all.sh [versionTag]`

* Check if all is working good with develop updater
* Publish on master to make it available:

    `./master-all.sh`
* Generate all the stuff for publishing on social medias / website news:

    `python3 ./doc.py [versionTag]`