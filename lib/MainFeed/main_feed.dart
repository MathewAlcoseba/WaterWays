import 'package:flutter/material.dart';
import 'package:waterways/bottom-navbar.dart';

class MainFeed extends StatefulWidget {
  const MainFeed({super.key});

  @override
  MainFeedState createState() => MainFeedState();
}

class MainFeedState extends State<MainFeed> {
  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          extendBody: true,
          backgroundColor: const Color(0xff4EA3FF),
          appBar: AppBar(
            title: const Text('Bottom Navigation Bar'),
            elevation: 0,
            centerTitle: true,
          ),
          body: Center(
            child: Text(
              '$selectedIndex',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 120.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          bottomNavigationBar: BottomNavBar(
            selectedIndex: selectedIndex,
            onItemTapped: onItemTapped,
          )),
    );
  }
}
