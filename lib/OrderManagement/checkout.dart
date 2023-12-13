import 'package:flutter/material.dart';
import 'package:waterways/OrderManagement/custom_appbar_storedetails.dart';
import 'package:waterways/OrderManagement/successful_purchase.dart';
import 'package:waterways/app_styles.dart';

void main() {
  runApp(const Checkout(
    title: '',
  ));
}

class Checkout extends StatefulWidget {
  const Checkout({super.key, required this.title});
  final String title;

  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  String? selectedPaymentMethod;
  List<String> paymentMethods = [
    'Credit Card',
    'Dedit Card',
    'Gcash',
    'PayPal',
    'Cash on Delivery'
  ];

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
            title: 'Checkout',
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              itemCard(screenWidth, screenHeight),
              itemCard2(screenHeight, screenWidth),
              textRow3(screenHeight, screenWidth),
              _buildAddress(screenHeight, screenWidth),
              _buildPaymentOptions(screenHeight, screenWidth),
              paymentOptionsDropdown(),
              textRow6(screenHeight, screenWidth),
              textRow7(screenHeight, screenWidth),
              footer(screenHeight, screenWidth)
            ],
          ),
        ),
      ),
    );
  }

  Widget paymentOptionsDropdown() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 10),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 250, maxHeight: 50),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: const Color(0xFFB8BBC2)),
          ),
          child: DropdownButton<String>(
            hint: const Text('Select a payment method'),
            value: selectedPaymentMethod,
            onChanged: (String? newValue) {
              setState(() {
                selectedPaymentMethod = newValue;
              });
            },
            items: paymentMethods.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            isExpanded: true,
            underline: const SizedBox(),
            dropdownColor: Colors.white,
          ),
        ),
      ),
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
      padding: EdgeInsets.only(
          left: 15, // Set or reduce the left padding as needed
          top: screenHeight * 0.03),
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
      padding: const EdgeInsets.only(left: 105, top: 25),
      child: Text(text, style: style),
    );
  }

  Widget buildTextSection6(
      double screenHeight, double screenWidth, String text, TextStyle style) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Text(text, style: style),
    );
  }

  Widget itemCard(double screenHeight, double screenWidth) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 10.0, bottom: 10.0),
      child: Stack(
        children: [
          Container(
              height: 180,
              width: 390,
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(17.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5.0,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: cardFullDetails(screenHeight, screenWidth)),
          buildTextSection2(
              screenHeight, screenWidth, 'Aqua Atlan', AppStyles.headline2),
        ],
      ),
    );
  }

  Widget cardDetails(double screenHeight, double screenWidth) {
    return Padding(
      padding: const EdgeInsets.only(top: 45.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTextSection(screenHeight, screenWidth, 'Barrel (200 Liters) x3',
              AppStyles.bodyText2),
          const SizedBox(
            height: 8,
          ),
          buildTextSection(
              screenHeight, screenWidth, 'Delivery', AppStyles.bodyText2),
          const SizedBox(
            height: 8,
          ),
          buildTextSection(
              screenHeight, screenWidth, 'P12.00', AppStyles.bodyText2),
        ],
      ),
    );
  }

  Widget cardFullDetails(double screenHeight, double screenWidth) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, left: 10.0),
      child: Row(
        children: [
          card(),
          // SizedBox(
          //   width: 8,
          // ),
          cardDetails(screenHeight, screenWidth),
          edit()
        ],
      ),
    );
  }

  Widget itemCard2(double screenHeight, double screenWidth) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Stack(
        children: [blueBorder(), textRow2(screenHeight, screenWidth)],
      ),
    );
  }

  Widget footer(double screenHeight, double screenWidth) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Stack(
        children: [paymentFooter(), textCol3(screenHeight, screenWidth)],
      ),
    );
  }

  Widget _buildStandardLocal(double screenHeight, double screenWidth) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 10.0),
      child: Row(
        children: [
          delivery(),
          buildTextSection3(
              screenHeight, screenWidth, 'Standard Local', AppStyles.subText4),
          const SizedBox(width: 15.00),
          down(),
          const SizedBox(width: 130.00),
          buildTextSection3(
              screenHeight, screenWidth, 'P320.00', AppStyles.bodyText2),
        ],
      ),
    );
  }

  Widget textRow2(double screenHeight, double screenWidth) {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0, left: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTextSection3(screenHeight, screenWidth, 'Delivery Options',
              AppStyles.subText3),
          const SizedBox(height: 10.00),
          line(screenWidth),
          _buildStandardLocal(screenHeight, screenWidth),
          buildTextSection3(screenHeight, screenWidth,
              'Receive within 48 minutes', AppStyles.subText5),
        ],
      ),
    );
  }

  Widget textRow3(double screenHeight, double screenWidth) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          clipboard(),
          buildTextSection3(screenHeight, screenWidth,
              'Order Total ( 3 Items )', AppStyles.bodyText6),
          const SizedBox(width: 45.00),
          buildTextSection4(
              screenHeight, screenWidth, 'P7520.00', AppStyles.headline2),
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
          const SizedBox(height: 5.00),
          buildTextSection3(screenHeight, screenWidth, 'Delivery Subtotal',
              AppStyles.bodyText6),
        ],
      ),
    );
  }

  Widget textCol2(double screenHeight, double screenWidth) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTextSection3(
              screenHeight, screenWidth, '720', AppStyles.bodyText6),
          const SizedBox(height: 5.00),
          buildTextSection3(
              screenHeight, screenWidth, '320', AppStyles.bodyText6),
        ],
      ),
    );
  }

  Widget textCol3(double screenHeight, double screenWidth) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTextSection5(
              screenHeight, screenWidth, 'Total Payment', AppStyles.bodyText5),
          textRow8(screenHeight, screenWidth, context)
        ],
      ),
    );
  }

  Widget textRow6(double screenHeight, double screenWidth) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textCol1(screenHeight, screenWidth),
          const SizedBox(width: 185.00),
          textCol2(screenHeight, screenWidth)
        ],
      ),
    );
  }

  Widget textRow7(double screenHeight, double screenWidth) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTextSection3(
              screenHeight, screenWidth, 'Total Payment', AppStyles.headline2),
          const SizedBox(width: 90.00),
          buildTextSection3(
              screenHeight, screenWidth, 'P7520.00', AppStyles.headline2),
        ],
      ),
    );
  }

  Widget textRow8(
      double screenHeight, double screenWidth, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 1.0, left: 95.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTextSection6(
              screenHeight, screenWidth, 'P7520.00', AppStyles.headline2),
          const SizedBox(width: 20.00),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SuccessfulPurchase(title: '')),
              );
            },
            child: buildTextSection6(
                screenHeight, screenWidth, 'Place Order', AppStyles.headline8),
          ),
        ],
      ),
    );
  }

  Widget line(double screenWidth) {
    return Container(
      height: 1,
      width: 390,
      decoration: const BoxDecoration(color: Color(0xFF007AFF)),
    );
  }

  Widget _buildEditAddress(double screenHeight, double screenWidth) {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              buildTextSection3(
                screenHeight,
                screenWidth,
                'Edit Address',
                AppStyles.bodyText6,
              ),
              const SizedBox(
                width: 8,
              ),
              pencil()
            ],
          ),
          buildTextSection4(
            screenHeight,
            screenWidth,
            'Basak, Pardo, 123 Street',
            AppStyles.bodyText2,
          ),
        ],
      ),
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

  Widget _buildAddress(double screenHeight, double screenWidth) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          marker(),
          const SizedBox(width: 5.00),
          _buildEditAddress(screenHeight, screenWidth)
        ],
      ),
    );
  }

  Widget left() => Image.asset('assets/Main/left.png');
  Widget card() {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Image.asset('assets/Order/AquaAtlanSmall.png'),
    );
  }

  Widget edit() {
    return Padding(
      padding: const EdgeInsets.only(left: 0.0, top: 145.00),
      child: Image.asset('assets/Order/edit.png'),
    );
  }

  Widget down() {
    return Padding(
      padding: const EdgeInsets.only(left: 0.0, top: 10.00),
      child: Image.asset('assets/Order/downIcon.png'),
    );
  }

  Widget delivery() {
    return Padding(
      padding: const EdgeInsets.only(left: 0.0, top: 6.00),
      child: Image.asset('assets/Order/delivery.png'),
    );
  }

  Widget header() => Image.asset('assets/Order/header.png');

  Widget wallet() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Image.asset('assets/Order/wallet.png'),
    );
  }

  Widget clipboard() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Image.asset('assets/Order/clipboard.png'),
    );
  }

  Widget pencil() {
    return Padding(
      padding: const EdgeInsets.only(top: 6.0),
      child: Image.asset('assets/Order/pencil.png'),
    );
  }

  Widget marker() {
    return Padding(
      padding: const EdgeInsets.only(top: 23.0),
      child: Image.asset('assets/Order/locationMarker.png'),
    );
  }

  Widget home() => Image.asset('assets/Main/home.png');
  Widget notifications() => Image.asset('assets/Main/heart.png');
  Widget search() => Image.asset('assets/Main/search.png');
  Widget profile() => Image.asset('assets/Main/profile.png');
  Widget blueBorder() => Image.asset('assets/Order/blueBorder.png');

  Widget paymentFooter() {
    return Padding(
      padding: const EdgeInsets.only(left: 0.0, top: 40.00),
      child: Image.asset('assets/Order/paymentFooter.png'),
    );
  }
}
