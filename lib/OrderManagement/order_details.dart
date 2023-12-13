import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waterways/OrderManagement/checkout.dart';
import 'package:waterways/OrderManagement/custom_appbar_storedetails.dart';
import 'package:waterways/OrderManagement/store_rating.dart';
import 'package:waterways/app_styles.dart';

void main() {
  runApp(const OrderDetails(title: ''));
}

class OrderDetails extends StatefulWidget {
  const OrderDetails({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  int selectedIndex = 0;
  bool checkboxValue1 = false;
  bool checkboxValue2 = false;
  bool checkboxValue3 = false;
  bool checkboxValue4 = false;
  int counter = 0;
  int radioValue = 0;

  void showCupertinoPopup(BuildContext context) {
    // Default prices for each option
    final double pricePerGallon = 25.0;
    final double pricePerBarrel = 300.0;
    final double pricePerICBTank = 1000.0;
    final double pricePerOthers = 30.0;
    final double radioOption1Price = 25.0;
    final double radioOption2Price = 0.0;

    // Function to calculate total price
    double calculateTotalPrice() {
      double totalPrice = 0.0;
      if (checkboxValue1) totalPrice += pricePerGallon;
      if (checkboxValue2) totalPrice += pricePerBarrel;
      if (checkboxValue3) totalPrice += pricePerICBTank;
      if (checkboxValue4) totalPrice += pricePerOthers;
      if (radioValue == 1) totalPrice += radioOption1Price;
      if (radioValue == 2) totalPrice += radioOption2Price;

      return totalPrice * counter; // Multiply by quantity
    }

    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoPopupSurface(
          child: Material(
            child: Container(
              padding: EdgeInsets.only(top: 15, left: 5),
              height: MediaQuery.of(context).size.height * 0.45,
              child: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return Column(children: [
                    Expanded(
                      child: ListView(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: CheckboxListTile(
                                  title: Text('Gallon'),
                                  value: checkboxValue1,
                                  onChanged: (bool? newValue) {
                                    setState(() {
                                      checkboxValue1 = newValue!;
                                    });
                                  },
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  activeColor: Color(0XFF007AFF),
                                ),
                              ),
                              Expanded(
                                child: RadioListTile<int>(
                                  title: const Text('Delivery'),
                                  value: 1,
                                  groupValue: radioValue,
                                  onChanged: (int? newValue) {
                                    setState(() {
                                      radioValue = newValue!;
                                    });
                                  },
                                  activeColor: Color(0XFF007AFF),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CheckboxListTile(
                                  title: Text('Barrel'),
                                  value: checkboxValue2,
                                  onChanged: (bool? newValue) {
                                    setState(() {
                                      checkboxValue2 = newValue!;
                                    });
                                  },
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  activeColor: Color(0XFF007AFF),
                                ),
                              ),
                              Expanded(
                                child: RadioListTile<int>(
                                  title: const Text('Pick-Up'),
                                  value: 2,
                                  groupValue: radioValue,
                                  onChanged: (int? newValue) {
                                    setState(() {
                                      radioValue = newValue!;
                                    });
                                  },
                                  activeColor: Color(0XFF007AFF),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CheckboxListTile(
                                  title: Text('ICB Tank'),
                                  value: checkboxValue3,
                                  onChanged: (bool? newValue) {
                                    setState(() {
                                      checkboxValue2 = newValue!;
                                    });
                                  },
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  activeColor: Color(0XFF007AFF),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CheckboxListTile(
                                  title: Text('Others'),
                                  value: checkboxValue4,
                                  onChanged: (bool? newValue) {
                                    setState(() {
                                      checkboxValue2 = newValue!;
                                    });
                                  },
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  activeColor: Color(0XFF007AFF),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 25),
                                child: Container(
                                  width: 195,
                                  child: Expanded(
                                    child: Text(
                                      "Disclaimer: The container used to deliver the water is provided solely for transportation and measurement reference.",
                                      style: AppStyles.bodyText5,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, top: 40),
                                child: Text(
                                  'Total Price: \n₱${calculateTotalPrice().toStringAsFixed(2)}',
                                  style: AppStyles.bodyText6,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    right: 10,
                                    left:
                                        20), // Add right margin to the first container
                                decoration: BoxDecoration(
                                  color: Color(
                                      0XFF007AFF), // Set the color of the circle
                                  shape: BoxShape.circle, // Make it circular
                                ),
                                child: IconButton(
                                  icon: const Icon(Icons.remove,
                                      color: Colors
                                          .white), // Set icon color to white
                                  onPressed: () {
                                    setState(() {
                                      if (counter > 0) counter--;
                                    });
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        8), // Add horizontal padding to the text
                                child: Text('$counter',
                                    style: const TextStyle(fontSize: 20)),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left:
                                        10), // Add left margin to the second container
                                decoration: BoxDecoration(
                                  color: Color(
                                      0XFF007AFF), // Set the color of the circle
                                  shape: BoxShape.circle, // Make it circular
                                ),
                                child: IconButton(
                                  icon: const Icon(Icons.add,
                                      color: Colors
                                          .white), // Set icon color to white
                                  onPressed: () {
                                    setState(() {
                                      counter++;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 90,
                              ),
                              Container(
                                width: 146,
                                height: 42, // Set the width of the container
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Navigate to Checkout page when pressed
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Checkout(title: 'Checkout')),
                                    );
                                  },
                                  child: const Text('BUY',
                                      style: TextStyle(fontSize: 20)),
                                  style: ElevatedButton.styleFrom(
                                    primary: const Color(0XFF007AFF),
                                    onPrimary: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ]);
                },
              ),
            ),
          ),
        );
      },
    );
  }

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
            title: 'Store Details',
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildProfileRow(screenWidth),
              buildTextSection(
                  screenHeight, screenWidth, 'About Us:', AppStyles.bodyText4),
              buildTextSection(
                screenHeight,
                screenWidth,
                'Aqua Atlan has been a local water refilling station for more than 7 years. We are always ready to serve you!',
                AppStyles.bodyText5,
              ),
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
              buildTextSection(
                screenHeight,
                screenWidth,
                'Water Volume Reference:',
                AppStyles.headline5,
              ),
              buildDisclaimerBanner(screenWidth, screenHeight),
              buildCardList(screenWidth),
              Container(
                  height: 100, color: const Color.fromARGB(255, 255, 255, 255)),
            ],
          ),
        ),
        floatingActionButton: SizedBox(
          width: 200,
          child: FloatingActionButton.extended(
            onPressed: () => showCupertinoPopup(context),
            label: const Text('BUY',
                style: TextStyle(color: Color(0xfff8f8f8), fontSize: 21)),
            backgroundColor: Color(0XFF007AFF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

  Widget buildProfileRow(double screenWidth) {
    double screenHeight = MediaQuery.of(context).size.height;

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
                Column(
                  children: [
                    SizedBox(height: 45),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Define your action here
                      },
                      icon: Icon(Icons.mail, color: Colors.white),
                      label: Text(
                        'Message',
                        style: GoogleFonts.poppins(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0XFF007AFF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRowWithTextAndButton(double screenHeight, double screenWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment
          .start, // Align children to the start of the cross axis
      children: [
        buildTextSection(screenHeight, screenWidth, '10:00 AM - 4:30 PM',
            AppStyles.bodyText6),
        ElevatedButton(
          onPressed: () {
            // Define your action here
          },
          child: const Text(
            'Open',
            style: TextStyle(
                color: Color(0XFF007AFF),
                fontSize: 16), // Text color set to white
          ),
          style: ElevatedButton.styleFrom(
            primary: Color(0xfff8f8f8),
            elevation: 0,
          ),
        ),
      ],
    );
  }

  Widget buildTextSection(
      double screenHeight, double screenWidth, String text, TextStyle style) {
    return Padding(
      padding: EdgeInsets.only(
          left: 10, // Set or reduce the left padding as needed
          top: screenHeight * 0.01),
      child: Text(text, style: style),
    );
  }

  Widget buildTextSection2(
      double screenHeight, double screenWidth, String text, TextStyle style) {
    return Padding(
      padding: EdgeInsets.only(
          left: 10, // Set or reduce the left padding as needed
          top: screenHeight * 0.00),
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

  Widget reviewRating(double screenHeight, double screenWidth) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTextSection(
                screenHeight, screenWidth, 'Aqua Atlan', AppStyles.headline5),
            buildTextSection2(screenHeight, screenWidth, 'View profile Rating',
                AppStyles.bodyText1),
          ],
        ),
      ],
    );
  }

  Widget viewProfileRating(
      double screenHeight, double screenWidth, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        reviewRating(screenHeight, screenWidth),
        SizedBox(width: 150),
        Row(
          // Inner row
          children: [
            SizedBox(height: 50),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => StoreRating(
                            title: '',
                          )),
                );
              },
              child: right(),
            ),
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
  Widget messageIcon() => Image.asset('assets/Order/messageIcon.png');
  Widget right() => Image.asset('assets/Main/right.png');
}
