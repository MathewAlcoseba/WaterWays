import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waterways/OrderManagement/successful_purchase.dart';
import 'package:waterways/bottom-navbar.dart';

void main() {
  runApp(const Checkout(
    title: '',
  ));
}

class Checkout extends StatelessWidget {
  const Checkout({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
          child: Container(
            width: 500,
            height: 1100,
            child: Stack(
              children: <Widget>[
                Positioned(
                  child: Container(
                    child: header(),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 23,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      child: left(),
                    ),
                  ),
                ),
                Positioned(
                  top: 35,
                  left: 65,
                  child: Text(
                    'Checkout',
                    style: GoogleFonts.poppins(
                      color: Color(0xFF313144),
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                //item card with details

                Stack(
                  children: [
                    Positioned(
                      top: 95,
                      left: 23,
                      child: Text(
                        'Aqua Atlan',
                        style: GoogleFonts.poppins(
                          color: Color(0xFF313144),
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 97,
                      left: 5,
                      child: Container(
                        height: 180,
                        width: 401,
                        decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(17.0),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey, // Color of the shadow
                              blurRadius: 5.0, // Spread of the shadow
                              offset: Offset(0, 3), // Offset of the shadow
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 145,
                      left: 23,
                      child: Container(
                        child: card(),
                      ),
                    ),
                    Positioned(
                      top: 145,
                      left: 200,
                      child: Text(
                        '''Barrel ( 200 Liters )
Delivery
₱12.00
''',
                        style: GoogleFonts.gothicA1(
                          color: Color(0xFF7F8184),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 240,
                      right: 25,
                      child: Text(
                        'x3',
                        style: GoogleFonts.gothicA1(
                          color: Color(0xFF7F8184),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),

                //shipping details

                Stack(
                  children: [
                    Positioned(
                      top: 285,
                      left: 0,
                      child: Container(
                        width: 447,
                        height: 142,
                        decoration: BoxDecoration(
                          color: Color(
                              0xFFDAEEF7), // Color with the hex value DAEEF7
                          border: Border.all(
                            color: Color(
                                0xFF215AFF), // Color with the hex value 215AFF
                            width: 1.0, // 1px thickness
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 295,
                      left: 15,
                      child: Text(
                        'Shipping Option',
                        style: GoogleFonts.jost(
                          color: Color(0xFF3EA0C6),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 330,
                      left: 15,
                      child: Container(
                        height: 1,
                        width: 380,
                        decoration: BoxDecoration(
                          color: Color(0xFF215AFF),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 350,
                      left: 15,
                      child: Container(
                        child: delivery(),
                      ),
                    ),
                    Positioned(
                      top: 348,
                      left: 40,
                      child: Text(
                        'Standard Local',
                        style: GoogleFonts.jost(
                          color: Color(0xFF215AFF),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 348,
                      right: 20,
                      child: Text(
                        'P320.00',
                        style: GoogleFonts.jost(
                          color: Color(0xFF616161),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 390,
                      left: 15,
                      child: Text(
                        'Recieve within 48 hours',
                        style: GoogleFonts.jost(
                          color: Color(0xFF1A1A1A),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),

                //details
                Stack(
                  children: [
                    Positioned(
                      top: 440,
                      left: 15,
                      child: Container(
                        child: clipboard(),
                      ),
                    ),
                    Positioned(
                      top: 438,
                      left: 40,
                      child: Text(
                        'Order Total ( 3 Items )',
                        style: GoogleFonts.jost(
                          color: Color(0xFF1a1a1a),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 433,
                      right: 20,
                      child: Text(
                        '₱7520.00',
                        style: GoogleFonts.poppins(
                          color: Color(0xFF313144),
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          height: 1.5,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 490,
                      left: 15,
                      child: Container(
                        child: wallet(),
                      ),
                    ),
                    Positioned(
                      top: 488,
                      left: 40,
                      child: Text(
                        'Payment Option',
                        style: GoogleFonts.jost(
                          color: Color(0xFF1a1a1a),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 560,
                      left: 15,
                      child: Text(
                        '''Product Subtotal
Delivery Subtotal
Add-on Subtotal
''',
                        style: GoogleFonts.jost(
                          color: Color(0xFF616161),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 560,
                      right: 15,
                      child: Text(
                        '''720
320
150
''',
                        style: GoogleFonts.jost(
                          color: Color(0xFF616161),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 670,
                      right: 20,
                      child: Text(
                        '₱7520.00',
                        style: GoogleFonts.poppins(
                          color: Color(0xFF313144),
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          height: 1.5,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 670,
                      left: 20,
                      child: Text(
                        'Total Payment',
                        style: GoogleFonts.poppins(
                          color: Color(0xFF313144),
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),

                //place order section
                Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: Container(
                        height: 100,
                        width: 410,
                        decoration: BoxDecoration(
                          color: Color(0xFFF3F3F3),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  SuccessfulPurchase(title: 'Your Title'),
                            ),
                          );
                        },
                        child: Container(
                          height: 100,
                          width: 184,
                          decoration: BoxDecoration(
                            color: Color(0xFF007AFF),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 35,
                      right: 20,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  SuccessfulPurchase(title: 'Your Title'),
                            ),
                          );
                        },
                        child: Text(
                          'Place Order',
                          style: GoogleFonts.poppins(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 55,
                      right: 200,
                      child: Text(
                        'Total Payment',
                        style: GoogleFonts.jost(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 25,
                      right: 195,
                      child: Text(
                        '₱7520.00',
                        style: GoogleFonts.poppins(
                          color: Color(0xFF313144),
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),

                //nav bar footer

                Stack(
                  children: [
                    Positioned(
                      top: 95,
                      left: 23,
                      child: Text(
                        'Aqua Atlan',
                        style: GoogleFonts.poppins(
                          color: Color(0xFF313144),
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    // Add other widgets on top of or below this stack as needed
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  Widget left() => Container(
        child: Image.asset('assets/Main/left.png'),
      );
  Widget card() => Container(
        child: Image.asset('assets/Order/AquaAtlanSmall.png'),
      );
  Widget header() => Container(
        child: Image.asset('assets/Order/header.png'),
      );
  Widget wallet() => Container(
        child: Image.asset('assets/Order/wallet.png'),
      );
  Widget delivery() => Container(
        child: Image.asset('assets/Order/delivery.png'),
      );
  Widget clipboard() => Container(
        child: Image.asset('assets/Order/clipboard.png'),
      );
  Widget home() => Container(
        child: Image.asset('assets/Main/home.png'),
      );
  Widget notifications() => Container(
        child: Image.asset('assets/Main/heart.png'),
      );
  Widget search() => Container(
        child: Image.asset('assets/Main/search.png'),
      );
  Widget profile() => Container(
        child: Image.asset('assets/Main/profile.png'),
      );
}
