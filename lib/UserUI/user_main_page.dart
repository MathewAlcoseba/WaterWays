import 'package:flutter/material.dart';
import 'package:waterways/UserUI/user_favorites_page.dart';
import 'package:waterways/UserUI/user_home_page.dart';
import 'package:waterways/UserUI/user_notifications_page.dart';
import 'package:waterways/UserUI/user_profile_drawer.dart';
import 'package:waterways/app_styles.dart';
import 'package:waterways/bottom_navbar.dart';

class UserMainPage extends StatefulWidget {
  const UserMainPage({super.key});

  @override
  UserMainPageState createState() => UserMainPageState();
}

class UserMainPageState extends State<UserMainPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final PageController userMainPageController = PageController();
  final TextEditingController textController = TextEditingController();
  int selectedIndex = 0;

  void onItemTapped(int index) {
    if (index == 3) {
      scaffoldKey.currentState?.openEndDrawer();
    } else {
      userMainPageController.jumpToPage(index);
      setState(() {
        selectedIndex = index;
      });
    }
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  void showChatList() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
              title: Text(
            'Chats',
            style: AppStyles.headline3,
          )),
          body: Placeholder(
            color: Colors.black,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "WaterWays Delivery App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorScheme: AppStyles.colorScheme),
      home: SafeArea(
        child: Scaffold(
          key: scaffoldKey,
          extendBody: true,
          backgroundColor: AppStyles.colorScheme.background,
          endDrawer: const UserProfileDrawer(),
          body: PageView(
            controller: userMainPageController,
            physics: const BouncingScrollPhysics(
                decelerationRate: ScrollDecelerationRate.normal),
            onPageChanged: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            children: const <Widget>[
              UserHomePage(),
              UserFavoritesPage(),
              UserNotificationsPage(),
            ],
          ),
          bottomNavigationBar: Theme(
              data: ThemeData(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              child: BottomNavBar(
                selectedIndex: selectedIndex,
                onItemTapped: onItemTapped,
              )),
        ),
      ),
    );
  }
}
