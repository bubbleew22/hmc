import 'package:flutter/material.dart';

import '../../core/config/app_config.dart';
import '../../core/theme/app_theme.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Center(
            child: Column(
              children: [
                Image.asset('assets/logo/hmc_logo_1024.png',
                    width: 110,
                    height: 110,
                    errorBuilder: (_, __, ___) => const Icon(
                        Icons.storefront,
                        size: 72,
                        color: HmcColors.navy800)),
                const SizedBox(height: 16),
                const Text('HASAN MOBILE CENTER',
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w800)),
                const Text('SHEWA ADDA',
                    style: TextStyle(
                        letterSpacing: 5,
                        color: HmcColors.gold600,
                        fontWeight: FontWeight.w600)),
                const SizedBox(height: 8),
                const Text('Smart Mobile Business Management',
                    style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _kv('Version', AppConfig.version),
                  _kv('Package', AppConfig.packageName),
                  _kv('Currency', '${AppConfig.defaultCurrency} (Rs)'),
                  _kv('Mode', 'Fully offline'),
                  _kv('Cloud sync', 'Disabled'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'HMC is an offline-first shop management system: inventory, sales, customer ledgers, dispatch & consignment, expenses and reports — all stored securely on this device.',
            style: TextStyle(color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _kv(String k, String v) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(k, style: const TextStyle(color: Colors.grey)),
            Text(v, style: const TextStyle(fontWeight: FontWeight.w600)),
          ],
        ),
      );
}
