import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:waterways/OrderManagement/custom_appbar_storedetails.dart';
import 'package:waterways/OrderManagement/order_details.dart';
import 'package:waterways/app_styles.dart';


void main() {
  runApp(const StoreRating(title: ''));
}

class StoreRating extends StatelessWidget {
  const StoreRating({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppStyles.colorScheme.background,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(75.0),
          child: StoreDetailsAppBar(
            title: 'Store Rating',
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTextSection(
                  screenHeight, screenWidth, 'Aqua Atlan', AppStyles.headline5),
              buildTextSection(screenHeight, screenWidth, 'Basak, Pardo',
                  AppStyles.bodyText2),
              buildRowWithRatingSections(screenHeight, screenWidth),
              reviewList(context, screenHeight, screenWidth)
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextSection(
      double screenHeight, double screenWidth, String text, TextStyle style) {
    return Padding(
      padding: EdgeInsets.only(
          left: 10, // Set or reduce the left padding as needed
          top: screenHeight * 0.0),
      child: Text(text, style: style),
    );
  }

  Widget buildTextSection2(
      double screenHeight, double screenWidth, String text, TextStyle style) {
    return Padding(
      padding: EdgeInsets.only(
          left: 5, // Set or reduce the left padding as needed
          top: screenHeight * 0.003),
      child: Text(text, style: style),
    );
  }

  Widget buildSectionWithStarRate(
      double screenHeight, double screenWidth, String text, TextStyle style) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildTextSection(screenHeight, screenWidth, '4.4', AppStyles.headline7),
        Padding(
          padding: const EdgeInsets.only(top: 0, left: 7, bottom: 3),
          child: rating2(),
        ),
        buildTextSection(
            screenHeight, screenWidth, '200 Ratings', AppStyles.bodyText2),
      ],
    );
  }

  Widget numberedRatings(
      double screenHeight, double screenWidth, String text, TextStyle style) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildTextSection(screenHeight, screenWidth, '5', AppStyles.bodyText2),
        const SizedBox(height: 1),
        buildTextSection(screenHeight, screenWidth, '4', AppStyles.bodyText2),
        const SizedBox(height: 1),
        buildTextSection(screenHeight, screenWidth, '3', AppStyles.bodyText2),
        const SizedBox(height: 1),
        buildTextSection(screenHeight, screenWidth, '2', AppStyles.bodyText2),
        const SizedBox(height: 1),
        buildTextSection(screenHeight, screenWidth, '1', AppStyles.bodyText2),
      ],
    );
  }

  Widget buildRowWithRatingSections(double screenHeight, double screenWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start, // Align items to the start
      children: [
        const SizedBox(width: 8),
        buildSectionWithStarRate(
            screenHeight, screenWidth, '4.4', AppStyles.headline7),
        numberedRatings(screenHeight, screenWidth, '5', AppStyles.bodyText2),
        const SizedBox(width: 8),
        rateBar(),
      ],
    );
  }

  Widget rateTimeStamp(double screenHeight, double screenWidth) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start, // Align items to the start of the column
      children: [
        buildTextSection2(
            screenHeight, screenWidth, 'Nathan Alcoseba', AppStyles.bodyText4),
        const SizedBox(height: 3),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 4),
            rating1(),
            const SizedBox(width: 0),
            buildTextSection2(
                screenHeight, screenWidth, '9/28/23', AppStyles.subText1),
          ],
        ),
      ],
    );
  }

  Widget reviewHeader(double screenHeight, double screenWidth) {
    return Row(
      children: [
        profileIcon(),
        const SizedBox(width: 0),
        rateTimeStamp(screenHeight, screenWidth),
        const SizedBox(width: 220),
        dot(),
      ],
    );
  }

  Widget feedback(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: <TextSpan>[
          TextSpan(
            text:
                'The delivery was fast and the water was in good condition, can’t wait for another transaction with this store. ',
            style: AppStyles.bodyText5,
          ),
          TextSpan(
            text: 'view more',
            style: AppStyles.subText2,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const OrderDetails(
                            title: '',
                          )),
                );
              },
          ),
        ],
      ),
    );
  }

  Widget review(BuildContext context, double screenHeight, double screenWidth) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0), // Adjust the left padding as needed
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          reviewHeader(screenHeight, screenWidth),
          const SizedBox(height: 8), // Adjust the height for vertical spacing
          feedback(context),
        ],
      ),
    );
  }

  Widget reviewList(
      BuildContext context, double screenHeight, double screenWidth) {
    return SizedBox(
      height: screenHeight * 0.65,
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            review(context, screenHeight, screenWidth),
            const SizedBox(height: 16),
            review(context, screenHeight, screenWidth),
            const SizedBox(height: 16),
            review(context, screenHeight, screenWidth),
            const SizedBox(height: 16),
            review(context, screenHeight, screenWidth),
            const SizedBox(height: 16),
            review(context, screenHeight, screenWidth),
            const SizedBox(height: 16),
            review(context, screenHeight, screenWidth),
            const SizedBox(height: 16),
            review(context, screenHeight, screenWidth),
            const SizedBox(height: 16),
            review(context, screenHeight, screenWidth),
            const SizedBox(height: 16),
            review(context, screenHeight, screenWidth),
            const SizedBox(height: 16),
            review(context, screenHeight, screenWidth),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget rateBar() => Image.asset('assets/Order/rateBar.png');
  Widget stockIcon() => Image.asset('assets/Order/stockIcon.png');
  Widget profileIcon() => Image.asset('assets/Order/profileIcon2.png');
  Widget rating1() => Image.asset('assets/Order/yellowStars.png');
  Widget rating2() => Image.asset('assets/Order/starRate.png');
  Widget dot() => Image.asset('assets/Order/dotVertical.png');
}
