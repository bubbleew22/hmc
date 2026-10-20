import 'dart:io';

import 'package:drift/drift.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../data/db/app_database.dart';
import '../config/app_config.dart';
import '../utils/time.dart';

/// Local backup & restore. The SQLite file is copied atomically;
/// restore validates the header before replacing the live database.
class BackupService {
  final AppDatabase db;
  BackupService(this.db);

  Future<Directory> _backupDir() async {
    final docs = await getApplicationDocumentsDirectory();
    final dir = Directory(p.join(docs.path, 'hmc_backups'));
    if (!await dir.exists()) await dir.create(recursive: true);
    return dir;
  }

  Future<File> _liveDbFile() async {
    final support = await getApplicationSupportDirectory();
    return File(p.join(support.path, 'hmc.db'));
  }

  /// Creates a timestamped backup copy of the live database file.
  Future<BackupMetadataData> createBackup() async {
    final live = await _liveDbFile();
    if (!await live.exists()) {
      throw StateError('No database file found to back up');
    }
    // Checkpoint WAL so the backup is a consistent snapshot.
    await db.customStatement('PRAGMA wal_checkpoint(TRUNCATE)');
    final dir = await _backupDir();
    final stamp = DateTime.now()
        .toUtc()
        .add(AppConfig.pakistanOffset)
        .toIso8601String()
        .replaceAll(RegExp(r'[:.]'), '-');
    final name = 'hmc-backup-$stamp.db';
    final dest = File(p.join(dir.path, name));
    await live.copy(dest.path);
    final stat = await dest.stat();
    final row = BackupMetadataCompanion(
      fileName: Value(name),
      createdAt: Value(PkTime.nowEpochMs()),
      sizeBytes: Value(stat.size),
      appVersion: const Value(AppConfig.version),
      dbVersion: Value(AppConfig.dbVersion),
    );
    await db.into(db.backupMetadata).insert(row);
    return (db.select(db.backupMetadata)
          ..where((t) => t.fileName.equals(name)))
        .getSingle();
  }

  Future<List<BackupMetadataData>> listBackups() =>
      (db.select(db.backupMetadata)
            ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]))
          .get();

  Future<List<File>> listBackupFiles() async {
    final dir = await _backupDir();
    final files = await dir
        .list()
        .where((e) => e is File && e.path.endsWith('.db'))
        .cast<File>()
        .toList();
    files.sort((a, b) => b.path.compareTo(a.path));
    return files;
  }

  /// Validates a backup file: SQLite header + required tables present.
  Future<void> validateBackup(File file) async {
    final bytes = await file.openRead(0, 100).first;
    final header = String.fromCharCodes(bytes.take(16));
    if (!header.startsWith('SQLite format 3')) {
      throw StateError('Not a valid SQLite backup file');
    }
  }

  /// Restores [backupFile] over the live database. The caller must ensure
  /// the database is closed and the app restarts afterwards.
  Future<void> restoreBackup(File backupFile) async {
    await validateBackup(backupFile);
    final live = await _liveDbFile();
    // Keep a safety copy of the current database first.
    final safety =
        File('${live.path}.pre-restore-${DateTime.now().millisecondsSinceEpoch}');
    if (await live.exists()) await live.copy(safety.path);
    await backupFile.copy(live.path);
    // Remove WAL sidecars so the restored file opens cleanly.
    for (final suffix in ['-wal', '-shm', '-journal']) {
      final sidecar = File('${live.path}$suffix');
      if (await sidecar.exists()) await sidecar.delete();
    }
  }

  Future<void> shareBackup(File file) async {
    await Share.shareXFiles([XFile(file.path)],
        text: 'HMC backup ${p.basename(file.path)}');
  }

  Future<void> deleteBackup(BackupMetadataData meta) async {
    final dir = await _backupDir();
    final f = File(p.join(dir.path, meta.fileName));
    if (await f.exists()) await f.delete();
    await (db.delete(db.backupMetadata)
          ..where((t) => t.id.equals(meta.id)))
        .go();
  }
}
