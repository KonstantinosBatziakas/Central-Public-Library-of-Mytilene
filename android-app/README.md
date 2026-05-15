# Android APK (WebView Wrapper)

This folder contains a lightweight native Android wrapper around the hosted web app.

## Build locally

1. Install Android SDK + Java 17.
2. From `android-app/` run:
   - `gradle :app:assembleDebug`
3. APK output:
   - `android-app/app/build/outputs/apk/debug/app-debug.apk`

## CI distribution (no signing secrets)

The GitHub workflow `.github/workflows/android-apk-release.yml` builds a debug APK and publishes it as:

The workflow publishes a stable asset name:

- `central-library-android.apk`

This enables a permanent latest URL:

- `https://github.com/KonstantinosBatziakas/Central-Public-Library-of-Mytilene/releases/latest/download/central-library-android.apk`
