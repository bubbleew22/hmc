import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Shared bottom navigation for the five main sections, matching the mockup:
/// Home, Stock, Sales, Customers, More. Royal-blue selected item,
/// grey unselected items. Taps navigate with [GoRouter.go].
class HmcBottomNav extends StatelessWidget {
  /// Index of the currently visible section: 0 Home, 1 Stock, 2 Sales,
  /// 3 Customers, 4 More.
  final int currentIndex;

  const HmcBottomNav({super.key, required this.currentIndex});

  static const _routes = [
    '/home',
    '/stock',
    '/sales',
    '/customers',
    '/settings',
  ];

  void _onTap(BuildContext context, int index) {
    if (index == currentIndex) return;
    context.go(_routes[index]);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (i) => _onTap(context, i),
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
    );
  }
}
