import 'package:flutter/material.dart';
import 'package:waterways/app_styles.dart';

class BottomNavBarStore extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavBarStore({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    final navBarIcons = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Center(
          child: selectedIndex == 0
              ? Image.asset('assets/NavBar-Icons/home-selected.png', width: 24)
              : Image.asset('assets/NavBar-Icons/home-unselected.png',
                  width: 24),
        ),
        label: '',
      ),
      BottomNavigationBarItem(
        icon: Center(
          child: selectedIndex == 1
              ? Image.asset('assets/NavBar-Icons/requests-selected.png',
                  width: 24)
              : Image.asset('assets/NavBar-Icons/requests-unselected.png',
                  width: 24),
        ),
        label: '',
      ),
      BottomNavigationBarItem(
        icon: Center(
          child: selectedIndex == 2
              ? Image.asset('assets/NavBar-Icons/notification-selected.png',
                  width: 24)
              : Image.asset('assets/NavBar-Icons/notification-unselected.png',
                  width: 24),
        ),
        label: '',
      ),
      BottomNavigationBarItem(
        icon: Center(
          child: selectedIndex == 3
              ? Image.asset('assets/NavBar-Icons/profile-selected.png',
                  width: 24)
              : Image.asset('assets/NavBar-Icons/profile-unselected.png',
                  width: 24),
        ),
        label: '',
      ),
    ];

    return SizedBox(
      height: 75,
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 1.5,
        backgroundColor: AppStyles.colorScheme.primary,
        items: navBarIcons,
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}

//Curved Navigation Bar Config
      // height: 60,
      // backgroundColor: Colors.transparent,
      // buttonBackgroundColor: AppStyles.colorScheme.primary,
      // index: selectedIndex,
      // items: navBarIcons,
      // animationCurve: Curves.easeInOut,
      // animationDuration: const Duration(milliseconds: 500),
      // onTap: onItemTapped,