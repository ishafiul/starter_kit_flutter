SHELL := /bin/bash

### Build Runner
buildRunner:
	fvm flutter pub run build_runner watch --delete-conflicting-outputs

### Change app icon
changeAppIcon:
	fvm flutter pub run flutter_launcher_icons

### Create Splash
createSplash:
	fvm flutter pub run flutter_native_splash:create --path=flutter_native_splash.yaml

### Change app package name
changePackageName:
	fvm flutter pub run change_app_package_name:main com.yourpackage.name

### Build apk
apkBuild:
	fvm flutter build apk --split-per-abi

### build aab app bundle
releaseBuild:
	fvm flutter build appbundle

newProjectSetup:
	flutter pub upgrade --major-versions
