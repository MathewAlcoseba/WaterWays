import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: Colors.white, // Set the background color to white
      items: [
        BottomNavigationBarItem(
          icon: Image.asset('assets/Main/home.png', width: 40),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/Main/heart.png', width: 40),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/Main/search.png', width: 40),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/Main/profile.png', width: 40),
          label: '',
        ),
      ],
    );
  }
}
