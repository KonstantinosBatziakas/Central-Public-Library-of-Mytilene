# Android APK (WebView Wrapper)

This folder contains a lightweight native Android wrapper around the hosted web app.

## Build locally

1. Install Android SDK + Java 17.
2. From `android-app/` run:
   - `gradle :app:assembleRelease`
3. APK output:
   - `android-app/app/build/outputs/apk/release/app-release.apk`

## Signing in CI

The GitHub workflow `.github/workflows/android-apk-release.yml` signs the release APK when these secrets exist:

- `ANDROID_KEYSTORE_BASE64`
- `ANDROID_KEY_ALIAS`
- `ANDROID_KEYSTORE_PASSWORD`
- `ANDROID_KEY_PASSWORD`

The workflow publishes a stable asset name:

- `central-library-android.apk`

This enables a permanent latest URL:

- `https://github.com/KonstantinosBatziakas/Central-Public-Library-of-Mytilene/releases/latest/download/central-library-android.apk`
