# Central-Public-Library-of-Mytilene

## iOS App (SwiftUI) Source

This repository now includes a native iOS app source scaffold in:

`/home/runner/work/Central-Public-Library-of-Mytilene/Central-Public-Library-of-Mytilene/ios-app/CentralLibraryApp`

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
- Embedded local 3D model experience using `WKWebView` with instant language syncing
- Liquid-glass inspired visual style using material backgrounds and soft futuristic accents

### Notes

- The app source is designed for Xcode/iOS and should be added to an iOS target in Xcode.
- The 3D model HTML is bundled locally at:
  - `ios-app/CentralLibraryApp/Resources/library-3d.html`

### Xcode setup checklist

1. Create or open an iOS App project in Xcode.
2. Add all files from:
   - `ios-app/CentralLibraryApp`
3. Ensure app source files are in the app target.
4. Ensure resources are in **Copy Bundle Resources**:
   - `ios-app/CentralLibraryApp/Resources/library_content.json`
   - `ios-app/CentralLibraryApp/Resources/library-3d.html`
5. Add the test file folder to a unit test target:
   - `ios-app/CentralLibraryAppTests`

### Manual QA checklist (Xcode simulators)

- Run on **iPhone** and **iPad** simulators.
- Verify:
  - Tab navigation across all sections.
  - Greek/English toggle updates all tabs.
  - Language persists after app relaunch.
  - 3D view loads correctly.
- Accessibility pass:
  - Dynamic Type at larger sizes.
  - VoiceOver reads key labels and cards.
  - Touch targets are comfortably tappable.
  - Contrast/readability in light and dark appearance.
- 3D performance pass on older simulator profiles:
  - If interaction is not smooth, track a Phase 2 spike for SceneKit/RealityKit migration.

## Free Mobile Access (Web + Android APK)

### iPhone users (free)

- Open the hosted website in Safari.
- Tap **Share**.
- Tap **Add to Home Screen**.

This gives app-like access without App Store publishing.

### Android users (APK)

- Publish Android APK files under:
  - `https://github.com/KonstantinosBatziakas/Central-Public-Library-of-Mytilene/releases`
- Users can download the latest APK directly from the Releases page.

### PWA files included

- `manifest.webmanifest`
- `service-worker.js`
