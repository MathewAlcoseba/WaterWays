import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waterways/OrderManagement/order_status.dart';
import 'package:waterways/bottom-navbar.dart';

void main() {
  runApp(PurchaseHistory(title: 'Purchase History'));
}

class PurchaseHistory extends StatelessWidget {
  const PurchaseHistory({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 90,
          title: RichText(
            textAlign: TextAlign.left,
            text: TextSpan(
              text: "Purchase history",
              style: GoogleFonts.poppins(
                fontSize: 26,
                fontWeight: FontWeight.w600,
                color: Color(0xFF313144),
              ),
              children: <TextSpan>[
                TextSpan(
                  text: '\nPurchase history details',
                  style: GoogleFonts.gothicA1(
                    color: Color(0xFF6F6F6F),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
          ),
        ),
        body: Center(
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  child: whiteRectangleWithShadow(
                      aquaatlan(), 'Aqua Atlan', '9:30 AM'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrderStatus(title: 'Your Title'),
                      ),
                    );
                  },
                ),
                whiteRectangleWithShadow(aquabest(), 'Aqua Best', '11:11 AM'),
                whiteRectangleWithShadow(aquaquest(), 'Aqua Quest', '3:45 PM'),
                whiteRectangleWithShadow(
                    aguabendita(), 'Agua Bendita', '1:20 PM'),
                whiteRectangleWithShadow(agwa(), 'Agwa', '10:10 AM'),
                whiteRectangleWithShadow(aquaman(), 'Aquaman', '2:22 PM'),
              ],
            ),
          ),
        ),
        //bottomNavigationBar: BottomNavBar(),
      ),
    );
  }

  Widget whiteRectangleWithShadow(Widget image, String text, String timeStamp) {
    return Container(
      width: 380.0,
      height: 90.0,
      margin: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: image,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Order Description',
                    style: GoogleFonts.poppins(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 4.0, right: 10.0), // Adjust the padding as needed
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  timeStamp,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Image.asset(
                  'assets/Main/right.png',
                  width: 40,
                ), // Right-side image
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Image Widgets
  Widget aquaatlan() => Image.asset('assets/Order/AquaAtlanMini.png');
  Widget aquabest() => Image.asset('assets/Order/AquaBestMini.png');
  Widget aquaquest() => Image.asset('assets/Order/AquaQuestMini.png');
  Widget aguabendita() => Image.asset('assets/Order/AguaBenditaMini.png');
  Widget agwa() => Image.asset('assets/Order/AgwaMini.png');
  Widget aquaman() => Image.asset('assets/Order/AquamanMini.png');
}
