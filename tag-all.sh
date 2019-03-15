#!/bin/sh
tagName="$1"

cd ../RPG-Paper-Maker
git tag ${tagName}
git push origin ${tagName}
cd ../Game-Scripts
git tag ${tagName}
git push origin ${tagName}
cd ../Basic-Ressources
git tag ${tagName}
git push origin ${tagName}
cd ../Dependencies
git tag ${tagName}
git push origin ${tagName}