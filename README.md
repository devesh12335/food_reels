## Food Reels & Nearby Spots
A simple Flutter app to browse short food reels and discover nearby food spots. This project was developed as an assignment with the following features:

Home Screen: A vertical feed of short food reels with titles, locations, and a "Crave & Order" button.

Location Feature: Detects the user's location and filters food spots within a 10 km radius.

Video Playback: Auto-playing video reels using the video_player package.

UI/UX: Clean design with a bottom navigation bar for "Reels" and "Nearby" views.

Bonus Features: Basic map view displaying nearby vendors.

## Please Find Demo Video at rootFolder/demo/demo.mp4(Download raw file to view it)

# Tech Stack
Framework: Flutter

Language: Dart

State Management: provider

Video Playback: video_player

Location: geolocator

Maps: flutter_map

Image Loading: cached_network_image

Vector Tiles: flutter_map_vector_tile_plugin

# Setup & Installation
1. Prerequisites
Make sure you have Flutter installed and set up.

2. Flutter doctor OutPut(Set will Help setup required config)

Flutter (Channel stable, 3.32.0, on Garuda Linux 6.16.1-zen1-1-zen, locale en_IN) [73ms]
• Flutter version 3.32.0 on channel stable at /home/devesh/.cache/flutter_sdk
• Upstream repository https://github.com/flutter/flutter.git
• Framework revision be698c48a6 (4 months ago), 2025-05-19 12:59:14 -0700
• Engine revision 1e9a811bf8
• Dart version 3.9.0
• DevTools version 2.48.0
• Feature flags: enable-web, enable-linux-desktop, enable-macos-desktop, enable-windows-desktop, enable-android, enable-ios, cli-animations, enable-lldb-debugging

[✓] Android toolchain - develop for Android devices (Android SDK version 35.0.1) [33.4s]
• Android SDK at /opt/android-sdk
• Emulator version 36.1.9.0 (build_id 13823996) (CL:N/A)
• Platform android-36, build-tools 35.0.1
• ANDROID_HOME = /opt/android-sdk
• ANDROID_SDK_ROOT = /dev/nvme0n1p2/softwares/jdk-17.0.12/
• Java binary at: /usr/lib/jvm/java-17-openjdk/bin/java
This JDK is specified in your Flutter configuration.
To change the current JDK, run: `flutter config --jdk-dir="path/to/jdk"`.
• Java version OpenJDK Runtime Environment (build 17.0.16+8)
• All Android licenses accepted.

[✗] Chrome - develop for the web (Cannot find Chrome executable at google-chrome) [25ms]
! Cannot find Chrome. Try setting CHROME_EXECUTABLE to a Chrome executable.

[✓] Linux toolchain - develop for Linux desktop [715ms]
• clang version 20.1.8
• cmake version 4.0.3-dirty
• ninja version 1.12.1
• pkg-config version 2.5.1
• OpenGL core renderer: AMD Radeon Graphics (radeonsi, renoir, ACO, DRM 3.64, 6.16.1-zen1-1-zen)
• OpenGL core version: 4.6 (Core Profile) Mesa 25.1.7-arch1.1
• OpenGL core shading language version: 4.60
• OpenGL ES renderer: AMD Radeon Graphics (radeonsi, renoir, ACO, DRM 3.64, 6.16.1-zen1-1-zen)
• OpenGL ES version: OpenGL ES 3.2 Mesa 25.1.7-arch1.1
• OpenGL ES shading language version: OpenGL ES GLSL ES 3.20
• GL_EXT_framebuffer_blit: yes
• GL_EXT_texture_format_BGRA8888: yes

[✓] Android Studio (version 2025.1.2) [15ms]
• Android Studio at /opt/android-studio
• Flutter plugin can be installed from:
🔨 https://plugins.jetbrains.com/plugin/9212-flutter
• Dart plugin can be installed from:
🔨 https://plugins.jetbrains.com/plugin/6351-dart
• Java version OpenJDK Runtime Environment (build 21.0.6+-13391695-b895.109)

[✓] Connected device (2 available) [207ms]
• I2018 (mobile)  • 1386974664000JR • android-arm64 • Android 13 (API 33)
• Linux (desktop) • linux           • linux-x64     • Garuda Linux 6.16.1-zen1-1-zen

[✓] Network resources [5.6s]
• All expected network resources are available.


Then, run flutter pub get to download the packages.

## 3. Get Your Maptiler API Key
The map view uses Maptiler tiles. You need a free API key to use them.

Go to the Maptiler Cloud website and create a free account.(https://cloud.maptiler.com)

On the "Keys" page, find your default API key.(https://cloud.maptiler.com/account/keys/)

Copy this key and paste it into the lib/screens/nearby_screen.dart file on line 205, replacing MAP-API-KEY-HERE.

4. Run the App
Connect a physical device or start an emulator and run the app:

flutter run

This will launch the application on your device, and you can start exploring the food reels and nearby spots.