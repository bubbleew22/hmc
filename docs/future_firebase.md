# Future Firebase Integration (DISABLED)

Cloud sync is **disabled** in v1. This document explains how to enable it later
without rewriting the application. Do not follow these steps until cloud sync
is explicitly approved.

## Current state

- `lib/core/config/cloud_config.dart`: `cloudEnabled = false`, `syncEnabled = false`
- `lib/core/sync/sync_service.dart`: the `SyncService` interface
- `lib/core/sync/noop_sync_service.dart`: safe no-op used everywhere
- Settings → Cloud sync shows "not configured" and no sync indicators are shown

## Steps to enable

### 1. Add dependencies
```yaml
dependencies:
  firebase_core: ^3.x
  firebase_auth: ^3.x
  cloud_firestore: ^5.x
```

### 2. Configure Firebase
```bash
dart pub global activate flutterfire_cli
flutterfire configure --project=<your-project-id>
```
This generates `lib/firebase_options.dart`. Keep it out of public repos.

### 3. Implement the sync service
Create `lib/core/sync/firestore_sync_service.dart implements SyncService`:

- Authenticate with Firebase Auth (shop-level service account or per-user).
- Upload local rows with **stable UUIDs** (already the primary keys).
- Add a `version` integer + `updatedAt` to each synced table (migration).
- Uploads must be **idempotent**: use `set(merge: true)` keyed by UUID, and
  track `lastSyncedVersion` per record in `AppMetadata`.
- **Conflict resolution**: last-writer-wins on `updatedAt` for master data
  (customers, products); for stock movements and payments use append-only
  semantics — never rewrite a movement, only append compensating records.
- Stock movements: upload the full `StockMovements` log; the server derives
  state by replaying it. This keeps concurrent devices consistent.
- Customer payments: same append-only rule; allocate on read.

### 4. Wire it in
```dart
// cloud_config.dart
static const bool cloudEnabled = true;
static const bool syncEnabled = true;
static SyncService get syncService => FirestoreSyncService();
static const bool showSyncStatus = true;
```

Initialize in `main()`:
```dart
await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
```

### 5. Sync triggers
- On app start (if online), after each sale/payment (debounced), and from a
  manual "Sync now" button in Settings.
- Always keep working offline-first: local SQLite remains the source of truth;
  Firestore is a replica.

### 6. Security
- Firestore rules: per-shop `shopId` claim in custom tokens; users can only
  read/write their shop's collections.
- Never sync PIN hashes to the cloud; keep authentication local or use
  Firebase Auth separately.

## What NOT to do
- Don't make any screen depend on network state.
- Don't block login on cloud availability.
- Don't delete local data after upload.
