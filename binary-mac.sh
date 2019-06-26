#!/bin/sh
pathQt="/Users/macuser/Qt"
versionQt="5.10.0"
pathRepos="/Users/macuser/Desktop/RPM"
releaseName="build-Engine-Desktop_Qt_5_10_0_clang_64bit3-Release"
pathRelease="${pathRepos}/RPG-Paper-Maker/Build/Release/EditorApp"

# Build
cd $pathRelease
"${pathQt}/${versionQt}/clang_64/bin/qmake" "${pathRepos}/RPG-Paper-Maker/EditorApp/EditorApp.pro" -spec macx-clang CONFIG+=x86_64
"/usr/bin/make" qmake_all
"/usr/bin/make"

# Copy to dependencies and push changes
rm -rf "${pathRepos}/Dependencies/Engine/osx/RPG-Paper-Maker.app"
cp -rf RPG-Paper-Maker.app "${pathRepos}/Dependencies/Engine/osx/RPG-Paper-Maker.app"
cd "${pathRepos}/Dependencies/Engine/osx"
"${pathQt}/${versionQt}/clang_64/bin/macdeployqt" RPG-Paper-Maker.app
cd ../..
git add Engine/osx/RPG-Paper-Maker.app
git commit -m "Updating macosx binary exe"
git pull --rebase origin develop
git push origin develop
