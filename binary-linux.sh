#!/bin/sh
pathQt="/home/wano/Qt"
versionQt="5.8"
pathRepos="/home/wano/Documents/RPG-Paper-Maker"
releaseName="build-Engine-Desktop_Qt_5_8_0_GCC_64bit-Release"
pathRelease="${pathRepos}/${releaseName}"

# Build
if [ ! -d $pathRelease ]; then
	mkdir $pathRelease
fi
cd $pathRelease
"${pathQt}/${versionQt}/gcc_64/bin/qmake" "${pathRepos}/RPG-Paper-Maker/Engine.pro" -spec linux-g++
"/usr/bin/make" qmake_all
"/usr/bin/make"

# Copy to dependencies and push changes
cp RPG-Paper-Maker "${pathRepos}/Dependencies/Engine/linux/RPG-Paper-Maker"
cd ../Dependencies
git pull --rebase origin develop
git add Engine/linux/RPG-Paper-Maker
git commit -m "Updating linux binary exe"
git push origin develop