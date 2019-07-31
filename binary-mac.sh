#!/bin/sh
pathQt="/Users/macuser/Qt"
versionQt="5.10.0"
pathRepos="/Users/macuser/Desktop/RPM"
releaseName="build-RPG-Paper-Maker-Desktop_Qt_5_10_0_clang_64bit3-Release"
pathRelease="${pathRepos}/RPG-Paper-Maker/Build/Release/EditorApp"

# Build
#rm -rf "${pathRepos}/${releaseName}"
#rm -rf "${pathRepos}/RPG-Paper-Maker/Build"
cd "${pathRepos}/RPG-Paper-Maker"
"${pathQt}/${versionQt}/clang_64/bin/qmake" "${pathRepos}/RPG-Paper-Maker/RPG-Paper-Maker.pro" -spec macx-clang CONFIG+=x86_64
"/usr/bin/make" qmake_all
"/usr/bin/make"

# Copy to dependencies and push changes
cd $pathRelease
rm -rf "${pathRepos}/Dependencies/Engine/osx/RPG-Paper-Maker.app"
cp -rf RPG-Paper-Maker.app "${pathRepos}/Dependencies/Engine/osx/RPG-Paper-Maker.app"
cd "${pathRepos}/Dependencies/Engine/osx"
"${pathQt}/${versionQt}/clang_64/bin/macdeployqt" RPG-Paper-Maker.app
cd ../..
git add Engine/osx/RPG-Paper-Maker.app
git commit -m "Updating macosx binary exe"
git pull --rebase origin develop
git push origin develop
