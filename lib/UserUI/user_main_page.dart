import 'package:flutter/material.dart';
import 'package:waterways/UserUI/user_favorites_page.dart';
import 'package:waterways/UserUI/user_home_page.dart';
import 'package:waterways/UserUI/user_notifications_page.dart';
import 'package:waterways/UserUI/user_profile_page.dart';
import 'package:waterways/UserUI/user_profile_drawer.dart';
import 'package:waterways/app_styles.dart';
import 'package:waterways/bottom_navbar.dart';
import 'package:waterways/models/users.dart';

class UserMainPage extends StatefulWidget {
  final Customer customer;

  const UserMainPage({super.key, required this.customer});

  @override
  UserMainPageState createState() => UserMainPageState();
}

class UserMainPageState extends State<UserMainPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final PageController userMainPageController = PageController();
  final TextEditingController textController = TextEditingController();
  int selectedIndex = 0;

  void onEditProfileTap() {
    Navigator.pop(context);
    onItemTapped(3);
  }

  void onItemTapped(int index) {
    userMainPageController.jumpToPage(index);
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Customer customer = widget.customer;

    return MaterialApp(
      title: "WaterWays Delivery App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorScheme: AppStyles.colorScheme),
      home: SafeArea(
        child: Scaffold(
          key: scaffoldKey,
          extendBody: true,
          backgroundColor: AppStyles.colorScheme.background,
          endDrawer: UserProfileDrawer(
            onEditProfileTap: onEditProfileTap,
            customer: customer,
          ),
          body: PageView(
            controller: userMainPageController,
            physics: const BouncingScrollPhysics(
                decelerationRate: ScrollDecelerationRate.normal),
            onPageChanged: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            children: <Widget>[
              UserHomePage(customer: customer),
              UserFavoritesPage(customer: customer),
              UserNotificationsPage(customer: customer),
              UserProfilePage(customer: customer)
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
