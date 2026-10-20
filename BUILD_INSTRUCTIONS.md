# Hasan Mobile Center (HMC) — Build Instructions

**App:** Hasan Mobile Center — Shewa Adda
**Package:** `com.hasanmobilecenter.shewaadda`
**Version:** 1.0.0 (build 1)

## Status

- ✅ Complete Flutter source code (all 32 screens, offline-first SQLite via Drift)
- ✅ `flutter analyze` — 0 errors
- ✅ `flutter test` — 10/10 unit tests pass (accounting scenarios A & B)
- ⚠️ **Android APK not built in this environment** — Gradle's build daemon cannot
  start in this sandbox (loopback TCP is intercepted). The code is complete and
  verified; the APK must be built on a machine where Gradle works (any normal
  PC/Mac with Flutter installed).

## Prerequisites (on your build machine)

1. **Flutter SDK** 3.47.7 stable (or newer 3.x): https://docs.flutter.dev/get-started/install
2. **Android SDK** with:
   - Android SDK Platform 34 or 36
   - Android SDK Build-Tools 34.0.0+
   - Android SDK Command-line Tools
3. **Java 17+** (Java 21 recommended)

## Option A: Build via GitHub Actions (no PC needed!)

If you don't have a computer, you can build the APK using GitHub's free
cloud builders — entirely from your phone:

1. Create a free account at https://github.com (on your phone browser).
2. Create a new repository (e.g. `hmc-app`).
3. Upload this project's files to the repository:
   - On phone: use the GitHub mobile app, or github.com → your repo → "Add file" → "Upload files".
   - Upload the contents of the `HMC-Source-v1.0.0.zip` (extract it first).
4. The included workflow (`.github/workflows/build-apk.yml`) starts automatically.
5. After ~10 minutes: go to the repo → **Actions** tab → click the run →
   download **HMC-release-apk** from the Artifacts section.
6. Install the downloaded `app-release.apk` on your phone.

## Option B: Build on your own computer

```bash
cd hmc   # this project folder

# 1. Get dependencies
flutter pub get

# 2. Generate Drift database code (already generated, but re-run if you edit tables)
dart run build_runner build --delete-conflicting-outputs

# 3. Verify
flutter analyze
flutter test

# 4. Build release APK (signed with debug key by default)
flutter build apk --release

# Output:
#   build/app/outputs/flutter-apk/app-release.apk
```

The release build is configured to sign with the debug key so it installs
directly. For Play Store distribution, add your own signing config in
`android/app/build.gradle.kts`.

## Build Windows desktop

```bash
flutter build windows --release
# Output: build/windows/x64/runner/Release/
```

Requires: Windows 10/11 with Visual Studio 2022 (Desktop C++ workload).

## Build iOS

```bash
flutter build ios --release
```

Requires: macOS with Xcode. Open `ios/Runner.xcworkspace` to configure
signing with your Apple Developer account.

## First run

1. Install the APK on the phone.
2. The setup wizard appears: enter shop name (default "Hasan Mobile Center"),
   location (default "Shewa Adda"), admin name + PIN.
3. The dashboard loads. All data is stored offline in SQLite on the device.

## Notes

- **Offline-first:** no internet, Firebase, or login server required.
- **Cloud sync:** disabled by design (`cloudEnabled = false`,
  `syncEnabled = false` in `lib/core/config/cloud_config.dart`).
  See `docs/future_firebase.md` for the future integration plan.
- **WhatsApp reminders:** uses `wa.me` links with an editable message template
  (Settings → WhatsApp reminder template). No WhatsApp API key needed.
- **Database:** SQLite file `hmc.db` in the app's support directory.
  Backups are created from Settings → Backup & restore.
