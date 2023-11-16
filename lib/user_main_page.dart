import 'package:flutter/material.dart';
import 'package:waterways/UserUI/user_favorites_page.dart';
import 'package:waterways/UserUI/user_home_page.dart';
import 'package:waterways/UserUI/user_notifications_page.dart';
import 'package:waterways/app_styles.dart';
import 'package:waterways/bottom_navbar.dart';
import 'package:waterways/custom_appbar.dart';

void main() {
  runApp(const UserMainPage());
}

class UserMainPage extends StatefulWidget {
  const UserMainPage({super.key});

  @override
  UserMainPageState createState() => UserMainPageState();
}

class UserMainPageState extends State<UserMainPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final PageController userMainPageController = PageController();
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
  Widget build(BuildContext context) {
    return SafeArea(
        child: MaterialApp(
      title: "WaterWays Delivery App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorScheme: AppStyles.colorScheme),
      home: Scaffold(
        key: scaffoldKey,
        extendBody: true,
        backgroundColor: AppStyles.colorScheme.background,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(75.0),
          child: CustomAppBar(),
        ),
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
            UserNotificationsPage()
          ],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {},
            backgroundColor: AppStyles.colorScheme.secondary,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(10),
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50))),
            child: Image.asset('assets/Main/chat-message.png')),
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
    ));
  }
}

class UserProfileDrawer extends StatelessWidget {
  const UserProfileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Drawer Header',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profile'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
