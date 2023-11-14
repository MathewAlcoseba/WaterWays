import 'package:flutter/material.dart';
import 'package:waterways/MainFeed/search_bar.dart';
import 'package:waterways/app_styles.dart';
import 'package:waterways/bottom_navbar.dart';
import 'package:waterways/custom_appbar.dart';

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
          backgroundColor: AppStyles.colorScheme.background,
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(75.0),
            child: CustomAppBar(),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const CustomSearchBar(),
                  Text(
                    '$selectedIndex',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 120.0,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomNavBar(
            selectedIndex: selectedIndex,
            onItemTapped: onItemTapped,
          )),
    );
  }
}
