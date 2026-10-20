import 'package:flutter/material.dart';

/// True while the app is still booting. Set to false by the splash screen
/// once boot finishes; after that, normal error handling resumes.
bool hmcStartupPhase = true;

/// Last-resort UI: shown when the app hits an uncaught error during startup.
/// Uses no providers, no assets and no plugins — just plain Material widgets —
/// so it can render even when everything else is broken. The user can
/// screenshot the error detail and send it for diagnosis.
class StartupErrorApp extends StatelessWidget {
  final Object error;
  final StackTrace? stack;

  const StartupErrorApp({super.key, required this.error, this.stack});

  @override
  Widget build(BuildContext context) {
    final msg = error.toString();
    final st = stack?.toString() ?? '';
    final detail = st.isEmpty ? msg : '$msg\n\n$st';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hasan Mobile Center'),
          backgroundColor: const Color(0xFF10254A),
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'App start nahi ho saki.',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Neeche error ki detail hai — is ka screenshot bhej dein taake fix ho sake:',
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: SingleChildScrollView(
                    child: SelectableText(
                      detail,
                      style: const TextStyle(
                          fontSize: 12, fontFamily: 'monospace'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
