# Hasan Mobile Center — Shewa Adda (HMC)

Offline-first mobile shop management system for a mobile phone shop in Pakistan.
Inventory, sales, customer accounting (udhaar), dispatch/consignment, expenses,
reports, PDF invoices, backup/restore — all stored in a local SQLite database.
No internet, no Firebase, no account needed.

- **Package:** `com.hasanmobilecenter.shewaadda`
- **Currency:** PKR (Rs), integer minor units (paisa) — no floating-point money math
- **Platforms:** Android (APK), Windows (desktop), iOS (Xcode project)

## Quick start

### Prerequisites
- Flutter SDK (stable) — https://docs.flutter.dev/get-started/install
- For Android: Android SDK + JDK 17+
- For Windows: Visual Studio with "Desktop development with C++"
- For iOS: macOS with Xcode

### 1. Get dependencies
```bash
flutter pub get
```

### 2. Generate database code (Drift)
```bash
dart run build_runner build --delete-conflicting-outputs
```

### 3. Analyze + test
```bash
flutter analyze
flutter test
```

### 4. Run
```bash
flutter run
```

## Builds

Android release APK:
```bash
flutter build apk --release
# output: build/app/outputs/flutter-apk/app-release.apk
```

Android app bundle (Play Store):
```bash
flutter build appbundle --release
```

Windows release:
```bash
flutter build windows --release
# output: build/windows/x64/runner/Release/
```

iOS (on macOS):
```bash
flutter build ios --release
```
For distributable IPA, open `ios/Runner.xcworkspace` in Xcode and use
Product → Archive with your Apple signing team.

## First launch

1. Setup wizard: shop name, location, contact, admin name + PIN, theme, invoice format.
2. Default brands (Apple, Samsung, …) and expense categories are seeded automatically.
3. Login with your admin name + PIN. Data never leaves the device.

## Architecture

```
lib/
  main.dart                 entry point (offline, no network)
  app.dart                  MaterialApp.router
  core/
    config/                 app_config, cloud_config (sync disabled)
    sync/                   SyncService interface + NoopSyncService
    theme/                  light/dark/system, navy+gold brand
    utils/                  money (int minor units), ids, time (PKT), validators
    services/               business logic (transactions, accounting)
    pdf/                    invoice + ledger PDF builders
    share/                  WhatsApp wa.me reminders
    providers.dart          Riverpod providers
    router/                 GoRouter, all 32 screens
  data/db/                  Drift tables + AppDatabase (SQLite)
  features/                 one folder per module (32 screens)
  widgets/                  shared UI + pickers
test/
  accounting_test.dart      acceptance scenarios A & B + allocation + money
docs/
  future_firebase.md        how to enable cloud sync later (disabled now)
```

Key rules enforced in code:
- Every stock/payment mutation runs in a database transaction and writes an
  audit/movement record.
- A sale is idempotent: the same idempotency key never creates two invoices
  (rotation / double-tap safe).
- Dispatch is never counted as a sale until the recipient's sale is confirmed.
- Installment payments never count as new sales revenue.
- Duplicate IMEIs are rejected; sold units can't be sold twice.
- Customer/supplier balances are computed from ledger entries, never stored.

## WhatsApp reminders

Credit Recovery and Customer Detail screens have a WhatsApp button that opens
the customer's WhatsApp chat with a prefilled, editable reminder message
(`https://wa.me/<phone>?text=...`). The template (with `{name}`, `{amount}`,
`{shop}` placeholders) is editable in Settings. No API key needed.

## Backup & restore

Settings → Backup & restore: creates timestamped copies of the SQLite file,
share/export them, and restore with header validation. A safety copy of the
current database is kept before every restore.

## Tests

`flutter test` runs the accounting acceptance tests (spec scenarios A & B),
payment allocation, money formatting, and validation tests. All financial math
is pure Dart and covered without needing a device.
