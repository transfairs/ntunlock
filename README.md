# NTUnlock App

[![Try it online](https://img.shields.io/badge/Try%20it%20online-NTUnlock-blue?logo=flutter&style=for-the-badge)](https://transfairs.github.io/ntunlock/)
[![Download](https://img.shields.io/badge/Download-Releases-green?style=for-the-badge&logo=github)](https://github.com/transfairs/ntunlock/releases)


NTUnlock is an app designed to unlock and put your NordicTrack training device into privileged mode. Ideal for experienced service technicians, this app provides access to advanced settings and configurations that are not available in the regular user interface.

Currently, the app is in **closed testing**, and we are actively looking for testers who can help us improve the app. If you are interested in testing, please join the testing group using the link below.

## Features

- Unlock your NordicTrack training device and put it into privileged mode.
- Access system settings to install third-party applications, customize software, and personalize your device.
- Designed for experienced service technicians.

## 🌍 Web Version

The latest version of this project is automatically deployed at:
👉 [https://transfairs.github.io/ntunlock/](https://transfairs.github.io/ntunlock/)

## Screenshots
<img src="/assets/screenshots/StoreFront Dark.png" width="200" alt="Dark Mode" align="left" />
<img src="/assets/screenshots/StoreFront Light.png" width="200" alt="Bright Mode" align="left" />
<img src="/assets/screenshots/Timer 10.png" width="400" alt="Timer" align="left" />
<img src="/assets/screenshots/Manual.png" width="400" alt="Manual" />

## Installation

### Android
1. Go to the [Google Play Store](https://play.google.com/store/apps/details?id=de.transfairs.nt_unlock).
2. Download and install the app.
3. Follow the manual to unlock your NordicTrack training device and access privileged mode.

### Linux/Windows
1. Go to [Releases](https://github.com/transfairs/ntunlock/releases).
2. Download the version compatible to your operating system.
3. Extract und run the app.

## Build
For developers. Tested with Ubuntu.
### Install Dependencies
```sh
sudo apt install clang curl git libglu1-mesa libgtk-3-dev unzip xz-utils zip
export PATH="$PATH:$HOME/flutter/bin"
wget https://dl.google.com/android/repository/commandlinetools-linux-13114758_latest.zip
snap install android-studio --release
mkdir -p $HOME/Android/Sdk/cmdline-tools/latest
unzip commandlinetools-linux-*.zip -d $HOME/Android/Sdk/cmdline-tools/latest
$HOME/Android/Sdk/cmdline-tools/latest/bin/sdkmanager --install "cmdline-tools;latest"
flutter doctor --android-licenses
```
### Clone and prepare
```sh
git clone https://github.com/transfairs/ntunlock.git
cd ntunlock
flutter pub-get
flutter gen-l10n
```

### Run
Requires an Android Device to be configured. Can be done with Android Studio.
```sh
flutter run --release
```
### Run in Browser
Requires a Chromium-based browser. (Does not need to be Google Chrome.)
```sh
flutter run -d chrome 
```
### Create APK
For testing on any Android device
```sh
flutter build apk --release
```
For example using ADB:
```sh
adb devices
adb install build/app/outputs/flutter-apk/app-release.apk
```
### Troubleshooting
Flutter: Will also guide you on how to setup.
```sh
flutter doctor
```


## Disclaimer

By using this app, you agree to take full responsibility for any potential damage or consequences that may arise from using the privileged mode. The developer is not responsible for any damage to the device or loss of warranty.

This app is only intended for devices you own and for use by qualified service technicians. Unauthorized use on other devices may result in malfunction or void the warranty.


## Contributing

We welcome contributions to improve the app. If you find any issues or have suggestions, feel free to create a pull request, open an issue or open a discussion in the [Google Group](https://groups.google.com/u/1/g/ntunlock).

## License

This project is Open Source and licensed under the GNU v3.0 License.
