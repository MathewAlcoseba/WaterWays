import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waterways/OrderManagement/store_rating.dart';
import 'package:waterways/StorePage/bottom_navbar_store.dart';
import 'package:waterways/StorePage/store_drawer.dart';
import 'package:waterways/StorePage/store_notifications.dart';
import 'package:waterways/StorePage/store_requests.dart';
import 'package:waterways/app_styles.dart';
import 'package:waterways/custom_appbar.dart';
import 'package:waterways/models/users.dart';

// void main() {
//   runApp(const StoreDetails(title: ''));
// }

class StoreDetails extends StatefulWidget {
  const StoreDetails({Key? key, required this.store, required this.customer})
      : super(key: key);
  final Store store;
  final Customer customer;

  @override
  _StoreDetailsState createState() => _StoreDetailsState();
}

class _StoreDetailsState extends State<StoreDetails> {
  int selectedIndex = 0;
  bool isOpen = true;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppStyles.colorScheme.background,
        appBar: selectedIndex == 0
            ? PreferredSize(
                preferredSize: Size.fromHeight(kToolbarHeight),
                child: CustomAppBar(
                  customer: widget.customer,
                ),
              )
            : null,
        body: IndexedStack(
          index: selectedIndex,
          children: <Widget>[
            buildMainContent(screenWidth, screenHeight),
            StoreRequestsPage(
              customer: widget.customer,
            ),
            StoreNotificationsPage(),
            StoreProfileDrawer(),
          ],
        ),
        bottomNavigationBar: BottomNavBarStore(
          selectedIndex: selectedIndex,
          onItemTapped: onItemTapped,
        ),
      ),
    );
  }

  Widget buildMainContent(double screenWidth, double screenHeight) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildProfileRow(screenWidth, screenHeight),
          buildTextSection(
              screenHeight, screenWidth, 'About Us:', AppStyles.bodyText4),
          buildTextSection(
              screenHeight,
              screenWidth,
              'Aqua Atlan has been a local water refilling station for more than 7 years. We are always ready to serve you!',
              AppStyles.bodyText5),
          buildRowWithTextAndButton(screenWidth, screenHeight),
          line(screenWidth),
          viewProfileRating(screenHeight, screenWidth, context),
          line(screenWidth),
          buildTextSection(screenHeight, screenWidth, 'Product Details:',
              AppStyles.headline5),
          buildStockInfo(screenWidth),
          buildDetailOne(screenWidth),
          buildDetailTwo(screenWidth),
          line(screenWidth),
          buildTextSection(screenHeight, screenWidth, 'Water Volume Reference:',
              AppStyles.headline5),
          buildDisclaimerBanner(screenWidth, screenHeight),
          buildCardList(screenWidth),
          Container(
              height: 100, color: const Color.fromARGB(255, 255, 255, 255)),
        ],
      ),
    );
  }

  Widget buildProfileRow(double screenWidth, double screenHeight) {
    return Container(
      height: screenHeight * 0.2,
      child: Stack(
        children: [
          banner(),
          Positioned(
            top: screenHeight * 0.09,
            left: screenWidth * 0.28,
            child: Text('Aqua Atlan', style: AppStyles.headline6),
          ),
          Positioned(
            top: screenHeight * 0.09,
            left: screenWidth * 0.03,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                profileIcon(),
                SizedBox(width: screenWidth * 0.02),
                rating(),
                SizedBox(width: screenWidth * 0.18),
                // Column(
                //   children: [
                //     SizedBox(height: 45),
                //     ElevatedButton.icon(
                //       onPressed: () {},
                //       icon: Icon(Icons.mail, color: Colors.white),
                //       label: Text('Message',
                //           style: GoogleFonts.poppins(color: Colors.white)),
                //       style: ElevatedButton.styleFrom(
                //         primary: Color(0XFF007AFF),
                //         shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(8),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRowWithTextAndButton(double screenHeight, double screenWidth) {
    // Moved inside method to fix scope
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Baseline(
          baseline: calculateBaseline(AppStyles.bodyText6.fontSize),
          baselineType: TextBaseline.alphabetic,
          child: buildTextSection(screenHeight, screenWidth,
              '10:00 AM - 4:30 PM', AppStyles.bodyText6),
        ),
        Baseline(
          baseline: calculateBaseline(16),
          baselineType: TextBaseline.alphabetic,
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                isOpen = !isOpen;
              });
            },
            child: Text(
              isOpen ? 'Open' : 'Closed',
              style: TextStyle(
                  color: isOpen ? Color(0XFFf8f8f8) : Color(0xff007AFF),
                  fontSize: 16),
            ),
            style: ElevatedButton.styleFrom(
                primary: isOpen ? Color(0xff007AFF) : Color(0XFFf8f8f8),
                elevation: 0),
          ),
        ),
      ],
    );
  }

  double calculateBaseline(double? fontSize) {
    return (fontSize ?? 16) * 0.75;
  }

  Widget buildTextSection(
      double screenHeight, double screenWidth, String text, TextStyle style) {
    return Padding(
      padding: EdgeInsets.only(left: 10, top: screenHeight * 0.01),
      child: Text(text, style: style),
    );
  }

  Widget buildStockInfo(double screenWidth) {
    return Padding(
      padding: EdgeInsets.only(left: screenWidth * 0.03, top: 20),
      child: Row(
        children: [
          stockIcon(),
          SizedBox(width: screenWidth * 0.02),
          Text('In Stock: 5000 Ltrs', style: AppStyles.bodyText1),
        ],
      ),
    );
  }

  Widget buildDisclaimerBanner(double screenWidth, double screenHeight) {
    return Stack(
      children: [
        Container(
          height: 69,
          width: screenWidth,
          decoration: BoxDecoration(color: Color(0xFFF2F2F2)),
        ),
        Positioned(
          left: screenWidth * 0.02,
          top: screenHeight * 0.01,
          child: Text(
            'Disclaimer:',
            style: AppStyles.bodyText4,
          ),
        ),
        Positioned(
          left: screenWidth * 0.02,
          top: screenHeight * 0.03,
          right: screenWidth * 0.02,
          child: Text(
            'The container used to deliver the water is provided solely for transportation and measurement reference.',
            style: AppStyles.bodyText5,
          ),
        ),
      ],
    );
  }

  Widget buildDetailOne(double screenWidth) {
    return Padding(
      padding: EdgeInsets.only(left: screenWidth * 0.05, top: 20),
      child: Row(
        children: [
          dot(),
          SizedBox(width: screenWidth * 0.02),
          Text('Treated Waste Water', style: AppStyles.bodyText1),
        ],
      ),
    );
  }

  Widget buildDetailTwo(double screenWidth) {
    return Padding(
      padding: EdgeInsets.only(left: screenWidth * 0.05, top: 20),
      child: Row(
        children: [
          dot(),
          SizedBox(width: screenWidth * 0.02),
          Text('Undrinkable but usable', style: AppStyles.bodyText1),
        ],
      ),
    );
  }

  Widget buildCardList(double screenWidth) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          String assetName = 'assets/Order/Card${index + 1}.png';
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.01),
            child: Image.asset(assetName),
          );
        },
      ),
    );
  }

  Widget line(double screenWidth) {
    return Container(
      height: 2,
      width: screenWidth,
      decoration: BoxDecoration(color: Color(0xFFEBEBEB)),
    );
  }

  Widget viewProfileRating(
      double screenHeight, double screenWidth, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        reviewRating(screenHeight, screenWidth),
        SizedBox(width: 150),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => StoreRating(
                        customer: widget.customer, store: widget.store)));
          },
          child: right(),
        ),
      ],
    );
  }

  Widget reviewRating(double screenHeight, double screenWidth) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTextSection(
                screenHeight, screenWidth, 'Aqua Atlan', AppStyles.headline5),
            buildTextSection(screenHeight, screenWidth, 'View profile Rating',
                AppStyles.bodyText1),
          ],
        ),
      ],
    );
  }

  Widget banner() => Image.asset('assets/Order/banner.png');
  Widget stockIcon() => Image.asset('assets/Order/stockIcon.png');
  Widget profileIcon() => Image.asset('assets/Order/profileIcon.png');
  Widget rating() => Image.asset('assets/Order/yellowStars.png');
  Widget dot() => Image.asset('assets/Order/dot.png');
  Widget right() => Image.asset('assets/Main/right.png');
}
