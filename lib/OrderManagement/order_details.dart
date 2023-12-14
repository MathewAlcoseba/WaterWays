import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waterways/OrderManagement/checkout.dart';
import 'package:waterways/OrderManagement/custom_appbar_storedetails.dart';
import 'package:waterways/OrderManagement/store_rating.dart';
import 'package:waterways/app_styles.dart';
import 'package:waterways/models/users.dart';

// void main() {
//   runApp(const OrderDetails(customer: Customer, store: Store));
// }

class OrderDetails extends StatefulWidget {
  final Customer customer;
  final Store store;
  const OrderDetails({super.key, required this.customer, required this.store});

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
    const double pricePerGallon = 25.0;
    const double pricePerBarrel = 300.0;
    const double pricePerICBTank = 1000.0;
    const double pricePerOthers = 30.0;
    const double radioOption1Price = 25.0;
    const double radioOption2Price = 0.0;

    double calculateTotalPrice() {
      double totalPrice = 0.0;
      if (checkboxValue1) totalPrice += pricePerGallon;
      if (checkboxValue2) totalPrice += pricePerBarrel;
      if (checkboxValue3) totalPrice += pricePerICBTank;
      if (checkboxValue4) totalPrice += pricePerOthers;
      if (radioValue == 1) totalPrice += radioOption1Price;
      if (radioValue == 2) totalPrice += radioOption2Price;

      return totalPrice * counter;
    }

    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoPopupSurface(
          child: Material(
            child: Container(
              padding: const EdgeInsets.only(top: 15, left: 5),
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
                                  title: const Text('Gallon'),
                                  value: checkboxValue1,
                                  onChanged: (bool? newValue) {
                                    setState(() {
                                      checkboxValue1 = newValue!;
                                    });
                                  },
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  activeColor: const Color(0XFF007AFF),
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
                                  activeColor: const Color(0XFF007AFF),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CheckboxListTile(
                                  title: const Text('Barrel'),
                                  value: checkboxValue2,
                                  onChanged: (bool? newValue) {
                                    setState(() {
                                      checkboxValue2 = newValue!;
                                    });
                                  },
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  activeColor: const Color(0XFF007AFF),
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
                                  activeColor: const Color(0XFF007AFF),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CheckboxListTile(
                                  title: const Text('ICB Tank'),
                                  value: checkboxValue3,
                                  onChanged: (bool? newValue) {
                                    setState(() {
                                      checkboxValue2 = newValue!;
                                    });
                                  },
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  activeColor: const Color(0XFF007AFF),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CheckboxListTile(
                                  title: const Text('Others'),
                                  value: checkboxValue4,
                                  onChanged: (bool? newValue) {
                                    setState(() {
                                      checkboxValue2 = newValue!;
                                    });
                                  },
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  activeColor: const Color(0XFF007AFF),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 25),
                                child: SizedBox(
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
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(right: 10, left: 20),
                                decoration: const BoxDecoration(
                                  color: Color(0XFF007AFF),
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  icon: const Icon(Icons.remove,
                                      color: Colors.white),
                                  onPressed: () {
                                    setState(() {
                                      if (counter > 0) counter--;
                                    });
                                  },
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Text('$counter',
                                    style: const TextStyle(fontSize: 20)),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 10),
                                decoration: const BoxDecoration(
                                  color: Color(0XFF007AFF),
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  icon: const Icon(Icons.add,
                                      color: Colors.white),
                                  onPressed: () {
                                    setState(() {
                                      counter++;
                                    });
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 90,
                              ),
                              SizedBox(
                                width: 146,
                                height: 42,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Checkout(
                                              customer: widget.customer)),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: const Color(0XFF007AFF),
                                  ),
                                  child: const Text('BUY',
                                      style: TextStyle(fontSize: 20)),
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
                widget.store.storeBio,
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
            backgroundColor: const Color(0XFF007AFF),
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

    return SizedBox(
      height: screenHeight * 0.2,
      child: Stack(
        children: [
          banner(),
          Positioned(
            top: screenHeight * 0.09,
            left: screenWidth * 0.28,
            child: Text(widget.store.storeName, style: AppStyles.headline6),
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
                    const SizedBox(height: 45),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.mail, color: Colors.white),
                      label: Text(
                        'Message',
                        style: GoogleFonts.poppins(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0XFF007AFF),
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildTextSection(screenHeight, screenWidth, widget.store.storeHours,
            AppStyles.bodyText6),
        ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xfff8f8f8),
              elevation: 0,
            ),
            child: Container(
              width: 55,
              height: 20,
              decoration: BoxDecoration(
                color: widget.store.isAvailable
                    ? AppStyles.colorScheme.secondary
                    : AppStyles.colorScheme.tertiary,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: Text(
                  widget.store.isAvailable ? "open" : "closed",
                  style: AppStyles.bodyText3.copyWith(
                    color: AppStyles.colorScheme.primary,
                  ),
                ),
              ),
            )),
      ],
    );
  }

  Widget buildTextSection(
      double screenHeight, double screenWidth, String text, TextStyle style) {
    return Padding(
      padding: EdgeInsets.only(left: 10, top: screenHeight * 0.01),
      child: Text(text, style: style),
    );
  }

  Widget buildTextSection2(
      double screenHeight, double screenWidth, String text, TextStyle style) {
    return Padding(
      padding: EdgeInsets.only(left: 10, top: screenHeight * 0.00),
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
          decoration: const BoxDecoration(color: Color(0xFFF2F2F2)),
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
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          String assetName = 'assets/Order/Card${index + 1}.png';
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.01),
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
      decoration: const BoxDecoration(color: Color(0xFFEBEBEB)),
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
        const SizedBox(width: 150),
        Row(
          children: [
            const SizedBox(height: 50),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => StoreRating(
                            customer: widget.customer,
                            store: widget.store,
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

  Widget banner() => Image.network(widget.store.coverImg);
  Widget stockIcon() => Image.asset('assets/Order/stockIcon.png');
  Widget profileIcon() => Image.network(widget.store.profileImg);
  Widget rating() => Image.asset('assets/Order/yellowStars.png');
  Widget dot() => Image.asset('assets/Order/dot.png');
  Widget messageIcon() => Image.asset('assets/Order/messageIcon.png');
  Widget right() => Image.asset('assets/Main/right.png');
}
