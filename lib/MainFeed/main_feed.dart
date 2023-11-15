import 'package:flutter/material.dart';
import 'package:waterways/MainFeed/search_bar.dart';
import 'package:waterways/MainFeed/stores_list_view.dart';
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
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomSearchBar(),
            SizedBox(height: 16.0),
            AvailableStoresListView(),
            // Text(
            //   '$selectedIndex',
            //   style: const TextStyle(
            //       color: Colors.black,
            //       fontSize: 120.0,
            //       fontWeight: FontWeight.bold),
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: AppStyles.colorScheme.secondary,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
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
    ));
  }
}

class Rating extends StatelessWidget {
  final int starCount;

  const Rating({
    Key? key,
    required this.starCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> ratingIcon = List.generate(5, (index) {
      return Icon(
        index < starCount ? Icons.star : Icons.star_outline,
        color: const Color(0xffFEC600),
        size: 20.0,
      );
    });

    return SizedBox(child: Row(children: ratingIcon));
  }
}
