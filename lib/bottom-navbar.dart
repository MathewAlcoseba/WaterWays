import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

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
      Image.asset('assets/NavBar-Icons/home.png', width: 40),
      Image.asset('assets/NavBar-Icons/heart.png', width: 40),
      Image.asset('assets/NavBar-Icons/search.png', width: 40),
      Image.asset('assets/NavBar-Icons/profile.png', width: 40),
    ];

    return CurvedNavigationBar(
      height: 60,
      backgroundColor: Colors.transparent,
      index: selectedIndex,
      items: navBarIcons,
      onTap: onItemTapped,
    );
  }
}
