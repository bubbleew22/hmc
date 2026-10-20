import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/providers.dart';
import '../../core/utils/time.dart';
import '../../widgets/common.dart';

class BackupScreen extends ConsumerStatefulWidget {
  const BackupScreen({super.key});

  @override
  ConsumerState<BackupScreen> createState() => _BackupScreenState();
}

class _BackupScreenState extends ConsumerState<BackupScreen> {
  bool _busy = false;

  Future<void> _create() async {
    setState(() => _busy = true);
    try {
      final meta =
          await ref.read(backupServiceProvider).createBackup();
      if (mounted) {
        showOkSnack(context, 'Backup created: ${meta.fileName}');
        setState(() {});
      }
    } catch (e) {
      if (mounted) showErrorSnack(context, e);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _restore() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['db'],
    );
    if (result == null || result.files.single.path == null) return;
    final file = File(result.files.single.path!);
    final ok = await confirmDialog(context,
        title: 'Restore backup?',
        message:
            'Current data will be replaced by this backup. A safety copy of the current database is kept first. The app will need to restart.',
        confirmLabel: 'Restore',
        danger: true);
    if (!ok || !mounted) return;
    setState(() => _busy = true);
    try {
      await ref.read(backupServiceProvider).restoreBackup(file);
      if (mounted) {
        showOkSnack(
            context, 'Backup restored. Please restart the app.');
      }
    } catch (e) {
      if (mounted) showErrorSnack(context, e);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final svc = ref.watch(backupServiceProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Backup & restore')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Your data lives only on this device. Create regular backups and keep a copy somewhere safe — uninstalling the app deletes local data.',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 12),
                  FilledButton.icon(
                    onPressed: _busy ? null : _create,
                    icon: const Icon(Icons.backup_outlined),
                    label: const Text('Create backup now'),
                  ),
                  const SizedBox(height: 8),
                  OutlinedButton.icon(
                    onPressed: _busy ? null : _restore,
                    icon:
                        const Icon(Icons.restore_outlined),
                    label: const Text('Restore from file'),
                  ),
                ],
              ),
            ),
          ),
          const SectionHeader(title: 'Saved backups'),
          FutureBuilder(
            future: svc.listBackupFiles(),
            builder: (ctx, snap) {
              if (!snap.hasData) return const LoadingView();
              final files = snap.data!;
              if (files.isEmpty) {
                return const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('No backups yet.',
                      style: TextStyle(color: Colors.grey)),
                );
              }
              return Column(
                children: [
                  for (final f in files)
                    Card(
                      child: ListTile(
                        leading: const Icon(
                            Icons.storage_outlined),
                        title: Text(
                            f.path.split('/').last,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600)),
                        subtitle: FutureBuilder(
                          future: f.stat(),
                          builder: (ctx2, st) => Text(st.hasData
                              ? '${(st.data!.size / 1024).toStringAsFixed(1)} KB · ${PkTime.formatDateTime(st.data!.modified.millisecondsSinceEpoch)}'
                              : ''),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(
                                  Icons.share_outlined),
                              tooltip: 'Share / export',
                              onPressed: () =>
                                  svc.shareBackup(f),
                            ),
                            IconButton(
                              icon: const Icon(
                                  Icons.delete_outline,
                                  color: Colors.red),
                              tooltip: 'Delete',
                              onPressed: () async {
                                final ok =
                                    await confirmDialog(
                                        context,
                                        title: 'Delete backup?',
                                        message:
                                            'This backup file will be deleted.',
                                        confirmLabel: 'Delete',
                                        danger: true);
                                if (ok) {
                                  await f.delete();
                                  if (mounted) setState(() {});
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
