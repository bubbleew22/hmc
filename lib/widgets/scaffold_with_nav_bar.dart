import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

/// Scaffold with bottom navigation for the five main tabs.
/// Uses [StatefulNavigationShell] so each tab keeps its own navigation stack.
/// Back button behavior:
/// - If not on Home tab → goes to Home tab (never closes app).
/// - If on Home tab → double-press within 2 seconds to exit.
class ScaffoldWithNavBar extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const ScaffoldWithNavBar({super.key, required this.navigationShell});

  @override
  State<ScaffoldWithNavBar> createState() => _ScaffoldWithNavBarState();
}

class _ScaffoldWithNavBarState extends State<ScaffoldWithNavBar> {
  DateTime? _lastBackPress;

  void _onTap(int index) {
    widget.navigationShell.goBranch(
      index,
      // If already on this tab, pop to its first route (standard behaviour).
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  /// Intercepts the system back button.
  /// Returns true if the pop should proceed (exit app), false to handle it.
  bool _onBackPressed(BuildContext context) {
    final shell = widget.navigationShell;
    final currentLocation =
        GoRouterState.of(context).uri.toString();
    // If we're not on a tab root (deeper in the stack), let it pop normally.
    if (currentLocation != _branchRoot(shell.currentIndex)) {
      // Use GoRouter's pop for in-tab navigation.
      if (context.canPop()) {
        context.pop();
        return false;
      }
    }
    // On a tab root: if not on Home, go to Home instead of exiting.
    if (shell.currentIndex != 0) {
      shell.goBranch(0);
      return false;
    }
    // On Home root: require double-press within 2 seconds to exit.
    final now = DateTime.now();
    if (_lastBackPress == null ||
        now.difference(_lastBackPress!) > const Duration(seconds: 2)) {
      _lastBackPress = now;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Press back again to exit'),
          duration: Duration(seconds: 2),
        ),
      );
      return false;
    }
    return true; // Second press → exit.
  }

  /// Returns the root path for a tab index.
  String _branchRoot(int index) => switch (index) {
        0 => '/home',
        1 => '/stock',
        2 => '/sales',
        3 => '/customers',
        4 => '/settings',
        _ => '/home',
      };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) return;
        if (_onBackPressed(context)) {
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
        body: widget.navigationShell,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: widget.navigationShell.currentIndex,
          onTap: _onTap,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: theme.colorScheme.primary,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.inventory_2_outlined),
              activeIcon: Icon(Icons.inventory_2),
              label: 'Stock',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart_outlined),
              activeIcon: Icon(Icons.bar_chart),
              label: 'Sales',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people_outlined),
              activeIcon: Icon(Icons.people),
              label: 'Customers',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              activeIcon: Icon(Icons.menu),
              label: 'More',
            ),
          ],
        ),
      ),
    );
  }
}
