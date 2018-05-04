# Releases Provider

This repository contains all scripts used in order to generate docs and releases automatically.

### Documentation

Documentation is the html stuff generated for displaying news about the new release. This is using `versions.json` from the `RPG-Paper-Maker` repo. The command to generate according to a specific release version:

    python3 ./docs.py [version]

Example of version : `0.4.3`

Result of documentation whill be inside a `result` folder.

### Generate releases for each platform

TODO