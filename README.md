# Central-Public-Library-of-Mytilene

## iOS App (SwiftUI) Source

This repository includes a native iOS app source scaffold in:

`ios-app/CentralLibraryApp`

### What is included

- SwiftUI information architecture with tabs:
  - Home
  - Library Info
  - Collections
  - Events
  - Visit/Contact
  - 3D Experience
- Greek/English runtime language switching with persistence (`UserDefaults`)
- Bundled offline content model in:
  - `ios-app/CentralLibraryApp/Resources/library_content.json`
- Embedded local 3D model experience using `WKWebView`
- Instant language syncing between app UI and embedded 3D experience
- Liquid-glass inspired visual style with material backgrounds and futuristic accents

## Mobile Access Strategy

### iPhone (PWA)

The website is installable on iPhone via Safari Add to Home Screen.

PWA files:

- `manifest.webmanifest`
- `service-worker.js`
- `assets/icons/icon-192.png`
- `assets/icons/icon-512.png`
- `assets/icons/apple-touch-icon.png`

Install steps:

1. Open the hosted website in Safari.
2. Tap Share.
3. Tap Add to Home Screen.

### Android (APK)

A native Android WebView wrapper is available in:

- `android-app/`

The release workflow builds a debug APK (no signing secrets), then uploads it with a fixed filename:

- `central-library-android.apk`

Stable latest-download URL:

- `https://github.com/KonstantinosBatziakas/Central-Public-Library-of-Mytilene/releases/latest/download/central-library-android.apk`

## QR Distribution Assets

QR images are stored in:

- `assets/qr/iphone-pwa-qr.png`
- `assets/qr/android-apk-qr.png`
- `assets/qr/mobile-download-qr.png`

The unified QR points to:

- `https://konstantinosbatziakas.github.io/Central-Public-Library-of-Mytilene/download/`

On Android, this page auto-redirects to the latest APK download URL.

## Android APK Flow

Workflow file:

- `.github/workflows/android-apk-release.yml`

Triggers:

- Release published
- Manual workflow dispatch

No repository signing secrets are required for this class distribution flow.

## End-to-End Validation Checklist

- iPhone Safari: Add to Home Screen works and launches standalone mode.
- iPhone PWA icon appears correctly from Apple touch icon.
- Android APK installs from latest-release fixed URL.
- All three QR codes open the expected target URLs.
- Unified QR download page redirects Android devices to APK URL.
- Website still loads and service worker registers without errors.
