import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: Colors.white,
      items: [
        BottomNavigationBarItem(
          icon: Image.asset('assets/NavBar-Icons/home.png', width: 40),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/NavBar-Icons/heart.png', width: 40),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/NavBar-Icons/search.png', width: 40),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/NavBar-Icons/profile.png', width: 40),
          label: '',
        ),
      ],
    );
  }
}
