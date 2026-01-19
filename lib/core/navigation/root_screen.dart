import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 16,
        items: _buildBottomNavBarItems,
        currentIndex: navigationShell.currentIndex,
        onTap: (index) => navigationShell.goBranch(index),
      ),
    );
  }
}

List<BottomNavigationBarItem> _buildBottomNavBarItems = const [
  BottomNavigationBarItem(
    icon: Icon(Icons.landslide_rounded),
    label: 'Арендодатели',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.landslide_rounded),
    label: 'Арендаторы',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.landslide_rounded),
    label: 'Недвижимость',
  ),
];
