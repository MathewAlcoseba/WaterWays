import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:waterways/app_styles.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    final navBarIcons = <Widget>[
      selectedIndex == 0
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/NavBar-Icons/home-selected.png',
                  width: 28),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/NavBar-Icons/home-unselected.png',
                  width: 28),
            ),
      selectedIndex == 1
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/NavBar-Icons/favorites-selected.png',
                  width: 28),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/NavBar-Icons/favorites-unselected.png',
                  width: 28),
            ),
      selectedIndex == 2
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                  'assets/NavBar-Icons/notification-selected.png',
                  width: 28),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                  'assets/NavBar-Icons/notification-unselected.png',
                  width: 28),
            ),
      selectedIndex == 3
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/NavBar-Icons/profile-selected.png',
                  width: 28),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/NavBar-Icons/profile-unselected.png',
                  width: 28),
            ),
    ];

    return CurvedNavigationBar(
      height: 60,
      backgroundColor: Colors.transparent,
      buttonBackgroundColor: AppStyles.colorScheme.primary,
      index: selectedIndex,
      items: navBarIcons,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 500),
      onTap: onItemTapped,
    );
  }
}
