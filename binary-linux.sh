#!/bin/sh
pathQt="/home/wano/Qt"
versionQt="5.8"
pathRepos="/home/wano/Documents/RPG-Paper-Maker"
releaseName="build-RPG-Paper-Maker-Desktop_Qt_5_8_0_GCC_64bit-Release"
pathRelease="${pathRepos}/RPG-Paper-Maker/Build/release/EditorApp/"

# Build
#rm -rf "${pathRepos}/${releaseName}"
#rm -rf "${pathRepos}/RPG-Paper-Maker/Build"
cd "${pathRepos}/RPG-Paper-Maker"
./update-mods
"${pathQt}/${versionQt}/gcc_64/bin/qmake" "${pathRepos}/RPG-Paper-Maker/RPG-Paper-Maker.pro" -spec linux-g++
"/usr/bin/make" qmake_all
"/usr/bin/make"
cd $pathRelease

# Copy to dependencies and push changes
cp RPG-Paper-Maker "${pathRepos}/Dependencies/Engine/linux/RPG-Paper-Maker"
cd "${pathRepos}/Dependencies"
git add Engine/linux/RPG-Paper-Maker
git commit -m "Updating linux binary exe"
git pull --rebase origin develop
git push origin develop