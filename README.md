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
