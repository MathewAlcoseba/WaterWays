import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waterways/OrderManagement/custom_appbar2.dart';

import 'package:waterways/app_styles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderStatus extends StatelessWidget {
  const OrderStatus({Key? key, required this.title}) : super(key: key);
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
          child: AppBarToHome(
            title: 'Order Details',
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildProfileRow(screenHeight, screenWidth),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> cancelOrder() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      await firestore.collection('Orders').doc('MYa2aAfhtjfuKed3U3nd').update({
        'Status': false,
      });
    } catch (e) {
      print('Error canceling order: $e');
    }
  }

  Widget buildProfileRow(double screenWidth, double screenHeight) {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection('Orders')
          .doc('MYa2aAfhtjfuKed3U3nd')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        }
        if (!snapshot.hasData || snapshot.data?.data() == null) {
          return CircularProgressIndicator();
        }
        Map<String, dynamic> orderData =
            snapshot.data?.data() as Map<String, dynamic>;
        String deliveryMethod =
            orderData['deliveryMethod'] ?? 'No delivery method available';
        String selectedOptions = orderData['selectedOptions'] ?? 'No selection';
        String totalPayment =
            (orderData['totalPayment'] as int? ?? 0).toString();
        String productSubtotal =
            (orderData['productSubtotal'] as int? ?? 0).toString();
        String deliverySubtotal =
            (orderData['deliverySubtotal'] as int? ?? 0).toString();
        String paymentOption =
            orderData['paymentOption'] ?? 'No delivery payemnt available';
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            itemCard(screenWidth, screenHeight, deliveryMethod, selectedOptions,
                totalPayment, deliverySubtotal, productSubtotal),
            CustomImageRow(),
            SizedBox(
              height: 15,
            ),
            _buildViewLocation(screenHeight, screenWidth),
            SizedBox(
              height: 15,
            ),
            line(screenWidth),
            _buildPaymentOptions(screenHeight, screenWidth),
            buildTextSection3(
                screenHeight, screenWidth, paymentOption, AppStyles.bodyText6),
            _buildAddress(screenHeight, screenWidth),
            buildTextSection3(screenHeight, screenWidth,
                'Basak, Pardo, 123 Street', AppStyles.bodyText6),
            _buildOrderSummary(screenHeight, screenWidth),
            textRow6(
                screenHeight, screenWidth, deliverySubtotal, productSubtotal),
            buildTextSection3(screenHeight, screenWidth,
                'Transaction Code: MYUI7821A-G2-90A', AppStyles.bodyText2),
            _buildViewChat(screenHeight, screenWidth),
            _buildOrderTotal(screenHeight, screenWidth),
            _buildTotalPayment(screenHeight, screenWidth, totalPayment),
          ],
        );
      },
    );
  }

  Widget buildTextSection(
      double screenHeight, double screenWidth, String text, TextStyle style) {
    return Padding(
      padding: EdgeInsets.only(left: 10, top: screenHeight * 0.0),
      child: Text(text, style: style),
    );
  }

  Widget buildTextSection2(
      double screenHeight, double screenWidth, String text, TextStyle style) {
    return Padding(
      padding: EdgeInsets.only(left: 15, top: screenHeight * 0.02),
      child: Text(text, style: style),
    );
  }

  Widget buildTextSection3(
      double screenHeight, double screenWidth, String text, TextStyle style) {
    return Padding(
      padding: EdgeInsets.only(left: 10, top: screenHeight * 0.009),
      child: Text(text, style: style),
    );
  }

  Widget buildTextSection4(
      double screenHeight, double screenWidth, String text, TextStyle style) {
    return Padding(
      padding: EdgeInsets.only(left: 10, top: screenHeight * 0.001),
      child: Text(text, style: style),
    );
  }

  Widget buildTextSection5(
      double screenHeight, double screenWidth, String text, TextStyle style) {
    return Padding(
      padding: EdgeInsets.only(left: 105, top: 25),
      child: Text(text, style: style),
    );
  }

  Widget buildTextSection6(
      double screenHeight, double screenWidth, String text, TextStyle style) {
    return Padding(
      padding: EdgeInsets.only(left: 10),
      child: Text(text, style: style),
    );
  }

  Widget itemCard(
      double screenHeight,
      double screenWidth,
      String deliveryMethod,
      String selectedOptions,
      totalPayment,
      deliverySubtotal,
      productSubtotal) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 10.0, bottom: 10.0),
      child: Stack(
        children: [
          Container(
              height: 180,
              width: 390,
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(17.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5.0,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: cardFullDetails(
                  screenHeight,
                  screenWidth,
                  deliveryMethod,
                  selectedOptions,
                  totalPayment,
                  deliverySubtotal,
                  productSubtotal)),
          buildTextSection2(
              screenHeight, screenWidth, 'Aqua Atlan', AppStyles.headline2),
        ],
      ),
    );
  }

  Widget cardDetails(
      double screenHeight,
      double screenWidth,
      String deliveryMethod,
      String selectedOptions,
      totalPayment,
      deliverySubtotal,
      productSubtotal) {
    return Padding(
      padding: const EdgeInsets.only(top: 45.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTextSection(
              screenHeight, screenWidth, selectedOptions, AppStyles.bodyText2),
          SizedBox(
            height: 8,
          ),
          buildTextSection(
              screenHeight, screenWidth, deliveryMethod, AppStyles.bodyText2),
          SizedBox(
            height: 8,
          ),
          buildTextSection(
              screenHeight, screenWidth, totalPayment, AppStyles.bodyText2),
        ],
      ),
    );
  }

  Widget cardFullDetails(
      double screenHeight,
      double screenWidth,
      String deliveryMethod,
      String selectedOptions,
      totalPayment,
      deliverySubtotal,
      productSubtotal) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, left: 10.0),
      child: Row(
        children: [
          card(),
          SizedBox(
            width: 8,
          ),
          cardDetails(screenHeight, screenWidth, deliveryMethod,
              selectedOptions, totalPayment, deliverySubtotal, productSubtotal),
        ],
      ),
    );
  }

  Widget _buildOrderTotal(double screenHeight, double screenWidth) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          clipboard(),
          buildTextSection3(
              screenHeight, screenWidth, 'Order Total', AppStyles.bodyText6),
        ],
      ),
    );
  }

  Widget _buildOrderSummary(double screenHeight, double screenWidth) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          summary(),
          buildTextSection3(
              screenHeight, screenWidth, 'Order Summary', AppStyles.bodyText6),
        ],
      ),
    );
  }

  Widget _buildViewLocation(double screenHeight, double screenWidth) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          location(),
          buildTextSection3(
            screenHeight,
            screenWidth,
            'View real-time Location',
            AppStyles.bodyText6,
          ),
          SizedBox(width: 33),
          ElevatedButton(
            onPressed: () async {
              try {
                await cancelOrder();
              } catch (e) {
                print('Error canceling order: $e');
              }
            },
            style: ElevatedButton.styleFrom(
              primary: Color(0xFF007AFF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              'Cancel',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildViewChat(double screenHeight, double screenWidth) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          message(),
          buildTextSection3(
              screenHeight, screenWidth, 'View Chat', AppStyles.bodyText6),
        ],
      ),
    );
  }

  Widget _buildAddress(double screenHeight, double screenWidth) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          marker(),
          buildTextSection3(
              screenHeight, screenWidth, 'Address', AppStyles.bodyText6),
          SizedBox(width: 45.00)
        ],
      ),
    );
  }

  Widget textCol1(double screenHeight, double screenWidth) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTextSection3(screenHeight, screenWidth, 'Product Subtotal',
              AppStyles.bodyText6),
          SizedBox(height: 5.00),
          buildTextSection3(screenHeight, screenWidth, 'Delivery Subtotal',
              AppStyles.bodyText6),
        ],
      ),
    );
  }

  Widget textCol2(double screenHeight, double screenWidth,
      String deliverySubtotal, String productSubtotal) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTextSection3(screenHeight, screenWidth, 'P $productSubtotal',
              AppStyles.bodyText6),
          SizedBox(height: 5.00),
          buildTextSection3(screenHeight, screenWidth, 'P $deliverySubtotal',
              AppStyles.bodyText6),
        ],
      ),
    );
  }

  Widget textRow6(double screenHeight, double screenWidth,
      String deliverySubtotal, String productSubtotal) {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textCol1(screenHeight, screenWidth),
          SizedBox(width: 130.00),
          textCol2(screenHeight, screenWidth, deliverySubtotal, productSubtotal)
        ],
      ),
    );
  }

  Widget _buildTotalPayment(
      double screenHeight, double screenWidth, String totalPayment) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTextSection3(
              screenHeight, screenWidth, 'Total Payment', AppStyles.headline2),
          SizedBox(width: 110.00),
          buildTextSection3(screenHeight, screenWidth, 'P $totalPayment',
              AppStyles.headline2),
        ],
      ),
    );
  }

  Widget line(double screenWidth) {
    return Padding(
      padding: const EdgeInsets.only(left: 9.0),
      child: Container(
        height: 1,
        width: 390,
        decoration: BoxDecoration(color: Color(0xFF007AFF)),
      ),
    );
  }

  Widget line2(double screenWidth) {
    return Container(
      height: 2,
      width: 290,
      decoration: BoxDecoration(color: Color(0xFF007AFF)),
    );
  }

  Widget _buildPaymentOptions(double screenHeight, double screenWidth) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          wallet(),
          buildTextSection3(screenHeight, screenWidth, 'Payment Options',
              AppStyles.bodyText6),
        ],
      ),
    );
  }

  Widget CustomImageRow() {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        line2(290),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                imageContainer('assets/Order/Circle1.png'),
                imageContainer('assets/Order/Circle 2W.png'),
                imageContainer('assets/Order/Circle 3W.png'),
                imageContainer('assets/Order/CircleW4.png'),
                imageContainer('assets/Order/CircleW5.png'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                textWithMaxWidth('Process', AppStyles.subText1, 70),
                textWithMaxWidth(
                    'On the way to station', AppStyles.subText1, 70),
                textWithMaxWidth(
                    'On the way to customer', AppStyles.subText1, 70),
                textWithMaxWidth('Delivered', AppStyles.subText1, 70),
                textWithMaxWidth('Rate', AppStyles.subText1, 70),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget textWithMaxWidth(String text, TextStyle style, double width) {
    return Container(
      width: width,
      alignment: Alignment.center, // Center align the text
      child: Text(
        text,
        textAlign: TextAlign.center, // Center text alignment
        style: style,
        softWrap: true, // Enable text wrapping
        overflow: TextOverflow.visible, // To ensure text flows to a new line
      ),
    );
  }

  Widget imageContainer(String imagePath) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget left() => Image.asset('assets/Main/left.png');
  Widget card() {
    return Padding(
      padding: EdgeInsets.only(top: 40.0),
      child: Image.asset('assets/Order/AquaAtlanSmall.png'),
    );
  }

  Widget down() {
    return Padding(
      padding: EdgeInsets.only(left: 0.0, top: 10.00),
      child: Image.asset('assets/Order/downIcon.png'),
    );
  }

  Widget delivery() {
    return Padding(
      padding: EdgeInsets.only(left: 0.0, top: 6.00),
      child: Image.asset('assets/Order/delivery.png'),
    );
  }

  Widget wallet() {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Image.asset('assets/Order/wallet.png'),
    );
  }

  Widget clipboard() {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Image.asset('assets/Order/clipboard.png'),
    );
  }

  Widget summary() {
    return Padding(
      padding: EdgeInsets.only(
        top: 7.0,
      ),
      child: Image.asset('assets/Order/summary.png'),
    );
  }

  Widget message() {
    return Padding(
      padding: EdgeInsets.only(
        top: 11.0,
      ),
      child: Image.asset('assets/Order/messageIcon2.png'),
    );
  }

  Widget marker() {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Image.asset('assets/Order/locationMarker.png'),
    );
  }

  Widget location() {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Image.asset('assets/Order/track.png'),
    );
  }
}
