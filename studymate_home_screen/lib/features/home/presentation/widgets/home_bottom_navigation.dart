import 'package:flutter/material.dart';

class HomeBottomNavigation extends StatelessWidget {
  const HomeBottomNavigation({
    required this.selectedIndex,
    required this.onDestinationSelected,
    super.key,
  });

  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
      backgroundColor: Colors.white,
      indicatorColor: const Color(0xFFE9ECFF),
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home_rounded),
          label: 'الرئيسية',
        ),
        NavigationDestination(
          icon: Icon(Icons.checklist_outlined),
          label: 'المهام',
        ),
        NavigationDestination(
          icon: Icon(Icons.calendar_month_outlined),
          label: 'التقويم',
        ),
        NavigationDestination(
          icon: Icon(Icons.folder_open_outlined),
          label: 'ملفاتي',
        ),
      ],
    );
  }
}
