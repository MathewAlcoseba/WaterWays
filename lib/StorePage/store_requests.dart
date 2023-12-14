import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waterways/OrderManagement/order_status.dart';
import 'package:waterways/StorePage/store_order_details.dart';
import 'package:waterways/models/users.dart';

// void main() {
//   runApp(StoreRequestsPage(title: ' Orders'));
// }

class StoreRequestsPage extends StatelessWidget {
  const StoreRequestsPage({Key? key, required this.customer}) : super(key: key);
  final Customer customer;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        initialIndex: 0, // Set initial index to 0 for 'On Going'
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 90,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.pop(context); // Pop the current screen
              },
            ),
            title: RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                text: "Order History",
                style: GoogleFonts.poppins(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF313144),
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: '\nOrder History Details',
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
            bottom: TabBar(
              labelColor: Color(0xFF007AFF), // Set the selected label color
              unselectedLabelColor:
                  Color(0xFF313144), // Set the unselected label color
              labelStyle: GoogleFonts.poppins(
                // Apply Poppins font for labels
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                  color:
                      Color(0xFF007AFF), // Set the indicator (underline) color
                  width: 2.0,
                ),
              ),
              tabs: [
                Tab(text: 'On Going'),
                Tab(text: 'Completed'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              _buildOnGoingTab(context),
              _buildCompletedTab(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCompletedTab() {
    return SingleChildScrollView(
      // Use SingleChildScrollView for scrollable content
      child: Column(
        children: [
          whiteRectangleWithShadow(aquabest(), 'Aqua Best', '11:11 AM'),
          whiteRectangleWithShadow(aquaquest(), 'Aqua Quest', '3:45 PM'),
          whiteRectangleWithShadow(aguabendita(), 'Agua Bendita', '1:20 PM'),
          whiteRectangleWithShadow(agwa(), 'Agwa', '10:10 AM'),
          whiteRectangleWithShadow(aquaman(), 'Aquaman', '2:22 PM'),
        ],
      ),
    );
  }

  Widget _buildOnGoingTab(BuildContext context) {
    return SingleChildScrollView(
      // Use SingleChildScrollView for scrollable content
      child: Column(
        children: [
          GestureDetector(
            child:
                whiteRectangleWithShadow(aquaatlan(), 'Aqua Atlan', '9:30 AM'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => StoreOrderStatus(
                          customer: customer,
                        )),
              );
            },
          ),
        ],
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
            padding: EdgeInsets.only(top: 4.0, right: 10.0),
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget aquaatlan() => Image.asset('assets/Order/AquaAtlanMini.png');
  Widget aquabest() => Image.asset('assets/Order/AquaBestMini.png');
  Widget aquaquest() => Image.asset('assets/Order/AquaQuestMini.png');
  Widget aguabendita() => Image.asset('assets/Order/AguaBenditaMini.png');
  Widget agwa() => Image.asset('assets/Order/AgwaMini.png');
  Widget aquaman() => Image.asset('assets/Order/AquamanMini.png');
  Widget left() => Image.asset('assets/Main/left.png');
}
